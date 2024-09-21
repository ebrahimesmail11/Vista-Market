import 'package:get_it/get_it.dart';
import 'package:vista_market/src/utils/cubit/app_cubit.dart';

final getIt = GetIt.instance;
Future<void> initGetIt()async {
getIt.registerFactory(AppCubit.new);
}
