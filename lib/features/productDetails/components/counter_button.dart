import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/components/confirm_some.dart';
import 'package:hh_express/helpers/extentions.dart';
import 'package:hh_express/settings/consts.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    super.key,
    required this.title,
    required this.onAdd,
    required this.onRemove,
    this.initCount = 0,
  });
  final int? initCount;
  final String title;
  final _MyVoid onRemove;
  final _MyVoid onAdd;
  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  void initState() {
    count = widget.initCount!;
    super.initState();
  }

  static int count = 0;
  @override
  Widget build(BuildContext context) {
    return count == 0
        ? ConfirmSomeTh(
            title: widget.title,
            onTap: () {
              count++;
              widget.onAdd(count);
              setState(() {});
            },
          )
        : Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    count--;
                    widget.onRemove(count);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkBlue,
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(6.r),
                      ),
                    ),
                    child: const FittedBox(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.remove_rounded,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.darkBlue,
                  alignment: Alignment.center,
                  child: Text(
                    '$count',
                    style: context.theme.textTheme.labelMedium,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    count++;

                    widget.onAdd(count);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.darkBlue,
                        width: 1.5.w,
                      ),
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(6.r),
                      ),
                    ),
                    child: const FittedBox(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add_rounded,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

typedef _MyVoid = void Function(int count);
