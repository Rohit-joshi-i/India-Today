import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      default:
        return MaterialPageRoute(
            builder: (context) => Container(
                  child: Text('Nothing Here'),
                ));
    }
  }
}
