import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/astrologer/astrologer_event.dart';
import 'package:india/app/bloc/astrologer/astrologer_provider.dart';
import 'package:india/app/bloc/astrologer/astrologer_state.dart';
import 'package:india/app/ui/common/search_bar.dart';
import 'package:india/app/ui/talk_to_astrologer/common/sorting_overlay.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class TalkToAstrologerTitle extends StatefulWidget {
  const TalkToAstrologerTitle({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerTitleState createState() => _TalkToAstrologerTitleState();
}

class _TalkToAstrologerTitleState extends State<TalkToAstrologerTitle> {
  bool? showSearch;
  AstrologerBloc? astrologerBloc;
  @override
  void initState() {
    showSearch = false;
    astrologerBloc = BlocProvider.of<AstrologerBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AstrologerBloc, AstrologerState>(
      bloc: astrologerBloc,
      listener: (context, state) {
        if (state is ShowSearchButtonState) {
          showSearch = state.showSearchButton;
        }
      },
      buildWhen: (previos, current) {
        if (current is ShowSearchButtonState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  kTalkToAstrologer,
                  style: Inter.standardTextInterStyleW600(
                      fontSize: 16.toFont, color: AppColors.black),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        ///
                        /// Don't touch magic
                        ///
                        astrologerBloc!.add(ShowSearchBarEvent(
                            showSearchBar: showSearch! ? false : true));
                      },
                      child: Container(
                          height: 30.toHeight,
                          width: 30.toHeight,
                          child: Image.asset(
                            AppIcons.search,
                            fit: BoxFit.contain,
                          )),
                    ),
                    SizedBox(
                      width: 10.toWidth,
                    ),
                    ///
                    /// Filter for Astrologer
                    ///
                    FilterOverlay(),
                    SizedBox(
                      width: 10.toWidth,
                    ),
                    ///
                    /// UpDown Sort Icon
                    ///
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 30.toHeight,
                          width: 30.toHeight,
                          child: Image.asset(
                            AppIcons.upDown,
                            fit: BoxFit.contain,
                          )),
                    ),
                  ],
                )
              ],
            ),
            showSearch!
                ? SizedBox(
                    height: 20.toHeight,
                  )
                : SizedBox.shrink(),
            showSearch! ? SearchBar() : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
