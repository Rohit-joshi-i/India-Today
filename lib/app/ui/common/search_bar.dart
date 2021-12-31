import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/astrologer/astrologer_event.dart';
import 'package:india/app/bloc/astrologer/astrologer_provider.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_dimensions.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController agentSearch = TextEditingController();
  AstrologerBloc? astrologerBloc;

  @override
  void initState() {
    astrologerBloc = BlocProvider.of<AstrologerBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.toHeight,
      padding: AppDimensions.horizontal16,
      margin: AppDimensions.horizontal8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.grey.withOpacity(.4),
            spreadRadius: 2.toWidth,
            blurRadius: 2.toWidth,
            offset: Offset(2, 2),
            blurStyle: BlurStyle.outer)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 20.toHeight,
            width: 20.toHeight,
            child: Image.asset(AppIcons.search),
          ),
          SizedBox(
            width: 10.toWidth,
          ),
          Expanded(
              child: TextField(
                controller: agentSearch,
            cursorColor: AppColors.primaryColor,
            onChanged: (value) {
              astrologerBloc!.add(SearchAgentEvent(agentListParameter: value));
            },
            decoration: InputDecoration(
                focusColor: AppColors.primaryColor, border: InputBorder.none),
          )),
          SizedBox(
            width: 10.toWidth,
          ),
          GestureDetector(
            onTap: (){
              agentSearch.text ='';
              astrologerBloc!.add(SearchAgentEvent(agentListParameter: ''));

            },
            child: Icon(
              Icons.close,
              size: 20.toHeight,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
