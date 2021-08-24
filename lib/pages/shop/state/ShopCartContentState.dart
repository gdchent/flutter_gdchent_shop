
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/pages/shop/widget/ShopCartContentWidget.dart';
class ShopCartContentState extends State<StatefulWidget>{

  final tabListData=['全部','降价','常买','分类'];

  List<Widget> getTabList(){
      List<Widget> list=new List();
      for(var i=0;i<tabListData.length;i++){
          list.add(this._renderRowItemWidget(tabListData[i]));
      }
      return list;
  }

  Widget _renderRowItemWidget(String itemText){
     return new Container(
          decoration: new BoxDecoration(
             border: Border.all(
                width: 3,
                color: Colors.blueAccent
             )
          ),
          child: new Text(
              itemText,
              textAlign: TextAlign.center,
              style:new TextStyle(
                  fontSize:18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              )
          ),

     );
  }

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
          appBar:new AppBar(
            title: Text("购物车"),
            centerTitle:true ,
          ),
          body:new Column(
            key: new Key("key"),
            children: <Widget>[
              new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //设置主轴的摆放方式
                  children: this.getTabList(),
                  crossAxisAlignment:CrossAxisAlignment.center
              ),
              new Container(
                child:Text("购物车",
                  style:new TextStyle(
                      color:Colors.blue
                  ) ,
                ) ,
              )
            ],
          )
      );;
  }
}