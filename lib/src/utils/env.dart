import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { admin, resident }

class Env {
  Env._();
  static final Env instance = Env._();
  String _envType = '';
  String _type = '';
  String _projectId = '';
  String _privateKeyId = '';
  String _privateKey = '';
  String _clientEmail = '';
  String _clientId = '';
  String _authUri = '';
  String _tokenUri = '';
  String _authProviderX509CertUrl = '';
  String _clientX509CertUrl = '';
  String _universeDomain = '';
  String _buildDev='';
  Future<void> init({required EnvTypeEnum envTypeEnum}) async {
    switch (envTypeEnum) {
      case EnvTypeEnum.admin:
        await dotenv.load(fileName: '.env.admin');
      case EnvTypeEnum.resident:
        await dotenv.load(fileName: '.env.resident');
    }
    _envType = dotenv.get('ENV_TYPE');
    _type = dotenv.get('TYPE');
    _projectId = dotenv.get('PROJECT_ID');
    _privateKeyId = dotenv.get('PRIVATE_KEY_ID');
    _privateKey = dotenv.get('PRIVATE_KEY');
    _clientEmail = dotenv.get('CLIENT_EMAIL');
    _clientId = dotenv.get('CLIENT_ID');
    _authUri = dotenv.get('AUTH_URI');
    _tokenUri = dotenv.get('TOKEN_URI');
    _authProviderX509CertUrl = dotenv.get('AUTH_PROVIDER_X509_CERT_URL');
    _clientX509CertUrl = dotenv.get('CLIENT_X509_CERT_URL');
    _universeDomain = dotenv.get('UNIVERSE_DOMAIN');
    _buildDev = dotenv.get('BUILD_DEV',fallback: 'false');
  }

  bool get depugMode => _envType == 'admin';
  String get type => _type;
  String get projectId => _projectId;
  String get privateKeyId => _privateKeyId;
  String get privateKey => _privateKey;
  String get clientEmail => _clientEmail;
  String get clientId => _clientId;
  String get authUri => _authUri;
  String get tokenUri => _tokenUri;
  String get authProviderX509CertUrl => _authProviderX509CertUrl;
  String get clientX509CertUrl => _clientX509CertUrl;
  String get universeDomain => _universeDomain;
  String get buildDev => _buildDev;
}
