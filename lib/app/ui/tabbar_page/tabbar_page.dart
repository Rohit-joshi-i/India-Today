import 'package:flutter/material.dart';
import 'package:india/app/ui/panchang/panchang.dart';
import 'package:india/app/ui/tabbar_page/widgets/bottom_bar.dart';
import 'package:india/app/ui/talk_to_astrologer/talk_to_astrologer_page.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    Panchang(),
    TalkToAstrologerPage(),
    Container(
      color: AppColors.red,
      child: Center(child: Text(kUnderDevelopment)),
    ),
    Container(
      color: AppColors.secondaryBackground,
      child: Center(child: Text(kUnderDevelopment)),

    ),
    Container(
      color: AppColors.primaryTitle,
      child: Center(child: Text(kUnderDevelopment)),

    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomBar(
        index: selectedIndex,
        onTap: _changePage,
      ),
    );
  }

  _changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
