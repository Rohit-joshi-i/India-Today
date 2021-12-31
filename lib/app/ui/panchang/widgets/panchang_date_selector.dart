import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:india/app/bloc/bloc_common_state.dart';
import 'package:india/app/bloc/panchang/panchang_event.dart';
import 'package:india/app/bloc/panchang/panchang_provider.dart';
import 'package:india/app/bloc/panchang/panchang_state.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/panchang_selector_common_widget.dart';
import 'common/panchange_location_selector.dart';

class PanchangeDateSelector extends StatefulWidget {
  const PanchangeDateSelector({Key? key}) : super(key: key);

  @override
  _PanchangeDateSelectorState createState() => _PanchangeDateSelectorState();
}

class _PanchangeDateSelectorState extends State<PanchangeDateSelector> {
  DateTime? selectedDate = DateTime.now();
  PanchangBloc? panchangBloc;
  String? currentSelectedDate;
  @override
  void initState() {
    panchangBloc = BlocProvider.of<PanchangBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor.withOpacity(.1),
      height: 200.toHeight,
      padding: AppDimensions.horizontal16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                kDate,
                style: Inter.standardTextInterStyleW400(
                    fontSize: 12.toFont, color: AppColors.black),
              ),
              Text(kLocation,
                  style: Inter.standardTextInterStyleW400(
                      fontSize: 12.toFont, color: AppColors.black))
            ],
          ),
          BlocConsumer<PanchangBloc, PanchangState>(
            bloc: panchangBloc,
            listener: (BuildContext context, PanchangState? state) {
              if (state is PanchangLoadedState &&
                  state.status == Status.completed) {
                selectedDate = state.data;
              }
            },
            builder: (BuildContext context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PanchangSelectorCommon(
                    onTap: _showDatePicker,
                    subTitle: getFormattedDate(selectedDate!),
                    endIcon: Icon(
                      Icons.arrow_drop_down,
                    ),
                  ),
                  PanchangeLocationSelector()
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
          1970,
        ),
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != selectedDate)
      panchangBloc!.add(DateSelectEvent(selectedDate: pickedDate));
    ;
  }

  String getFormattedDate(DateTime dateTime) {
    String formattedDate =
        '${dateTime.day}${getDayOfMonthSuffix(dateTime.day)} ${getMonthOfSuffixDate(dateTime)}, ${dateTime.year}';
    return formattedDate;
  }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return kTh;
    }

    switch (dayNum % 10) {
      case 1:
        return kSt;
      case 2:
        return kNd;
      case 3:
        return kRd;
      default:
        return kTh;
    }
  }

  String getMonthOfSuffixDate(DateTime dateTime) {
    String month = DateFormat('MMMM').format(dateTime);
    return month;
  }
}
