import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterpluginwangfei/json/modle/image_bean_entity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutterpluginwangfei/FilePickerBuilder.dart';
import 'package:flutterpluginwangfei/PictureSelector.dart';
import 'package:flutterpluginwangfei/config/PictureMimeType.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color.fromRGBO(45, 101, 114, 1)),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PermissionGroup permission;
  ImageBeanEntity fileBeanEntity;
  ImageBeanEntity imageBeanEntity;

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void _incrementCounter() async {
    fileBeanEntity = await FilePickerBuilder.instance
        .setMaxCount(9)
        .setActivityTitle("选择")
        .addZipFileSupport([".zip", ".rar"]).getFileToNative();
    print("resultImageState=" + fileBeanEntity.imageList[0].path);
    setState(() {});
  }

  void _getPhotoAium() async {
    imageBeanEntity = await PictureSelector()
        .openGallery(pictureMimeType: PictureMimeType.all)
        .maxSelectNum(maxSelectNum:10)
        .minSelectNum(minSelectNum:3)
        .enablePreviewAudio(enablePreviewAudio:true)
        .compress(compress:true)
        .enableCrop(enablecrop:true)
        .imageSpanCount(imageSpancount:5)
        .isCamera(iscamera:true)
        .previewImage(previewImage:true)
        .previewVideo(previewVideo:true)
        .openClickSound(open:false)
        .getPhotoAlbumToNative();
    print("resultImageState=" + imageBeanEntity.imageList[0].path);
    setState(() {});
  }

  Future<void> requestPermission() async {
    await PermissionHandler().requestPermissions([
      PermissionGroup.camera,
      PermissionGroup.microphone,
      PermissionGroup.storage,
      PermissionGroup.photos,
      PermissionGroup.mediaLibrary,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            fileBeanEntity == null
                ? Container()
                : ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    itemCount: fileBeanEntity.imageList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.book,
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 330,
                              child: Text(
                                fileBeanEntity.imageList[index].path,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 1),
                        ),
                      );
                    }),
            imageBeanEntity == null
                ? Container()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: imageBeanEntity.imageList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Image.file(
                        new File(imageBeanEntity.imageList[index].path),
                        fit: BoxFit.fill,
                      );
                    }),
            Text(
              'result',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _getPhotoAium,
            tooltip: 'image',
            child: Text("image"),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'file',
            child: Text("file"),
          )
        ],
      ),
    );
  }
}
