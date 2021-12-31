
abstract class SharePreferenceKey {
}

class SharePreferenceData {
  static final SharePreferenceData _userData = SharePreferenceData._internal();

  factory SharePreferenceData() {
    return _userData;
  }

  SharePreferenceData._internal();
}

enum userType{
  student,
  employee,
  unemployed
}