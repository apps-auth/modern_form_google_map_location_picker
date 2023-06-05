import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';

class LocationPickerUtils {
  static const _platform = const MethodChannel('google_map_location_picker');
  static Map<String, String> _appHeaderCache = {};

  static String autoCompleteUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";
  static String autoCompleteWebUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  static String detailsUrl =
      "https://maps.googleapis.com/maps/api/place/details/json";
  static String detailsWebUrl =
      "https://maps.googleapis.com/maps/api/place/details/json";

  static Future<Map<String, String>?> getAppHeaders() async {
    if (kIsWeb) {
      return _appHeaderCache;
    }
    if (_appHeaderCache.isEmpty) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      if (Platform.isIOS) {
        _appHeaderCache = {
          "X-Ios-Bundle-Identifier": packageInfo.packageName,
        };
      } else if (Platform.isAndroid) {
        String sha1 = "";
        try {
          sha1 = await _platform.invokeMethod(
              'getSigningCertSha1', packageInfo.packageName);
        } on PlatformException {
          _appHeaderCache = {};
        }

        _appHeaderCache = {
          "X-Android-Package": packageInfo.packageName,
          "X-Android-Cert": sha1,
        };
      }
    }

    return _appHeaderCache;
  }
}
