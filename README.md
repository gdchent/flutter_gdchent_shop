# flutter_gdchent_shop
##### 引入dio 报错:
https://blog.csdn.net/SmileToLin/article/details/106531343
```dart
Error: The method DioHttpHeaders.add has fewer named arguments than those Context
```
解决方法：打开pubspec.yaml 文件修改 dio 版本号，更行为最新版本（鼠标指向版本号时，会提示最新的版本号）完美解决;