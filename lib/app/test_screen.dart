import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/settings/theme.dart';
import 'package:hh_express/features/cart/view/widget.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              ),
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Colors.black,
                ),
                color: Colors.red,
                onPressed: () async {
                  final mains = await PlatformAssetBundle()
                      .loadString(AssetsPath.mainCats);

                  mains.log();
                },
              ),
            ],
          ),
          body: ListView.custom(
            childrenDelegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 20,
                ),
                //
                Container(
                  color: Colors.amber,
                  height: 93.6,
                  width: double.infinity,
                ),
                // CartHeight(),
                CartWidget(
                  0,
                  onChange: (p0) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
