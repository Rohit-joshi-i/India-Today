import 'package:flutter/material.dart';
import 'package:india/app/ui/common/appbar_widget.dart';
import 'package:india/app/ui/panchang/widgets/common/nakshatra_widget.dart';
import 'package:india/app/ui/panchang/widgets/panchang_title.dart';
import 'package:india/app/ui/panchang/widgets/tithi_widget.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';

class Panchang extends StatefulWidget {
  const Panchang({Key? key}) : super(key: key);

  @override
  _PanchangState createState() => _PanchangState();
}

class _PanchangState extends State<Panchang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.menu,
            color: AppColors.white,
          ),
          foregroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.primaryColor,
        ),
        appBar: getAppBar(context),
        body: Padding(
            padding: AppDimensions.horizontal16,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                  child: Column(children: [
                PanchangTitle(),
                SizedBox(
                  height: 20.toHeight,
                ),
                TithiWidget(),
                SizedBox(
                  height: 20.toHeight,
                ),
                NakshatraWidget(),
              ])),
            )));
  }
}
