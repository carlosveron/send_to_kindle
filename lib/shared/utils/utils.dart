import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class Utils {
  static Future<bool> requestStoragePermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      PermissionStatus status = await Permission.storage.status;
      if (status.isDenied || status.isRestricted) {
        Map<Permission, PermissionStatus> result =
            await [Permission.storage].request();
        return result[Permission.storage] == PermissionStatus.granted;
      } else {
        return true;
      }
    } else {
      // For other platforms, we assume that we have permission
      return true;
    }
  }

  static bool isKindleEmailValid(String email) {
    // Kindle email addresses typically end with @kindle.com
    RegExp kindleEmailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@kindle\.com$');

    // Check if the email matches the Kindle email pattern
    return kindleEmailRegex.hasMatch(email);
  }
}
