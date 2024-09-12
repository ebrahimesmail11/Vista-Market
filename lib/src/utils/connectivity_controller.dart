import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class ConnectivityController {
  ConnectivityController._();
  static final ConnectivityController instance = ConnectivityController._();
  ValueNotifier<bool> isConnected=ValueNotifier(true);
  Future<void> init() async {
    final  result = await Connectivity().checkConnectivity();
    isConnectedToInternet(result);
    Connectivity().onConnectivityChanged.listen(isConnectedToInternet);
  }

  bool isConnectedToInternet(List<ConnectivityResult>? result) {
    if (result ==null || result.contains(ConnectivityResult.none)) {
      isConnected.value=false;
      return false;
    } else if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      isConnected.value=true;
      return true;
    }
    return false;
  }
}
