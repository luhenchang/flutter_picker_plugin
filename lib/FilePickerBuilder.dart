import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutterpluginwangfei/plugin.dart';

import 'json/modle/image_bean_entity.dart';


class FilePickerBuilder {
  var filePickerMaxCount=5;
  var filePickerActivityTitle="选择文件";
  List<String> zips=new List();
  // 工厂模式
  factory FilePickerBuilder() =>_getInstance();
  static FilePickerBuilder get instance => _getInstance();
  static FilePickerBuilder _instance;
  FilePickerBuilder._internal() {
    // 初始化
  }
  static FilePickerBuilder _getInstance() {
    if (_instance == null) {
      _instance = new FilePickerBuilder._internal();
    }
    return _instance;
  }
  FilePickerBuilder setMaxCount(int maxCount){
    this.filePickerMaxCount=maxCount;
    return _getInstance();
  }
  FilePickerBuilder setActivityTitle(String activityTitle){
    this.filePickerActivityTitle=activityTitle;
    return _getInstance();
  }
  FilePickerBuilder addZipFileSupport(List<String>suportFileName){
    this.zips=suportFileName;
    return _getInstance();
  }

  Future<ImageBeanEntity> getFileToNative() async {
    Map<String, dynamic> map = {"maxCount":filePickerMaxCount,"activityTitle":filePickerActivityTitle,"zip":zips};
    String resultJson = await plugin.jumpPlugin.invokeMethod('openFile', map);
    print("resultJson"+resultJson);
    Map<String, dynamic> mapJson = json.decode(resultJson);
    ImageBeanEntity imageBeanEntity = ImageBeanEntity().fromJson(mapJson);
    print(imageBeanEntity.imageList[0].path);
    return imageBeanEntity;
  }
  Future<ImageBeanEntity> getPhotoAlbumToNative() async {
    Map<String, String> map = {"ImageMessage": "获取图片从相册"};
    String resultJson = await plugin.jumpPlugin.invokeMethod('openPhotoAlbum', map);
    Map<String, dynamic> mapJson = json.decode(resultJson);
    ImageBeanEntity imageBeanEntity = ImageBeanEntity().fromJson(mapJson);
    File file = new File(imageBeanEntity.imageList[0].path);
    return imageBeanEntity;
  }


  Future<Null> getVideoToNative() async {
    Map<String, String> map = {"flutter": "获取视频从本地"};

    //String result = await jumpPlugin.invokeMethod('openVideo', map);

   // print(result);
  }
}
