import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoRepository {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  Future<String> getDeviceUniqueId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return android.id ?? '';
    }
    if (Platform.isIOS) {
      IosDeviceInfo ios = await deviceInfo.iosInfo;
      return ios.identifierForVendor ?? '';
    }
    return '';
  }

  Future<String> getDeviceBrand() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return android.brand ?? '';
    }
    if (Platform.isIOS) {
      return 'Apple';
    }
    return '';
  }

  Future<String> getDeviceModel() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return android.model ?? '';
    }
    if (Platform.isIOS) {
      IosDeviceInfo ios = await deviceInfo.iosInfo;
      return ios.utsname.machine ?? '';
    }
    return '';
  }

  Future<String> getDeviceOsVersion() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return android.version.release ?? '';
    }
    if (Platform.isIOS) {
      IosDeviceInfo ios = await deviceInfo.iosInfo;
      return ios.systemVersion ?? '';
    }
    return '';
  }

  Future<String> getDeviceManufacturer() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfo.androidInfo;
      return android.manufacturer ?? '';
    }
    if (Platform.isIOS) {
      return 'Apple';
    }
    return '';
  }
}
