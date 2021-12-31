import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:india/app/bloc/astrologer/astrologer_event.dart';
import 'package:india/app/bloc/astrologer/astrologer_provider.dart';
import 'package:india/app/bloc/astrologer/astrologer_state.dart';
import 'package:india/app/bloc/bloc_common_state.dart';
import 'package:india/app/repository/model/astrologer_agent_details_model.dart';
import 'package:india/app/ui/talk_to_astrologer/common/astrologer_card.dart';
import 'package:india/app/ui/talk_to_astrologer/common/sort_enum.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/fonts/inter.dart';

class TalkToAstrologerResults extends StatefulWidget {
  const TalkToAstrologerResults({Key? key}) : super(key: key);

  @override
  _TalkToAstrologerResultsState createState() =>
      _TalkToAstrologerResultsState();
}

class _TalkToAstrologerResultsState extends State<TalkToAstrologerResults> {
  AstrologerBloc? astrologerBloc;
  String? searchedValue;
  List<AgentData>? agentList = [];
  List<AgentData>? currentAgentList = [];

  @override
  void initState() {
    astrologerBloc = BlocProvider.of<AstrologerBloc>(context);
    astrologerBloc!.add(FetchAstrologerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650.toHeight,
      child: BlocConsumer<AstrologerBloc, AstrologerState>(
        bloc: astrologerBloc,
        listener: (context, state) {
          if (state.status == Status.completed) {
            if (state is AstrologerLoadState) {
              agentList = state.agentDetailsModel?.data;
            } else if (state is SearchAgentState) {
              searchedValue = state.searchAgent;
              if (state.searchAgent!.isEmpty) {
                currentAgentList = [];
              } else {
                currentAgentList = [];
                getFilteredList(state.searchAgent!.toLowerCase());
              }
            } else if (state is SortAgentState) {
              if (state.sortAgent == SortingAgent.SortByPriceAsc) {
                currentAgentList = agentList;
                currentAgentList!.sort((a, b) => a.additionalPerMinuteCharges!
                    .compareTo(b.additionalPerMinuteCharges!));
              } else if (state.sortAgent == SortingAgent.SortByPriceDesc) {
                currentAgentList = agentList;
                currentAgentList!.sort((a, b) => a.additionalPerMinuteCharges!
                    .compareTo(b.additionalPerMinuteCharges!));
                currentAgentList = currentAgentList!.reversed.toList();
              } else if (state.sortAgent == SortingAgent.SortByExperienceAsc) {
                currentAgentList = agentList;
                currentAgentList!
                    .sort((a, b) => a.experience!.compareTo(b.experience!));
                currentAgentList!.reversed;
              } else if (state.sortAgent == SortingAgent.SortByExperienceDesc) {
                currentAgentList = agentList;
                currentAgentList!
                    .sort((a, b) => a.experience!.compareTo(b.experience!));
                currentAgentList = currentAgentList!.reversed.toList();
              }
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is ShowSearchBarEvent) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          ///
          /// Show status when loading
          ///
          if (state.status == Status.loading) {
            return SpinKitThreeBounce(
              color: AppColors.primaryColor,
              size: 50.toHeight,
            );
          }
          ///
          /// Show no results when no results found
          ///
          if (searchedValue != null &&
              searchedValue!.isNotEmpty &&
              currentAgentList!.isEmpty) {
            return Container(
              child: Text(
                kNoResultsFound,
                style: Inter.standardTextInterStyleW600(
                    fontSize: 16.toFont, color: AppColors.primaryColor),
              ),
            );
          }
          ///
          /// Result lits
          ///
          return Container(
            child: ListView.separated(
                clipBehavior: Clip.antiAlias,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(
                          top: index == 0 ? 20.toHeight : 0,
                          bottom: currentAgentList!.isEmpty
                              ? (index == agentList!.length - 1
                                  ? 100.toHeight
                                  : 0)
                              : index == currentAgentList!.length - 1
                                  ? 100.toHeight
                                  : 0),
                      child: AstrologerCard(
                          agent: currentAgentList!.isEmpty
                              ? agentList![index]
                              : currentAgentList![index]));
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.toHeight,
                  );
                },
                ///
                /// If current agent list is empty then agentList is chosen
                ///
                itemCount: currentAgentList!.isEmpty
                    ? agentList!.length
                    : currentAgentList!.length),
          );
        },
      ),
    );
  }
  ///
  ///Filtered list based on search name
  ///
  void getFilteredList(String value) {
    agentList!.forEach((element) {
      if (element.firstName!.toLowerCase().contains(value) ||
          element.lastName!.toLowerCase().contains(value)) {
        currentAgentList!.add(element);
      } else if (getFilteredListByLanguage(element.languages, value)) {
        currentAgentList!.add(element);
      } else if (getFilteredListBySkills(element.skills, value)) {
        currentAgentList!.add(element);
      }
    });
  }
  ///
  ///Filtered list based on Language name
  ///
  bool getFilteredListByLanguage(List<Language>? language, String value) {
    var lang = language?.firstWhere((element) {
      if (element.name!.toLowerCase().contains(value)) {
        return true;
      }
      return false;
    }, orElse: () => Language());
    if (lang?.id != null) {
      return true;
    } else {
      return false;
    }
  }
  ///
  ///Filtered list based on SKill name
  ///
  bool getFilteredListBySkills(List<Skill>? skillList, String value) {
    var skillAvailable = skillList?.firstWhere((element) {
      if (element.name!.toLowerCase().contains(value)) {
        return true;
      }
      return false;
    }, orElse: () => Skill());
    if (skillAvailable?.id != null) {
      return true;
    } else {
      return false;
    }
  }
}
