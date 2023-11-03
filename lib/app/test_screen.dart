import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/data/local/secured_storage.dart';
import 'package:hh_express/data/remote/dio_client.dart';
import 'package:hh_express/features/components/my_text_button.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/repositories/address/address_repo.dart';
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

class _TestScreenState extends State<TestScreen> with DioClientMixin {
  final focus = FocusNode();
  final controller = TextEditingController();

  final scrollController = ScrollController();
  @override
  void initState() {
    LocalStorage.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;
    return Scaffold(
      // backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          // height: 40.h,
          width: 246.w,
          color: Colors.white,
          margin: AppPaddings.all_12,
          padding: AppPaddings.vertic_6,
          child: MyDarkTextButton(
            title: 'FEthc',
            onTap: () async {
              '13|X4vYRFnzqSGIRaihUm0HsY9JoNCe77mZIOZ3mJTM98c453dd';
              final token = LocalStorage.getToken..log();
              // await dio.get(
              //   endPoint: EndPoints.addressList,
              //   data: {
              //     'address': 'Chehow',
              //   },
              // );

              final repo = getIt<AddressRepo>();
              repo.create('blabla').then((value) => value.log());
            },
            width: 200.w,
          ),
        ),
      ),
    );
  }
}
