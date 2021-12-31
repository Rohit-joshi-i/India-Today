import 'package:equatable/equatable.dart';

abstract class PanchangEvent extends Equatable {}

class DateSelectEvent extends PanchangEvent {
  final DateTime? selectedDate;
  DateSelectEvent({this.selectedDate});

  @override
  List<Object?> get props => [selectedDate];
}

class CountrySearchEvent extends PanchangEvent {
  final String? countryName;
  CountrySearchEvent({this.countryName});

  @override
  List<Object?> get props => [countryName];
}

class LocationSelectEvent extends PanchangEvent {
  final String placeName;
  final String placeId;
  LocationSelectEvent({required this.placeName, required this.placeId});

  @override
  List<Object?> get props => [placeName,placeId];
}
