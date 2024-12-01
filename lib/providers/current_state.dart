import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class CurrentState extends ChangeNotifier {
  DeviceInfo currenDevice = Devices.ios.iPhone13ProMax;

  void cahngeSelectedDevice(DeviceInfo device) {
    currenDevice = device;
    notifyListeners();
  }
}
