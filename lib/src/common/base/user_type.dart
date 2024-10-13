import 'package:vista_market/src/common/base/app_constants.dart';

enum UserTypes {
  admin,
  customer,
  none,
}

String getString() {
  switch (AppConstants.userType) {
    case UserTypes.admin:
      return UserTypes.admin.name;
    case UserTypes.customer:
      return UserTypes.customer.name;
    // ignore: no_default_cases
    default:
      return UserTypes.none.name;
  }
}
