# arm_chair_quaterback

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
安装插件 FlutterBeanFactory

打包命令：压缩+混淆
flutter build apk --release --split-debug-info=./symbols --obfuscate

上传调试符号
firebase crashlytics:symbols:upload --app=1:312389703114:android:dbe6d6e9cfb459d121eb33 PATH/TO/symbols