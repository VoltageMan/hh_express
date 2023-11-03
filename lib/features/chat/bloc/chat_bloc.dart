import 'dart:developer';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/chat/bloc/chat_events.dart';
import 'package:hh_express/features/chat/bloc/chat_state.dart';
import 'package:hh_express/features/chat/models/message.dart';
import 'package:hh_express/repositories/chat/chat_repository.dart';
import 'package:hh_express/settings/enums.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    final repo = getIt<ChatRepo>();
    on<AddMessageToListEvent>((event, emit) async {
      await Future.delayed(
        Duration(
          seconds: 1,
        ),
      );
      var newSet = state.messages;
      final newList = newSet?.toList()
        ?..insert(
          0,
          event.message,
        );
      newSet = newList?.toSet();
      emit(
        state.update(
          messages: newSet,
        ),
      );
      print('last message image - ${state.messages?.last.image}');
      return;
    });
    on<GetMessagesListEvent>((event, emit) async {
      emit(
        state.update(
          messagesListState: APIState.loading,
          gettingNewPage: event.gettinNewPage,
        ),
      );
      final data = await repo.getMessagesList(event.page);
      if (data.success) {
        final chatState = ChatState.fromMap(data.data);
        if (!event.gettinNewPage) {
          connectToWebsocket(chatState.conversation?.id ?? 0);
        }
        emit(
          state.update(
            messagesListState: APIState.success,
            messages:
                state.messages == null ? chatState.messages : state.messages
                  ?..addAll(chatState.messages!),
            conversation: chatState.conversation,
            currentPage: chatState.currentPage,
            notification_count: chatState.notification_count,
            lastPage: chatState.lastPage,
          ),
        );
        return;
      }
      emit(
        state.update(
          messagesListState: APIState.error,
          errorMessage: data.error,
        ),
      );
    });

    on<SendMessageEvent>(
      (event, emit) async {
        final response = await repo.sendMessage(
          type: event.file != null ? 'file' : 'text',
          file: event.file,
          message: event.message,
        );
        final message = Message.fromMap(response.data['message']);
        add(
          AddMessageToListEvent(
            message: Message(
              image: event.file,
              date: message.body,
              id: message.id,
              is_owner: message.is_owner,
              body: message.body,
              type: message.type,
              hour: message.hour,
            ),
          ),
        );
      },
    );
  }

  final wsUrl =
      'ws://216.250.9.74:6001/app/asmanKbdgI?protocol=7&client=js&version=4.3.1&flash=false';
  final authEndpoint = 'http://216.250.9.74/api/broadcasting/auth';
  late PusherChannelsClient pusher;

  void connectToWebsocket(int conversationId) async {
    late PusherChannelsOptions options;

    options = const PusherChannelsOptions.fromHost(
      host: '216.250.9.74',
      port: 6001,
      scheme: 'ws',
      key: 'asmanKbdgI',
      metadata: PusherChannelsOptionsMetadata(
        client: 'js',
        protocol: 7,
        version: '4.3.1',
      ),
    );
    pusher = PusherChannelsClient.websocket(
      options: options,
      connectionErrorHandler: (dynamic exception, trace, refresh) {
        refresh();
      },
    );

    PusherChannelsPackageLogger.enableLogs();
    final token = LocalStorage.getToken;

    await pusher.connect();
    print('TOKEN - - - - -$token');
    final channel = pusher.privateChannel('User.Chat.$conversationId',
        authorizationDelegate:
            EndpointAuthorizableChannelTokenAuthorizationDelegate
                .forPrivateChannel(
          authorizationEndpoint: Uri.parse(authEndpoint),
          headers: {'Authorization': 'Bearer $token'},
          onAuthFailed: (exception, trace) {
            log('FAIL - ${(exception as EndpointAuthorizableChannelTokenAuthorizationException).response.body}, ${(exception).response.statusCode}, stack --- $trace');
          },
        ));
    channel.bind('MessageCreated').listen((event) {
      log('MESSAGE - - - -  ${event.data}');
      final message = Message.fromJson(event.data);
      add(AddMessageToListEvent(message: message));
    });
    channel.subscribe();
  }
}

// User.Chat.{conversation_id}
// }
