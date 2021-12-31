import 'package:india/app/bloc/panchang/panchang_event.dart';
import 'package:india/app/bloc/panchang/panchang_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/error/app_error.dart';
import 'package:india/app/repository/panchang_repository.dart';

class PanchangBloc extends Bloc<PanchangEvent, PanchangState> {
  PanchangBloc() : super(PanchangLoadedState.loading('loading'));
  Repository locationRepository = Repository();
  @override
  Stream<PanchangState> mapEventToState(PanchangEvent event) async* {
    try {
      if (event is DateSelectEvent) {
        ///
        /// Change date on basis calendar
        ///
        yield PanchangLoadedState.completed(event.selectedDate);
      }
      if (event is CountrySearchEvent) {
        try {
          yield PanchangLoadedState.loading('loading');

          ///
          /// Country search Event
          ///
          var response = await locationRepository
              .getAllAvailableLocation(event.countryName ?? '');
          if (response.getData != null) {
            ///
            /// If we get the results
            ///
            yield PanchangeCountryState.completed(
                panchangLocationModel: response.getData);
          } else {
            ///
            /// If we do not get any response from the api
            ///
            yield PanchangeCountryState.error(AppError.defaultException(
                exception: response.getIndiaTodayAppException));
          }
        } on Exception catch (exception) {
          yield PanchangeCountryState.error(
              AppError.defaultException(exception: exception));
        }
      }
      if (event is LocationSelectEvent) {
        yield PanchangeStateSelected.completed(
            countryName: event.placeName, countryId: event.placeId);
      }
    } on Exception catch (exception) {
      yield PanchangLoadedState.error(
          AppError.defaultException(exception: exception));
    }
  }
}
