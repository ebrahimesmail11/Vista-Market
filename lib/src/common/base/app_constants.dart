import 'package:vista_market/src/common/base/user_type.dart';

bool isLoggedInUser = false;

class AppConstants {
  static const String appName = 'Vista Market';
  static const String userAlreadyLoggedInKey = 'USER_LOGGED_IN';
  static const String user = 'userType';
  static UserTypes userType = UserTypes.none;
  static const String resident = 'resident';
  static const String admin = 'admin';
  // static const String userAlreadyLoggedInKey = "USER_LOGGED_IN";
//Api
  static const String baseUrl = 'https://api.escuelajs.co';
  static const String graphql = '/graphql';
  static const String profile = '/api/v1/auth/profile';
  static const String uploadImage='/api/v1/files/upload';
 // static const String errorMsg = 'Please , try again we have error';

  static String setUserType(UserTypes userType) {
    AppConstants.userType = userType;
    return userType.name;
  }
}
