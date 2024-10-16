import 'package:vista_market/src/common/network/models/registration/registration_request_body.dart';
import 'package:vista_market/src/common/network/models/registration/registration_response.dart';
import 'package:vista_market/src/common/network/service/graphql/api_service.dart';
import 'package:vista_market/src/common/network/service/graphql/graphql_queries.dart/auth_queries.dart';

class RegistrationRemoteSource {
  RegistrationRemoteSource(this._graphqlApi);
  final ApiService _graphqlApi;

  Future<RegistrationResponse> registration({
    required RegistrationRequestBody body,
  }) async {
    final response = _graphqlApi.registration(
      AuthQueries().registrationMapQuery(body: body),
    );
    return response;
  }
}
