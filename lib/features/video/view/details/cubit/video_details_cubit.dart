import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  final int initIndex;

  VideoDetailsCubit(this.initIndex)
      : super(VideoDetailsState(currentPage: initIndex, lastPage: initIndex));

  void changePage(int index) {
    emit(
      VideoDetailsState(
        currentPage: index,
        lastPage: state.currentPage,
      ),
    );
  }
}
