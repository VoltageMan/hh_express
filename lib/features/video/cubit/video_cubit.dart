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

  Future<void> getVideos({bool forRefresh = false}) async {
    emit(
      VideoState(
        apiState: getLoadingState(forRefresh),
        models: List.from(state.models),
        pagination: state.pagination,
      ),
    );
    if (forRefresh) {
      state.models.clear();
    }
    final response =
        await _repo.getVideos((state.pagination?.currentPage ?? 0) + 1);
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
        apiState: getErrorState(forRefresh),
        models: List.from(state.models),
        pagination: state.pagination,
      ),
    );
  }

  VideoAPIState getLoadingState(bool forRefresh) =>
      state.pagination == null || forRefresh
          ? VideoAPIState.loading
          : VideoAPIState.loadingMore;

  VideoAPIState getErrorState(bool forRefresh) =>
      state.pagination == null || forRefresh
          ? VideoAPIState.error
          : VideoAPIState.errorMore;
}
