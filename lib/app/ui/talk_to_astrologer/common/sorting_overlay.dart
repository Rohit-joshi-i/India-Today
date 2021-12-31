import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/astrologer/astrologer_event.dart';
import 'package:india/app/bloc/astrologer/astrologer_provider.dart';
import 'package:india/app/bloc/astrologer/astrologer_state.dart';
import 'package:india/app/repository/model/panchang_location_model.dart';
import 'package:india/app/ui/talk_to_astrologer/common/sort_enum.dart';
import 'package:india/app/ui/talk_to_astrologer/widgets/radio_button_selector.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_assets.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/app_dimensions.dart';
import 'package:india/resources/fonts/inter.dart';

class FilterOverlay extends StatefulWidget {
  @override
  _FilterOverlayState createState() => _FilterOverlayState();
}

class _FilterOverlayState extends State<FilterOverlay> {
  final FocusNode _focusNode = FocusNode();
  bool isShown = false;
  late OverlayEntry _overlayEntry;
  SortingAgent? selectedSorting;
  final LayerLink _layerLink = LayerLink();
  TextEditingController location = TextEditingController();

  AstrologerBloc? astrologerBloc;

  List<LocationInformation> countryList = [];

  @override
  void initState() {
    astrologerBloc = BlocProvider.of<AstrologerBloc>(context);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
      } else {}
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
        builder: (context) => Positioned(
              width: 250.toWidth,
              height: 300.toHeight,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(-200.toWidth, 52.toHeight),
                child: Material(
                  elevation: 4.0,
                  child: BlocConsumer<AstrologerBloc, AstrologerState>(
                    listener: (context, state) {
                      if (state is SortAgentState) {
                        selectedSorting = state.sortAgent;
                      }
                    },
                    buildWhen: (prev, curr) {
                      if (curr is SortAgentState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      return Container(
                        width: 270.toWidth,
                        padding: AppDimensions.horizontal16,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.black.withOpacity(.3))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              kSortBy,
                              style: Inter.standardTextInterStyleW700(
                                  fontSize: 14.toFont,
                                  color: AppColors.primaryColor),
                            ),
                            Divider(
                              height: 1,
                              color: AppColors.black,
                            ),
                            GestureDetector(
                                onTap: () {
                                  astrologerBloc!.add(SortTheAgents(
                                      sortingAgent:
                                          SortingAgent.SortByExperienceDesc));
                                },
                                child: RadioButtonSelector(
                                  title: kExperienceDesc,
                                  selected: selectedSorting ==
                                      SortingAgent.SortByExperienceDesc,
                                )),
                            GestureDetector(
                                onTap: () {
                                  astrologerBloc!.add(SortTheAgents(
                                      sortingAgent:
                                          SortingAgent.SortByExperienceAsc));
                                },
                                child: RadioButtonSelector(
                                  title: kExperienceAsc,
                                  selected: selectedSorting ==
                                      SortingAgent.SortByExperienceAsc,
                                )),
                            GestureDetector(
                                onTap: () {
                                  astrologerBloc!.add(SortTheAgents(
                                    sortingAgent: SortingAgent.SortByPriceDesc,
                                  ));
                                },
                                child: RadioButtonSelector(
                                  title: kPriceDesc,
                                  selected: selectedSorting ==
                                      SortingAgent.SortByPriceDesc,
                                )),
                            GestureDetector(
                                onTap: () {
                                  astrologerBloc!.add(SortTheAgents(
                                      sortingAgent:
                                          SortingAgent.SortByPriceAsc));
                                },
                                child: RadioButtonSelector(
                                  title: kPriceAsc,
                                  selected: selectedSorting ==
                                      SortingAgent.SortByPriceAsc,
                                ))
                          ],
                        ),
                      );
                    },
                    bloc: astrologerBloc,
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: GestureDetector(
        onTap: () {
          isShown = isShown ? false : true;
          if (isShown) {
            this._overlayEntry = this._createOverlayEntry();
            Overlay.of(context)?.insert(this._overlayEntry);
          } else {
            this._overlayEntry.remove();
          }
        },
        child: Container(
            height: 30.toHeight,
            width: 30.toHeight,
            child: Image.asset(
              AppIcons.filter,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
