import 'package:flutter/material.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/repositories/video/video_repo.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final repo = getIt<VideoRepo>();
  @override
  void initState() {
    repo.getVideos(1);
    pageController.addListener(() {
      final currentPage = (pageController.page ?? 0).toInt()..log();
      if (currentIndex != currentPage) {
        currentIndex.value = currentPage;
      }
    });
    LocalStorage.init();
    super.initState();
  }

  final list = [
    'https://v.gozle.com.tm/3/media/video/6y6qVIYqtYA/video.m3u8',
    'https://bravo.horjuntv.com.tm/onlinetv2/2022/12/17/942146LUUGEMLKN/942146LUUGEMLKN.m3u8',
    'https://bravo.horjuntv.com.tm/onlinetv1/2023/01/23/94718KVQIlSOSJk/94718KVQIlSOSJk.m3u8',
    'https://v.gozle.com.tm/3/media/video/C-BZzAkZRbs/video.m3u8',
  ];
  final pageController = PageController();
  final currentIndex = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return null;
        
          // return MyCachedNetworkImage(
          //   index: index,
          //   pageController: currentIndex,
          //   src: list[index],
          // );
        },
      ),
    );
  }
}


// enableAudioTracks: false,
// enableSubtitles: false,
// enableMute: false,
// enableQualities: false,
// enableOverflowMenu: false,
// enablePip: false,
// enableProgressBarDrag: false,
// enableFullscreen: false,
// enableSkips: false,
// enableProgressBar: false,
// enablePlayPause: false,
// enablePlaybackSpeed: false,
// enableProgressText: false,
