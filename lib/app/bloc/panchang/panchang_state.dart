import 'package:india/app/bloc/bloc_common_state.dart';
import 'package:india/app/error/app_error.dart';
import 'package:india/app/repository/model/panchang_location_model.dart';

abstract class PanchangState extends ApiState {
  PanchangState.loading(String message) : super.loading(message);

  PanchangState.completed(data) : super.completed(data);

  PanchangState.error(AppError error) : super.error(error);
}

class PanchangLoadedState extends PanchangState {
  PanchangLoadedState.loading(String message) : super.loading(message);

  PanchangLoadedState.completed(data) : super.completed(data);

  PanchangLoadedState.error(AppError error) : super.error(error);
}

class PanchangeCountryState extends PanchangState {
  PanchangLocationModel? panchangLocationModel;
  PanchangeCountryState.loading(String message) : super.loading(message);

  PanchangeCountryState.completed({this.panchangLocationModel})
      : super.completed(panchangLocationModel);

  PanchangeCountryState.error(AppError error) : super.error(error);
}

class PanchangeStateSelected extends PanchangState {
  String? countryName;
  String? countryId;
  PanchangeStateSelected.completed({this.countryName, this.countryId})
      : super.completed(countryName);
}
