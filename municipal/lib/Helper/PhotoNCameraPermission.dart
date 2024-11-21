import 'package:permission_handler/permission_handler.dart';

class PhotoNCameraPermission {
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<bool> requestPhotoPermission() async {
    PermissionStatus status = await Permission.photos.request();
    return status.isGranted;
  }

  Future<Map<String, bool>> requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    var photoStatus = await Permission.photos.request();

    return {
      'camera': cameraStatus.isGranted,
      'photo': photoStatus.isGranted,
    };
  }

  // Check if Camera Permission is granted
  Future<bool> checkCameraPermission() async {
    return await Permission.camera.isGranted;
  }

  Future<bool> checkPhotoPermission() async {
    return await Permission.photos.isGranted;
  }

  Future<bool> arePermissionsGranted() async {
    bool cameraGranted = await Permission.camera.isGranted;
    bool photoGranted = await Permission.photos.isGranted;
    return cameraGranted && photoGranted;
  }

  Future<void> openSettings() async {
    await openAppSettings();
  }
}
