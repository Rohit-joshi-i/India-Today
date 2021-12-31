import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india/app/bloc/astrologer/astrologer_provider.dart';
import 'package:india/app/bloc/panchang/panchang_provider.dart';
import 'package:india/services/config/flavor_banner.dart';
import 'package:india/services/navigation/locator.dart';
import 'package:india/services/navigation/navigation_service.dart';
import 'package:india/services/navigation/route_generator.dart';
import 'app/ui/tabbar_page/tabbar_page.dart';
import 'common_utils/log_util.dart';
import 'common_utils/screenutil.dart';

void baseAppSetup() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark));

  // Run the application under run zoned, to catch unhandled exceptions
  await runZonedGuarded<Future<Null>>(() async {
    LogUtil().printLog(message: 'Showing main');
    ScreenUtil.init(allowFontScaling: true);
    setupLocator();
    runApp(const App());
  }, (error, stackTrace) async {
    // Whenever an error occurs, call the `reportCrash` function. This will send
    // Dart errors to our dev console or Crashlytics depending on the environment.
    // await FirebaseCrashlytics.instance.recordError(error, stackTrace);
    LogUtil().printLog(
        tag: 'Main', message: 'runZonedGuarded exception: $stackTrace');
  });
}

class _AppProviders extends StatelessWidget {
  final Widget child;

  const _AppProviders({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return child;
    return MultiBlocProvider(providers: [
      BlocProvider<PanchangBloc>(
        create: (BuildContext context) => PanchangBloc(),
      ),
      BlocProvider<AstrologerBloc>(
        create: (BuildContext context) => AstrologerBloc(),
      ),
    ], child: child);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppProviders(
      child: MaterialApp(
        home: FlavorBanner(showBanner: kDebugMode, child: const TabBarPage()),
        debugShowCheckedModeBanner: false,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
