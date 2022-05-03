import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 建立AppBar
    final appBar = AppBar(
      title: Text('動畫範例'),
    );

    // 建立App的操作畫面
    final animationWrapper = _AnimationWrapper(
        GlobalKey<_AnimationWrapperState>(), true);

    var btn = RaisedButton(
      child: Text('切換', style: TextStyle(fontSize: 18, color: Colors.white),),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: () {
        animationWrapper.changeState();
      },
    );

    final widget = Center(
      child: Container(
        child: Column(
          children: <Widget>[animationWrapper,
            Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );

    // 結合AppBar和App操作畫面
    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _AnimationWrapper extends StatefulWidget {
  final GlobalKey<_AnimationWrapperState> _key;
  bool _showFirst;

  _AnimationWrapper(this._key, this._showFirst): super (key: _key);

  @override
  State<StatefulWidget> createState() => _AnimationWrapperState();

  changeState() {
    _key.currentState.changeState();
  }
}

class _AnimationWrapperState extends State<_AnimationWrapper> {
  @override
  Widget build(BuildContext context) {
    var w = AnimatedCrossFade(
      firstChild: Container(
        child: Text(
          'Flutter動畫',
          style: TextStyle(fontSize: 30),
        ),
        width: 500,
        height: 100,
        alignment: Alignment.center,
      ),
      secondChild: Container(
        child: Icon(
          Icons.mood,
          size: 100,
        ),
        width: 500,
        height: 100,
      ),
      duration: Duration(seconds: 1),
      crossFadeState: widget._showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );

    return w;
  }

  changeState() {
    setState(() {
      widget._showFirst = !widget._showFirst;
    });
  }
}
///////////////////////////////
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // 建立AppBar
//     final appBar = AppBar(
//       title: Text('動畫範例'),
//     );
//
//     // 建立App的操作畫面
//     final animationWrapper = _AnimationWrapper(
//         GlobalKey<_AnimationWrapperState>(), 1.0);
//
//     var btn = RaisedButton(
//       child: Text('變透明', style: TextStyle(fontSize: 18, color: Colors.white),),
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       color: Colors.lightBlue,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       onPressed: () {
//         animationWrapper.setOpacity(0.0);
//       },
//     );
//
//     final widget = Center(
//       child: Container(
//         child: Column(
//           children: <Widget>[animationWrapper,
//             Container(child: btn, margin: EdgeInsets.symmetric(vertical: 20),)],
//           mainAxisAlignment: MainAxisAlignment.center,
//         ),
//       ),
//     );
//
//     // 結合AppBar和App操作畫面
//     final appHomePage = Scaffold(
//       appBar: appBar,
//       body: widget,
//     );
//
//     return appHomePage;
//   }
// }
//
// class _AnimationWrapper extends StatefulWidget {
//   final GlobalKey<_AnimationWrapperState> _key;
//   double _opacity;
//
//   _AnimationWrapper(this._key, this._opacity): super (key: _key);
//
//   @override
//   State<StatefulWidget> createState() => _AnimationWrapperState();
//
//   setOpacity(double opacity) {
//     _key.currentState.setOpacity(opacity);
//   }
// }
//
// class _AnimationWrapperState extends State<_AnimationWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     var w = AnimatedOpacity(
//       child: Text(
//         'Flutter動畫',
//         style: TextStyle(fontSize: 30),
//       ),
//       duration: Duration(seconds: 1),
//       opacity: widget._opacity,
//       onEnd: () =>
//           setState(() {
//             widget._opacity = 1.0;
//           }),
//     );
//
//     return w;
//   }
//
//   setOpacity(double opacity) {
//     setState(() {
//       widget._opacity = opacity;
//     });
//   }
// }
//////////////////////////////////////////
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Opacity Demo';
//     return const MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title: appTitle),
//     );
//   }
// }
//
// // The StatefulWidget's job is to take data and create a State class.
// // In this case, the widget takes a title, and creates a _MyHomePageState.
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// // The State class is responsible for two things: holding some data you can
// // update and building the UI using that data.
// class _MyHomePageState extends State<MyHomePage> {
//   // Whether the green box should be visible
//   bool _visible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: AnimatedOpacity(
//           // If the widget is visible, animate to 0.0 (invisible).
//           // If the widget is hidden, animate to 1.0 (fully visible).
//           opacity: _visible ? 1.0 : 0.0,
//           duration: const Duration(milliseconds: 500),
//           // The green box must be a child of the AnimatedOpacity widget.
//           child: Container(
//             width: 200.0,
//             height: 200.0,
//             color: Colors.green,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Call setState. This tells Flutter to rebuild the
//           // UI with the changes.
//           setState(() {
//             _visible = !_visible;
//           });
//         },
//         tooltip: 'Toggle Opacity',
//         child: const Icon(Icons.flip),
//       ),
//     );
//   }
// }