import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_avif/flutter_avif.dart';

final avifImage =
    'https://aomediacodec.github.io/av1-avif/testFiles/Link-U/hato.profile0.8bpc.yuv420.no-cdef.avif';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  void didUpdateWidget(covariant TestScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  final dio = Dio();
  Future some() async {
    try {
      final tempDir = await getTemporaryDirectory().then((value) => value.path);
      // final fileName = await path.replaceFirst('https://', '' );

      final file = await File('$tempDir/theImage.avif').create();
      await file.exists()
        ..log();
      final response = await dio.download(
        avifImage,
        file.path,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            ((count / total * 100).toStringAsFixed(0) + "%")
                .log(message: 'ressives');
          }
        },
      );
    } catch (e, st) {
      e.log(message: 'downloadingError');
    }
  }

  Future<File> checkSize() async {
    final tempDir = await getTemporaryDirectory().then((value) => value.path);
    // final fileName = await path.replaceFirst('https://', '' );

    final file = await File('$tempDir/theImage.avif').create();
    await file.exists();
    file.stat().then((value) => value.size.log());
    return file;
  }

  @override
  Widget build(BuildContext context) {
    // PlatformAssetBundle().l
    // some();
    // checkSize();
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 300.h,
          child: CachedNetworkImage(
            imageUrl: avifImage,
            imageBuilder: (context, imageProvider) {
              'imageee'.log();


              return Image(
                image: imageProvider,
              );
            },
            placeholder: (context, url) {
              return CircularProgressIndicator();
            },
            errorWidget: (context, url, error) {
              return Text(
                '$error',
              );
            },
          ),
        ),
      ),
    );
  }
}

///!!!!
///!
///!
///!
///!
///!
///!
///!

final imgUrl =
    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";
var dio = Dio();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, this.title});

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 500) < 500;
          },
        ),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'NullTiitle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () async {
                var tempDir = await getTemporaryDirectory();
                String fullPath = tempDir.path + "/boo2.pdf'";
                print('full path ${fullPath}');

                download2(dio, imgUrl, fullPath);
              },
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
              color: Colors.green,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: TextStyle(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
