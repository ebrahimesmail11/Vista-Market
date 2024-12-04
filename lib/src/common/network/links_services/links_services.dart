import 'dart:developer';

import 'package:app_links/app_links.dart';

class LinksServices {
   static final AppLinks _appLinks = AppLinks();

  static Future<void> initialize() async {
    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
    //  PageHandler.handleUri(initialUri);
    } catch(e) {
      log('Failed to receive the initial URI');
    } 
    _appLinks.uriLinkStream.listen((Uri? uri) {
       log('URI: ${uri.toString()}');
     // PageHandler.handleUri(uri);
    }, onError: (error) {
      log('AppLinks Error: $error');
    });
  }
}