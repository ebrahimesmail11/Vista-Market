import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/routing/routes.dart';

class LinksServices {
  static final AppLinks _appLinks = AppLinks();
  Future<void> initialize() async {
    try {
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLinkNavigation(initialUri.path);
      }
    } catch (e) {
      log('Failed to receive the initial URI');
    }
    _appLinks.uriLinkStream.listen(
      (Uri? uri) {
        log('URI: ${uri.toString()}');
        final id = uri!.pathSegments.lastOrNull;
        if (id != null && int.parse(id) != null) {
          _handleDeepLinkNavigation(uri.path);
        }
      },
      // ignore: inference_failure_on_untyped_parameter
      onError: (error) {
        log('AppLinks Error: $error');
      },
    );
  }

  void _handleDeepLinkNavigation(String path) {
    final splitLink = path.split('/');
    getIt<GlobalKey<NavigatorState>>().currentState!.pushNamed(
          Routes.productDetails,
          arguments: int.parse(
            splitLink[1],
          ),
        );
  }
}
