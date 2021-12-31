import 'package:flutter/material.dart';
import 'package:india/app/ui/common/drop_down_search.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';

class PanchangeLocationSelector extends StatefulWidget {
  const PanchangeLocationSelector({Key? key}) : super(key: key);

  @override
  _PanchangeLocationSelectorState createState() =>
      _PanchangeLocationSelectorState();
}

class _PanchangeLocationSelectorState extends State<PanchangeLocationSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.toWidth,
      height: 40.toHeight,
      color: AppColors.white,
      padding: AppDimensions.all10,
      child: Center(
        child: CountriesField(),
      ),
    );
  }

}
