
import 'package:flutter_dotenv/flutter_dotenv.dart';
enum  EnvTypeEnum { admin, resident }
class Env {
  Env._();
  static final Env instance = Env._();
  String _envType='';
  Future<void> init({required EnvTypeEnum envTypeEnum}) async{
        switch (envTypeEnum) {
      case EnvTypeEnum.admin:
        await  dotenv.load(fileName: '.env.admin');
      case EnvTypeEnum.resident:
        await  dotenv.load(fileName: '.env.resident');
    }
    _envType= dotenv.get('ENV_TYPE');
   }
   bool get depugMode => _envType == 'admin' ;
}
