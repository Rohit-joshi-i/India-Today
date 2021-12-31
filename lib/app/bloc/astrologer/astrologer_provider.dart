import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/astrologer/astrologer_event.dart';
import 'package:india/app/bloc/astrologer/astrologer_state.dart';
import 'package:india/app/error/app_error.dart';
import 'package:india/app/repository/panchang_repository.dart';

class AstrologerBloc extends Bloc<AstrologerEvent, AstrologerState> {
  AstrologerBloc() : super(AstrologerLoadState.loading('loading'));

  Repository repository = Repository();
  @override
  Stream<AstrologerState> mapEventToState(AstrologerEvent event) async* {
    try {
      if (event is FetchAstrologerEvent) {
        var response = await repository.getAllAgentInformation();
        if (response.getData != null) {
          yield AstrologerLoadState.completed(
              agentDetailsModel: response.getData);
        } else {
          yield AstrologerLoadState.error(AppError.defaultException(
              exception: response.getIndiaTodayAppException));
        }
      } else if (event is ShowSearchBarEvent) {
        yield ShowSearchButtonState.completed(
            showSearchButton: event.showSearchBar);
      } else if (event is SearchAgentEvent) {
        yield SearchAgentState.completed(searchAgent: event.agentListParameter);
      } else if (event is SortTheAgents) {
        yield SortAgentState.completed(sortAgent: event.sortingAgent);
      }
    } on Exception catch (exception) {
      yield AstrologerLoadState.error(
          AppError.defaultException(exception: exception));
    }
  }
}
