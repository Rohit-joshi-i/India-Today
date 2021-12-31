import 'package:equatable/equatable.dart';
import 'package:india/app/ui/talk_to_astrologer/common/sort_enum.dart';

abstract class AstrologerEvent extends Equatable {}

class FetchAstrologerEvent extends AstrologerEvent {
  @override
  List<Object?> get props => [];
}

class ShowSearchBarEvent extends AstrologerEvent {
  final bool? showSearchBar;
  ShowSearchBarEvent({this.showSearchBar = false});
  @override
  List<Object?> get props => [showSearchBar];
}

class SearchAgentEvent extends AstrologerEvent{
  final String? agentListParameter ;
  SearchAgentEvent({this.agentListParameter});
  @override
  List<Object?> get props => [agentListParameter];
}

class SortTheAgents extends AstrologerEvent{
  final SortingAgent? sortingAgent;
  SortTheAgents({this.sortingAgent});
  @override
  List<Object?> get props => [sortingAgent];
}