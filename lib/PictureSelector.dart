import 'dart:convert';
import 'package:flutterpluginwangfei/plugin.dart';
import 'config/PictureMimeType.dart';
import 'config/SelectionMode.dart';
import 'json/modle/image_bean_entity.dart';
///图片选择
class PictureSelector {
  factory PictureSelector() => _getInstance();

  static PictureSelector get instance => _getInstance();
  static PictureSelector _instance;

  int _mPictureMimeType = 0;
  int _mMxSelectNum = 5;
  int _mInSelectNum = 1;
  int _sPanCount = 4;
  int _mSelectionMode = 2;
  bool _isPreviewImage = true;
  bool _isPreviewVideo = true;
  bool _mEnablePreviewAudio = true;
  bool _mIsCamera = true;
  bool _mIsZoomAnim=true;
  var _mOpenSound = false;
  int _mWidth = 100;
  int _mHeight = 100;
  bool _msynOrAsy = true;
  bool _mCompress = true;
  bool _mEnableCrop = true;

  PictureSelector._internal() {
    /// 初始化
  }

  static PictureSelector _getInstance() {
    if (_instance == null) {
      _instance = new PictureSelector._internal();
    }
    return _instance;
  }
  ///支持的文件类型可以不可以拍照和录制视频等
  PictureSelector openGallery(
      {PictureMimeType pictureMimeType = PictureMimeType.all}) {
    if (pictureMimeType == PictureMimeType.image) {
      _mPictureMimeType = 1;
    } else if (pictureMimeType == PictureMimeType.video) {
      _mPictureMimeType = 2;
    } else if (pictureMimeType == PictureMimeType.audio) {
      _mPictureMimeType = 3;
    }
    return _instance;
  }

  ///最多选择几个
  PictureSelector maxSelectNum({int maxSelectNum = 5}) {
    _mMxSelectNum = maxSelectNum;
    return _instance;
  }

  ///至少选择几个才能点击完成
  PictureSelector minSelectNum({int minSelectNum = 1}) {
    _mInSelectNum = minSelectNum;
    return _instance;
  }

  ///一行几张图片
  PictureSelector imageSpanCount({int imageSpancount = 4}) {
    _sPanCount = imageSpancount;
    return _instance;
  }

  ///多选或者单选： 多选 or 单选PictureConfig.MULTIPLE  多选 PictureConfig.SINGLE)//  单选
  PictureSelector selectionMode(
      {PictureConfig pictureConfig = PictureConfig.MULTIPLE}) {
    if (PictureConfig != null && pictureConfig == PictureConfig.MULTIPLE) {
      _mSelectionMode = 2;
    } else {
      _mSelectionMode = 1;
    }
    return _instance;
  }

  ///是否可预览图片
  PictureSelector previewImage({bool previewImage = true}) {
    _isPreviewImage = previewImage;
    return _instance;
  }

  ///是否可预览视频
  PictureSelector previewVideo({bool previewVideo = true}) {
    _isPreviewVideo = previewVideo;
    return _instance;
  }

  ///是否可播放音频
  PictureSelector enablePreviewAudio({bool enablePreviewAudio = true}) {
    _mEnablePreviewAudio = enablePreviewAudio;
    return _instance;
  }

  ///是否显示拍照按钮
  PictureSelector isCamera({bool iscamera = true}) {
    _mIsCamera = iscamera;
    return _instance;
  }

  //图片列表点击 缩放效果 默认true
  PictureSelector isZoomAnim({bool iszoomAnimal = true}) {
    _mIsZoomAnim = iszoomAnimal;
    return _instance;
  }

  ///是否裁剪
  PictureSelector enableCrop({bool enablecrop = false}) {
    _mEnableCrop = enablecrop;
    return _instance;
  }

  /// 是否压缩
  PictureSelector compress({bool compress = true}) {
    _mCompress = compress;
    return _instance;
  }
  ///
  PictureSelector synOrAsy({bool synOrAsy = true}) {
    _msynOrAsy = synOrAsy;
    return _instance;
  }

  ///加载宽高，越小图片列表越流畅，但会影响列表图片浏览的清晰度
  PictureSelector glideOverride({int width = 100, int height = 100}) {
    _mWidth = width;
    _mHeight = height;
    return _instance;
  }

  ///是否开启点击声音
  PictureSelector openClickSound({open = false}) {
    _mOpenSound = open;
    return _instance;
  }
  Future<ImageBeanEntity> getPhotoAlbumToNative() async {
    Map<String, dynamic> map = {
      "mPictureMimeType": _mPictureMimeType,
      "mMxSelectNum": _mMxSelectNum,
      "mInSelectNum": _mInSelectNum,
      "sPanCount": _sPanCount,
      "mSelectionMode": _mSelectionMode,
      "isPreviewImage": _isPreviewImage,
      "isPreviewVideo": _isPreviewVideo,
      "mEnablePreviewAudio": _mEnablePreviewAudio,
      "mIsCamera": _mIsCamera,
      "mIsZoomAnim": _mIsZoomAnim,
      "mOpenSound": _mOpenSound,
      "mWidth": _mWidth,
      "mHeight":_mHeight,
      "msynOrAsy": _msynOrAsy,
      "mCompress": _mCompress,
      "mEnableCrop": _mEnableCrop
    };
    String resultJson = await plugin.jumpPlugin.invokeMethod('openPhotoAlbum', map);
    Map<String, dynamic> mapJson = json.decode(resultJson);
    ImageBeanEntity imageBeanEntity = ImageBeanEntity().fromJson(mapJson);
    return imageBeanEntity;
  }
}
