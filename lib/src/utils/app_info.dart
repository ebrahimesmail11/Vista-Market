import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:vista_market/src/common/base/extensions.dart';

class AppInfo {
  // factory AppInfo() => _instance;
  AppInfo._();

  // static final AppInfo _instance = AppInfo._();
 static  Future<String> getAppVersion(BuildContext context) async {
  var buildNumbertext='';
  if(context.isEnlocale){
    final pakageInfo =await PackageInfo.fromPlatform();
    buildNumbertext= '${pakageInfo.version} (${pakageInfo.buildNumber})';
  }else {
    final pakageInfo =await PackageInfo.fromPlatform();
    buildNumbertext= '${pakageInfo.buildNumber} (${pakageInfo.version})';
  }
  return buildNumbertext;
 }
}
