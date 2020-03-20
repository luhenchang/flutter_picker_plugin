# flutterpluginwangfei

A Select picture and file plugins.
## Thanks [asset_pickers](https://dart-pub.mirrors.sjtug.sjtu.edu.cn/packages/asset_pickers)
## Getting Started

## How to Use
  #### 1. Depend on it
  flutterpluginwangfei: ^0.8.0
  #### 2. Android side
  No configuration required on the android side
  #### 3. Ios side

  info.plist add

  <key>NSPhotoLibraryAddUsageDescription</key>
    	<string>Do you allow this app to use albums?</string>
    	<key>NSPhotoLibraryUsageDescription</key>
    	<string>This app needs access to your photo album so you can use services like uploading pictures</string>
    	<key>NSCameraUsageDescription</key>
    	<string>This app requires your consent to use the camera features</string>
    	<key>NSAppTransportSecurity</key>
    	<dict>
    		<key>NSAllowsArbitraryLoads</key>
    		<true/>
    	</dict>

  ####4 Run as follows

