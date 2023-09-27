import 'package:flutter/material.dart';
import 'package:hh_express/app/setup.dart';
import 'package:hh_express/repositories/filters/filters_repository.dart';

final class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int selectedIndex = 1;

  final repo = getIt<FilterRepo>();
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
                onPressed: () async {},
              ),
            ],
          ),
          body: FutureBuilder(
            future: repo.getProps(),
            builder: (context, snap) {
              if (snap.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final data = snap.data!;
              return ListView.custom(
                childrenDelegate: SliverChildListDelegate(
                  [
                    ...data
                        .map(
                          (e) => SizedBox(),
                        )
                        .toList()
                    // SizedBox(height: 10.h),
                    // SingleChildScrollView(
                    //   child: Wrap(
                    //     spacing: 10.w,
                    //     children: [
                    //       ...List.generate(
                    //         3,
                    //         (index) => SelectedFilterPropWidget(
                    //           value: 'SomeThign',
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 10.h),
                    // SingleChildScrollView(
                    //   child: Row(
                    //     children: [
                    //       ...List.generate(
                    //         6,
                    //         (index) => index % 2 == 0
                    //             ? SizedBox(width: 5)
                    //             : FilterColorWidget(
                    //                 onTap: () {
                    //                   selectedIndex = index;
                    //                   setState(() {});
                    //                 },
                    //                 color: AssetsPath.exampleColor,
                    //                 isSelected: selectedIndex == index,
                    //               ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SingleChildScrollView(
                    //   child: Row(
                    //     children: [
                    //       ...List.generate(
                    //         6,
                    //         (index) => index % 2 == 0
                    //             ? SizedBox(width: 5)
                    //             : FilterPropWidget(
                    //                 title: 'kuku ',
                    //               ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: AppPaddings.all_12,
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       RemoveAllSeleteds(),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
