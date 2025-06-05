import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) return true;

    final result = await Permission.camera.request();
    return result.isGranted;
  }

  static Future<void> openAppSettingsIfPermanentlyDenied() async {
    final status = await Permission.camera.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }
}
