import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hh_express/features/filter/bloc/filter_bloc.dart';
import 'package:hh_express/features/filter/components/line.dart';
import 'package:hh_express/features/filter/components/prop_widegets/remove_all_selecteds.dart';
import 'package:hh_express/features/filter/components/prop_widegets/selected_prop_widget.dart';
import 'package:hh_express/settings/consts.dart';
import 'package:hh_express/settings/theme.dart';

class SelectedPropsBuilder extends StatelessWidget {
  const SelectedPropsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FilterBloc>();
    return BlocBuilder<FilterBloc, FilterState>(
      bloc: bloc,
      builder: (context, state) {
        final selecteds =
            bloc.forHome ? state.homeSelecteds : state.prodByCatselecteds;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selecteds.isEmpty
                ? Padding(
                    padding: AppPaddings.vertic_10,
                    child: Center(
                      child: Text(
                        'it woud be better \nif u drew me design for emty places',
                        textAlign: TextAlign.center,
                        style: AppTheme.bodyMedium12(context),
                      ),
                    ),
                  )
                : ExtendedWrap(
                    alignment: WrapAlignment.start,
                    spacing: 10.w,
                    maxLines: 2,
                    children: selecteds
                        .map(
                          (e) => SelectedFilterPropWidget(
                            value: e,
                          ),
                        )
                        .toList(),
                  ),
            if (selecteds.isNotEmpty) RemoveAllSeleteds(),
            FilterLine()
          ],
        );
      },
    );
  }
}
