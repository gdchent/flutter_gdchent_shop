
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DetailState();
  }
}

class DetailState extends State<DetailPage>{

  final String title="详情";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(this.title),
      ),
      body: new Container(
        child: new Text(this.title),
      ),
    );
  }

}