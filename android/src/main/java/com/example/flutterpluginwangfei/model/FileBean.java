package com.example.flutterpluginwangfei.model;

import androidx.annotation.NonNull;

/**
 * <pre>
 *     author : luhenchang
 *     e-mail : 1276998208@qq.com
 *     time   : 2020/03/14
 *     desc   : 版权所有
 *     version: 1.0
 * </pre>
 */
public class FileBean {
    //图片名称
    private String name;
    //图片路径
    private String path;
    //图片类型
    private String type = "-1";//表示本地文件
    //图片ID
    private String imageId;

    public FileBean(String name, String path, String type, String imageId) {
        this.name = name;
        this.path = path;
        this.type = type;
        this.imageId = imageId;
    }
    public FileBean(String name, String path) {
        this.name = name;
        this.path = path;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    @Override
    public String toString() {
        return "FileBean{" +
                "name='" + name + '\'' +
                ", path='" + path + '\'' +
                ", type='" + type + '\'' +
                ", imageId='" + imageId + '\'' +
                '}';
    }
}
