import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/bloc_common_state.dart';
import 'package:india/app/bloc/panchang/panchang_event.dart';
import 'package:india/app/bloc/panchang/panchang_provider.dart';
import 'package:india/app/bloc/panchang/panchang_state.dart';
import 'package:india/app/repository/model/panchang_location_model.dart';
import 'package:india/common_utils/screenutil.dart';
import 'package:india/resources/app_colours.dart';
import 'package:india/resources/app_constants.dart';
import 'package:india/resources/app_dimensions.dart';
import 'package:india/resources/fonts/inter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CountriesField extends StatefulWidget {
  @override
  _CountriesFieldState createState() => _CountriesFieldState();
}

class _CountriesFieldState extends State<CountriesField> {
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();
  TextEditingController location = TextEditingController();

  PanchangBloc? panchangBloc;

  List<LocationInformation> countryList = [];

  @override
  void initState() {
    panchangBloc = BlocProvider.of<PanchangBloc>(context);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)?.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
        builder: (context) => Positioned(
              width: 200.toWidth,
              height: 120.toHeight,
              child: CompositedTransformFollower(
                link: this._layerLink,
                showWhenUnlinked: false,
                offset: Offset(-5.toWidth, 52.toHeight ),
                child: Material(
                  elevation: 4.0,
                  child: BlocConsumer<PanchangBloc, PanchangState>(
                    listener: (context, state) {
                      if (state.status == Status.completed &&
                          state is PanchangeCountryState) {
                        countryList = state.panchangLocationModel!.list!;
                      } else if (state is PanchangeStateSelected) {
                        location.text = state.countryName!;
                        FocusScope.of(context).unfocus();
                      }
                    },
                    buildWhen: (previous,current){
                      if(current is PanchangLoadedState){
                        return false;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      if (countryList.length == 0) {
                        return Padding(
                          padding: AppDimensions.horizontal8,
                          child: Center(
                            child: Text(
                              kSelectALocation,
                              style: Inter.standardTextInterStyleW500(
                                  fontSize: 14.toFont, color: AppColors.black),
                            ),
                          ),
                        );
                      }
                      if (state.status == Status.error)
                        return Padding(
                          padding: AppDimensions.horizontal8,
                          child: Text(
                            kSomethingWentWrong,
                            style: Inter.standardTextInterStyleW500(
                                fontSize: 25.toFont, color: AppColors.black),
                          ),
                        );
                      else if (state.status == Status.loading)
                        return SpinKitChasingDots(
                          size: 30.toHeight,
                          color: AppColors.primaryTitle,
                        );

                      return ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: countryList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              panchangBloc!.add(LocationSelectEvent(
                                  placeName: countryList[index].placeName!,
                                  placeId: countryList[index].placeId!));
                            },
                            child: Padding(
                              padding: AppDimensions.horizontal8,
                              child: Text(
                                countryList[index].placeName!,
                                style: Inter.standardTextInterStyleW500(
                                    fontSize: 14.toFont,
                                    color: AppColors.black),
                              ),
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                        shrinkWrap: false,
                      );
                    },
                    bloc: panchangBloc,
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanchangBloc, PanchangState>(
      bloc: panchangBloc,
      buildWhen: (previous,current){
        if(current is PanchangeStateSelected){
          return true;
        }
        return false;
      },
      builder: (context,state){
        return CompositedTransformTarget(
          link: this._layerLink,
          child: Container(
            width: 200.toWidth,
            child: Center(
              child: TextFormField(
                maxLines: 1,
                scrollPhysics: AlwaysScrollableScrollPhysics(),
                controller: location,
                focusNode: this._focusNode,
                onChanged: (value) {
                  panchangBloc!.add(CountrySearchEvent(countryName: value));
                },
                style: Inter.standardTextInterStyleW400(fontSize: 12.toFont,color: AppColors.black),
                decoration: InputDecoration(
                    border: InputBorder.none, ),
              ),
            ),
          ),
        );
      },
    );
  }
}
