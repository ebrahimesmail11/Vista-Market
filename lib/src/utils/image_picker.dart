import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/get_it_locator.dart';

class PickImage {
  factory PickImage() => _instance;
  const PickImage._();
  static const PickImage _instance = PickImage._();

  Future<XFile?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        return XFile(image.path);
      } else {
        return null;
      }
    } catch (e) {
      final status = await Permission.photos.status;
      if (status.isDenied) {
        await _showAlertPermissionDialog();
      } else {
        debugPrint('Image picker error:==> $e');
      }
    }
    return null;
  }

  Future<void> _showAlertPermissionDialog() async {
    return showCupertinoDialog(
      context: getIt<GlobalKey<NavigatorState>>().currentState!.context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Permission Denied'),
        content: const Text('Allow this app to access your photos.'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              // Navigator.pop(context);
              context.pop();
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Settings'),
            onPressed: () async {
              await openAppSettings();
            },
          ),
        ],
      ),
    );
  }
}
