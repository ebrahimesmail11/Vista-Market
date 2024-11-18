
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vista_market/src/common/base/nav_bar_enum.dart';

part 'main_cubit_state.dart';
part 'main_cubit_cubit.freezed.dart';

class MainCubitCubit extends Cubit<MainCubitState> {
  MainCubitCubit() : super(const  MainCubitState.initial());

  NavBarEnum navBarEnum = NavBarEnum.home;

  void barSelectedIcon(NavBarEnum viewEnum) {
    navBarEnum = viewEnum; 
    emit( MainCubitState.barSelectedIcon(navBarEnum: navBarEnum));
  }
}
