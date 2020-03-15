package com.example.flutterpluginwangfei.plugin;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import com.example.flutterpluginwangfei.model.FileBean;
import com.luck.picture.lib.PictureSelector;
import com.luck.picture.lib.config.PictureConfig;
import com.luck.picture.lib.entity.LocalMedia;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import droidninja.filepicker.FilePickerConst;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

import static android.app.Activity.RESULT_OK;

/**
 * <pre>
 *     author : luhenchang
 *     e-mail : 1276998208@qq.com
 *     time   : 2020/03/13
 *     desc   : 版权所有 王飞
 *     version: 1.0
 * </pre>
 */
public class FileAndImagePickerDelegate implements PluginRegistry.ActivityResultListener, PluginRegistry.RequestPermissionsResultListener {
    private Activity activity;
    private MethodChannel.Result result;

    public FileAndImagePickerDelegate(Activity activity) {
        this.activity = activity;
    }
    private ArrayList<FileBean> mData = new ArrayList();
    @Override
    public boolean onActivityResult(final int requestCode, final int resultCode, final Intent data) {
        Log.e("wagnfei==","niuupi");
        if (resultCode == RESULT_OK) {
            Log.e("wagnfei==","niuupi"+requestCode);
            mData.clear();
            if (requestCode == FilePickerConst.REQUEST_CODE_DOC) {// 图片、视频、音频选择结果回调
                ArrayList<String> fileList = data.getStringArrayListExtra(FilePickerConst.KEY_SELECTED_DOCS);
                assert fileList != null;
                for (int i = 0; i < fileList.size(); i++) {
                    if (fileList.get(i) != null) {
                        mData.add(new FileBean(getFileName(fileList.get(i)), fileList.get(i)));
                    }
                }
                try {
                    JSONObject jsonObject = new JSONObject();
                    JSONArray jsonArray = new JSONArray();
                    for (FileBean nameList : mData) {
                        JSONObject jo = new JSONObject();
                        jo.put("name", nameList.getName());
                        jo.put("path", nameList.getPath());
                        jo.put("type", nameList.getType());
                        jo.put("imageId", nameList.getImageId());
                        jsonArray.put(jo);
                    }
                    jsonObject.put("imageList", jsonArray);
                    Log.e("wagnfei==",jsonObject.toString());
                    if(result!=null) {
                        result.success(jsonObject.toString());
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }

            }else if (requestCode == PictureConfig.CHOOSE_REQUEST) {

                Log.e("wagnfei==","niuupi11");
                List<LocalMedia> pictureData = PictureSelector.obtainMultipleResult(data);
                Log.e("wagnfei==","niuupi22");
                Log.e("wagnfei==","niuupi22"+pictureData.get(0).getPath());
                for (int i = 0; i < pictureData.size(); i++) {
                    if (pictureData.get(i).getCompressPath() != null) {
                        mData.add(new FileBean(getFileName(pictureData.get(i).getCompressPath()), pictureData.get(i).getCompressPath()));
                    } else {
                        mData.add(new FileBean(getFileName(pictureData.get(i).getPath()), pictureData.get(i).getPath()));
                    }
                }
                Log.e("wagnfei==","niuupi33");
                try {
                    JSONObject jsonObject = new JSONObject();
                    JSONArray jsonArray = new JSONArray();
                    for (FileBean nameList : mData) {
                        JSONObject jo = new JSONObject();
                        jo.put("name", nameList.getName());
                        jo.put("path", nameList.getPath());
                        jo.put("type", nameList.getType());
                        jo.put("imageId", nameList.getImageId());
                        jsonArray.put(jo);
                    }
                    jsonObject.put("imageList", jsonArray);
                    Log.e("wagnfei==",jsonObject.toString());
                    if(result!=null) {
                        result.success(jsonObject.toString());
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

        }
        return false;
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        return false;
    }
    private String getFileName(String pathandname) {

        int start = pathandname.lastIndexOf("/");
        int end = pathandname.length();
        if (start != -1 && end != -1) {
            return pathandname.substring(start + 1, end);
        } else {
            return null;
        }

    }

    public void setResult(MethodChannel.Result result) {
        this.result=result;
    }
}
