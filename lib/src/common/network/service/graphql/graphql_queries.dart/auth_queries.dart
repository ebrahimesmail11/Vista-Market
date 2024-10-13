import 'package:vista_market/src/common/network/models/login/login_request_body.dart';

class AuthQueries {
  factory AuthQueries() {
    return _instance;
  }
  const AuthQueries._();
  static const AuthQueries _instance = AuthQueries._();
  Map<String, dynamic> loginMapQuery({required LoginRequestBody body}) {
    return {
      'query': r'''
              mutation Login($email:String!,$password:String!){
                login(email: $email, password: $password) {
                  access_token
                  refresh_token
                }
              }
          ''',
          'variables': {
            'email': body.email,
            'password': body.password,
          },
    };
  }
}
