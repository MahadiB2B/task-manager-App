import 'package:flutter/cupertino.dart';
import 'package:task_manager/app.dart';
import 'package:device_preview/device_preview.dart';

void main(){
  runApp(DevicePreview(
    enabled: true,
      builder: (context)=>const TaskManagerApp()));
}
