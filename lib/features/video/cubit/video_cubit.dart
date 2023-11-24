import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/models/pagination/pagination_model.dart';
import 'package:hh_express/models/videos/video_model.dart';
import 'package:hh_express/repositories/video/video_repo.dart';
import 'package:hh_express/settings/enums.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoState(apiState: VideoAPIState.init));

  final _repo = getIt<VideoRepo>();

  Future<void> loadMore({bool forRefresh = false}) async {
    emit(
      VideoState(
        apiState: VideoAPIState.loadingMore,
        models: List.from(state.models),
        pagination: state.pagination,
      ),
    );

    final response = await _repo.getVideos(state.pagination!.currentPage + 1);
    if (response != null) {
      return emit(
        VideoState(
          apiState: VideoAPIState.success,
          models: List.from(state.models)..addAll(response.data),
          pagination: response.pagination,
        ),
      );
    }
    emit(
      VideoState(
        apiState: VideoAPIState.errorMore,
        models: List.from(state.models),
        pagination: state.pagination,
      ),
    );
  }

  Future<void> init({bool forUpdate = false}) async {
    final apiState = state.apiState;
    if (apiState != VideoAPIState.init &&
        apiState != VideoAPIState.error &&
        !forUpdate) {
      return;
    }
    emit(
      VideoState(
        apiState: VideoAPIState.loading,
        models: List.empty(),
        pagination: state.pagination,
      ),
    );
    final response = await _repo.getVideos(1);
    if (response != null) {
      return emit(
        VideoState(
          apiState: VideoAPIState.success,
          models: List.from(response.data),
          pagination: response.pagination,
        ),
      );
    }
    emit(
      VideoState(
        apiState: VideoAPIState.error,
        models: List.empty(),
        pagination: state.pagination,
      ),
    );
  }
}
