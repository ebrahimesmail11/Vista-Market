import 'dart:developer';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';
import 'package:vista_market/src/common/routing/routes.dart';

class LinksServices {
  static final AppLinks _appLinks = AppLinks();
  final GlobalKey<NavigatorState> _navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  /// Initializes the deep linking functionality
  Future<void> initialize() async {
    try {
      // Get the initial link if the app was opened via a deep link
      final initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _handleDeepLinkNavigation(initialUri.path);
      }
    } catch (e, stackTrace) {
      log('Failed to receive the initial URI: $e', stackTrace: stackTrace);
    }

    // Listen for new links when the app is already open
    _appLinks.uriLinkStream.listen(
      (Uri? uri) {
        if (uri != null) {
          log('Received URI: $uri');
          _handleDeepLinkNavigation(uri.path);
        }
      },
      // ignore: inference_failure_on_untyped_parameter
      onError: (error) {
        log('AppLinks Error: $error');
      },
    );
  }

  /// Handles navigation based on the deep link path
  void _handleDeepLinkNavigation(String path) {
    try {
      // تحقق إذا كان الرابط يحتوي على جزء معين
      if (path.startsWith('https://vista-market.web.app/')) {
        log('Navigating to a specific page...');
        // انتقل إلى صفحة محددة بناءً على هذا الرابط
        _navigatorKey.currentState?.pushNamed(Routes.login);
        return;
      }

      // إذا لم يحتوي الرابط على 'https://vista-market.web.app/'، استمر بالمعالجة
      final splitLink = path.split('/');
      // تحقق من أن المسار يحتوي على أكثر من جزء
      if (splitLink.length > 1) {
        final id = int.tryParse(splitLink[1]);
        if (id != null) {
          _navigatorKey.currentState?.pushNamed(
            Routes.productDetails,
            arguments: id,
          );
        } else {
          log('Invalid ID in the path: $path');
        }
      } else {
        log('Invalid path: $path');
      }
    } catch (e, stackTrace) {
      log('Error handling deep link navigation: $e', stackTrace: stackTrace);
    }
  }
}
