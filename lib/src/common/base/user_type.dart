import 'package:vista_market/src/common/base/app_constants.dart';

enum UserTypes {
  admin,
  resident,
  none,
}

String getString() {
  switch (AppConstants.userType) {
    case UserTypes.admin:
      return UserTypes.admin.name;
    case UserTypes.resident:
      return UserTypes.resident.name;
    // ignore: no_default_cases
    default:
      return UserTypes.resident.name;
  }
}
