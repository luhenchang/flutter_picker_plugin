import 'package:flutterpluginwangfei/json/base/json_convert_content.dart';

class ImageBeanEntity with JsonConvert<ImageBeanEntity> {
  List<ImageBeanImageList> imageList;
}

class ImageBeanImageList with JsonConvert<ImageBeanImageList> {
  String name;
  String path;
  String type;
}
