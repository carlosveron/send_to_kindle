import 'dart:io';
import 'package:flutter/material.dart';
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

  static ThemeMode themeMode(bool isDarkThemeEnabled) {
    if (isDarkThemeEnabled) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  static isEpub(String filePath) {
    try {
      File file = File(filePath);
      RandomAccessFile randomAccessFile = file.openSync(mode: FileMode.read);
      List<int> signature =
          randomAccessFile.readSync(4); // Read the first 4 bytes
      randomAccessFile.closeSync();

      // Check if the file starts with a ZIP archive signature
      return signature.length == 4 &&
          String.fromCharCodes(signature) == 'PK\x03\x04';
    } catch (e) {
      return false;
    }
  }
}
