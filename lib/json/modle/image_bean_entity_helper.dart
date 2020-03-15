

import 'image_bean_entity.dart';

imageBeanEntityFromJson(ImageBeanEntity data, Map<String, dynamic> json) {
	if (json['imageList'] != null) {
		data.imageList = new List<ImageBeanImageList>();
		(json['imageList'] as List).forEach((v) {
			data.imageList.add(new ImageBeanImageList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> imageBeanEntityToJson(ImageBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.imageList != null) {
		data['imageList'] =  entity.imageList.map((v) => v.toJson()).toList();
	}
	return data;
}

imageBeanImageListFromJson(ImageBeanImageList data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['path'] != null) {
		data.path = json['path']?.toString();
	}
	if (json['type'] != null) {
		data.type = json['type']?.toString();
	}
	return data;
}

Map<String, dynamic> imageBeanImageListToJson(ImageBeanImageList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['path'] = entity.path;
	data['type'] = entity.type;
	return data;
}