import 'package:india/app/error/app_error.dart';
import 'package:india/app/repository/model/astrologer_agent_details_model.dart';
import 'package:india/app/ui/talk_to_astrologer/common/sort_enum.dart';

import '../bloc_common_state.dart';

abstract class AstrologerState extends ApiState {
  AstrologerState.loading(String message) : super.loading(message);

  AstrologerState.completed(data) : super.completed(data);

  AstrologerState.error(AppError error) : super.error(error);
}

class AstrologerLoadState extends AstrologerState {
  AstrologerAgentDetailsModel? agentDetailsModel;
  AstrologerLoadState.loading(String message) : super.loading(message);

  AstrologerLoadState.completed({this.agentDetailsModel})
      : super.completed(agentDetailsModel);

  AstrologerLoadState.error(AppError error) : super.error(error);
}

class ShowSearchButtonState extends AstrologerState {
  final bool? showSearchButton;
  ShowSearchButtonState.completed({this.showSearchButton = false})
      : super.completed(showSearchButton);
}

class SearchAgentState extends AstrologerState {
  final String? searchAgent;
  SearchAgentState.completed({this.searchAgent}) : super.completed(searchAgent);
}
class SortAgentState extends AstrologerState {
  final SortingAgent? sortAgent;
  SortAgentState.completed({this.sortAgent}) : super.completed(sortAgent);
}

