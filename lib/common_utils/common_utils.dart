import 'dart:convert';
import 'dart:io';

class CommonUtils {
  /// direct copy of 'package:flutter/foundation.dart' so that no need to import it
  static String describeEnum(Object enumEntry) {
    final description = enumEntry.toString();
    final indexOfDot = description.indexOf('.');
    assert(indexOfDot != -1 && indexOfDot < description.length - 1);
    return description.substring(indexOfDot + 1);
  }

  static String enumName(String enumToString) {
    var paths = enumToString.split('.');
    return paths[paths.length - 1];
  }
}

extension StringX on String {
  bool containsIgnoreCase(String stringToMatch) {
    return toLowerCase().contains(stringToMatch.toLowerCase());
  }

  bool hasValidData() {
    return trim().isNotEmpty;
  }

  String getSafeData() {
    return hasValidData() ? this : '';
  }

  String getPhoneFormatString() {
    String newPhone = '';
    for (int i = 1; i < this.length + 1; i++) {
      if (i % 3 == 0) {
        newPhone += '${this[i - 1]} ';
      } else {
        newPhone += this[i - 1];
      }
    }
    return newPhone;
  }
  String getEmiratesFormatString() {
    String newPhone = '';
    for (int i = 1; i < 16; i++) {
      if (i == 3 || i == 7 || i == 14 ) {
        newPhone += '${this[i - 1]}-';
      } else {
        newPhone += this[i - 1];
      }
    }
    return newPhone;
  }
  bool get isNullOrEmpty => !hasValidData();

  Iterable<String> toIterable() sync* {
    for (var i = 0; i < length; i++) {
      yield (this[i]);
    }
  }

  /// Same as contains, but allows for case insensitive searching
  ///
  /// [caseInsensitive] defaults to false
  bool containsX(String string, {bool caseInsensitive = false}) {
    if (caseInsensitive) {
      // match even if case doesn't match
      return toLowerCase().contains(string.toLowerCase());
    } else {
      return contains(string);
    }
  }

  String substringUntil(Pattern occurrence) {
    final index = indexOf(occurrence);
    if (index == -1) {
      return this;
    }
    return substring(0, index);
  }

  String toLowerCaseNoSpaces() => toLowerCase().replaceAll(' ', '');
}

extension ListEmptyValidation<E> on Iterable<E> {
  bool hasData() => isNotEmpty;
}

String getLNPayloadString(
    String notificationDomain, Map<String, dynamic> data) {
  var domain = {
    'name': notificationDomain,
    'data': data,
  };
  var _mapResponse = <String, dynamic>{
    'notification_domain': Platform.isIOS ? notificationDomain : domain,
    'data': json.encode(data)
  };
  return json.encode(_mapResponse);
}
