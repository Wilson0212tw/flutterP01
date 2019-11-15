# flutterp01

A new Flutter project.

# Widget 概念

Widget並不真正的渲染對象
Flutter 中渲染是經歷了   Widget -> Element  -> RenderObject 

- statefulwidget:State的build 方法去構建控制項。在 State 中，你可以動態改變數 setState之後改變的數據會觸發Widget重新構建刷新

- StatelessWidget:通過build方法返回一個佈局好的控制項


# Layout 概念


- en https://flutter.dev/docs/development/ui/widgets/layout
- cn https://flutterchina.club/widgets/layout/

- Container :最基礎包含一個 widget 的單位
- https://api.flutter.dev/flutter/widgets/Container-class.html

- Center ：強制置中的作法,只有一個child
- Column : 多個widget, children為 List<Widget>, 綁成一個column
- Row : 多個wideget , children為 List<Widget>, 綁成一個row

- Expanded : 充滿 （沒用過）
- Padding  https://api.flutter.dev/flutter/widgets/Padding-class.html


# ThemeData  和 context 概念

- ThemeData 全局共用資訊 
- context 保存全局資訊
- Theme.of(context).textTheme 
- Theme.of(context).accentColor
 ...

# controllere概念
## In flutter, controllers are a means to give control to the parent widget over its child state.
  The main selling point of controllers is that they remove the need of a GlobalKey to access the widget   State. This, in turn, makes it harder to do anti-pattern stuff and increase performances.

   Controllers also allow having a complex API without having thousands of callbacks on the widget. They also allow to not "lift the state up", as the State is still managed by the child.

## customize the behavior of a widget. You can pass a custom implementation of a controller.

- AnimationController 11/15說到
- HeroController （yet)
- TextEditingController (yet)


- 11/15應該說到 animatedController /CurvedAnimation  / 些許list 
- 11/22  更多animation / dataTable /StreamController/StreamBuilder





# api 資源
- package  查詢 https://pub.dev/ 
           文件 https://pub.dev/documentation/

- flutter 原生元件 https://api.flutter.dev/






# flutter web
https://flutter.dev/docs/get-started/web

- flutter channel master 
- flutter upgrade 
- flutter config --enable-web 
- cd <into project directory> 
- flutter create . 
- flutter run -d chrome

# flutter macos

- flutter config --enable-macos-desktop
- flutter devices
- flutter create  --macos <project directory>

詳細方法
- https://github.com/google/flutter-desktop-embedding
- https://github.com/flutter/flutter/wiki/Desktop-shells


