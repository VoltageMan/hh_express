import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/models/cart/cart_model/cart_model.dart';
import 'package:hh_express/models/cart/cart_update/cart_update_model.dart';
import 'package:hh_express/models/products/product_model.dart';
import 'package:hh_express/settings/consts.dart';

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
          options.data.toString().log(message: 'sent Data');
          options.baseUrl.log();
          // options.path.log();
          options.headers.log();
          handler.next(options);
        },
        onError: (e, handler) {
          handler.next(e);
        },
        onResponse: (e, handler) {
          e.statusCode.log(message: 'Response Status code');
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
            final token = LocalStorage.getToken;
            final model = CartUpdateModel(
              productId: 2,
              quantity: 1,
              properties: [
                1,
              ],
            );

            try {
              final some = await dio
                  .delete(
                (EndPoints.baseUrl + EndPoints.clearCart)..log(message: 'url'),
                options: Options(
                  headers: {
                    'Authorization': 'Bearer $token',
                  },
                ),
                data: model.toJson()
                  ..remove(
                    'properties',
                  ),
              )
                  .then((value) {
                value.log();

                final model = ((value.data as Map<String, dynamic>)['data']
                    as Map<String, dynamic>);
                final cartMode =
                    CartModel.fromJson(model['cart'] as Map<String, dynamic>)
                      ..toJson().log(message: 'Cart Model');
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

var data = {
  'uuid': '34b5-h343-235dw',
  'total': '500 Tmt',
  'weight_cost': '100 Tmt',
  'delivery_cost': '50 Tmt',
  'sub_total': '650 Tmt',
  'products': [
    {
      'quantity': 2,
      'selected_properties_id': [],
      'product': {'productModel'}
    },
    {
      'quantity': 3,
      'selected_properties_id': [],
      'product': {'productModel'}
    }
  ],
};
