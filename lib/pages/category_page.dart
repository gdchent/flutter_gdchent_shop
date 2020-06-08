import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  State createState() {
    return CategoryState();
  }
}

class CategoryState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.settings_input_svideo,
            size: 30.0,
          ),
          title: Text(
            "一级标题",
            style: TextStyle(
                fontSize: 23.0,
                color: Colors.blueGrey,
                backgroundColor: Colors.deepOrange),
          ),
          subtitle: Text("二级标题"),
        ),
        ListTile(
          leading: Image.network(
              "https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1284651229,4011062394&fm=26&gp=0.jpg",
              width: 60.5,
              height: 60.2,
              fit: BoxFit.fill),
          title: Text(
            "一级标题",
            style: TextStyle(
                fontSize: 23.0,
                color: Colors.blueGrey,
                backgroundColor: Colors.deepOrange),
          ),
          subtitle: Text("二级标题"),
          onTap: (){
            //print("点击");
          },
        ),
        ListTile(
          leading: Icon(Icons.settings_input_svideo),
          title: Text("一级标题"),
          subtitle: Text("二级标题"),
        ),
        ListTile(
          leading: Icon(Icons.settings_input_svideo),
          title: Text("一级标题"),
          subtitle: Text("二级标题"),
        ),
        ListTile(
          leading: Icon(Icons.settings_input_svideo),
          title: Text("一级标题"),
          subtitle: Text("二级标题"),
        ),
        ListTile(
          leading: Icon(
            Icons.settings_input_svideo,
            size: 30.0,
          ),
          title: Text("一级标题"),
          subtitle: Text("二级标题"),
        ),
      ],
    );
  }
}
