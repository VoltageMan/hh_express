import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/cart/cart_model.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_avif/flutter_avif.dart';

// final avifImage =
//     'https://aomediacodec.github.io/av1-avif/testFiles/Link-U/hato.profile0.8bpc.yuv420.no-cdef.avif';

//   final dio = Dio();
//   Future some() async {
//     try {
//       final tempDir = await getTemporaryDirectory().then((value) => value.path);
//       // final fileName = await path.replaceFirst('https://', '' );

//       final file = await File('$tempDir/theImage.avif').create();
//       await file.exists()
//         ..log();
//       final response = await dio.download(
//         avifImage,
//         file.path,
//         onReceiveProgress: (count, total) {
//           if (total != -1) {
//             ((count / total * 100).toStringAsFixed(0) + "%")
//                 .log(message: 'ressives');
//           }
//         },
//       );
//     } catch (e, st) {
//       e.log(message: 'downloadingError');
//     }
//   }

//   Future<File> checkSize() async {
//     final tempDir = await getTemporaryDirectory().then((value) => value.path);
//     // final fileName = await path.replaceFirst('https://', '' );

//     final file = await File('$tempDir/theImage.avif').create();
//     await file.exists();
//     file.stat().then((value) => value.size.log());
//     return file;
//   }

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.data.toString().log();
          options.baseUrl.log();
          // options.path.log();
          options.headers.log();
          handler.next(options);
        },
        onError: (e, handler) {
          handler.next(e);
        },
        onResponse: (e, handler) {
          handler.next(e);
        },
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyDarkTextButton(
          title: 'Fetch Data',
          width: 250.w,
          onTap: () async {
            final token = '1|DrHzJugoiAXT1zLovJVLfLgZ5xA8I6FxNQTN8St6ad95ad08';
            final model = CartModel(
              productId: 1,
              properties: [
                1,
              ],
            );
            try {
              final some = await dio
                  .get(
                      (EndPoints.baseUrl + EndPoints.currentCart)
                        ..log(message: 'url'),
                      options: Options(
                        headers: {
                          'Authorization': 'Bearer $token',
                        },
                      ),
                      data: model.toJson()
                        ..addAll({
                          'quantity': 1,
                        }))
                  .then((value) {
                value.log();
              });
            } catch (e) {
              e.log();
            }
          },
        ),
      ),
    );
  }
}
