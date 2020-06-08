import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/listData.dart';

class CategoryPage extends StatefulWidget {

  @override
  State createState() {
    return CategoryState();
  }
}

class CategoryState extends State<CategoryPage> {

  List tempList=new List();

  /**
   * for循环添加widget 类似于rn通过map循环遍历添加组件
   */
  List<Widget> getData() {
    var list = listData.map((value) {
      return ListTile(
        title: Text(value["author"]),
      );
    });
    tempList=list.toList();
    return tempList;
  }
  @override
  void initState() {
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
         itemCount:listData.length,
         itemBuilder: (BuildContext context, int index){
         return ListTile(
           title: Text(listData[index]['author']),
           onTap: (){
              print(index);
           },
         );
    });
  }
}
