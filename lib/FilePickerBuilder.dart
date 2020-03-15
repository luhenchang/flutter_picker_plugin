import 'dart:async';
import 'dart:convert';
import 'package:flutterpluginwangfei/plugin.dart';
import 'json/modle/image_bean_entity.dart';


class FilePickerBuilder {
  var filePickerMaxCount=5;
  var filePickerActivityTitle="选择文件";
  List<String> zips=new List();
  factory FilePickerBuilder() =>_getInstance();
  static FilePickerBuilder get instance => _getInstance();
  static FilePickerBuilder _instance;
  FilePickerBuilder._internal() {
  }
  ///
  static FilePickerBuilder _getInstance() {
    if (_instance == null) {
      _instance = new FilePickerBuilder._internal();
    }
    return _instance;
  }
  ///最大的数量
  FilePickerBuilder setMaxCount(int maxCount){
    this.filePickerMaxCount=maxCount;
    return _getInstance();
  }
  ///页面title
  FilePickerBuilder setActivityTitle(String activityTitle){
    this.filePickerActivityTitle=activityTitle;
    return _getInstance();
  }
  ///对于zip搜索出来的列表数据包括.zip,.ara结尾的....
  FilePickerBuilder addZipFileSupport(List<String>suportFileName){
    this.zips=suportFileName;
    return _getInstance();
  }
  ///
  Future<ImageBeanEntity> getFileToNative() async {
    Map<String, dynamic> map = {"maxCount":filePickerMaxCount,"activityTitle":filePickerActivityTitle,"zip":zips};
    String resultJson = await plugin.jumpPlugin.invokeMethod('openFile', map);
    Map<String, dynamic> mapJson = json.decode(resultJson);
    ImageBeanEntity imageBeanEntity = ImageBeanEntity().fromJson(mapJson);
    return imageBeanEntity;
  }
}
