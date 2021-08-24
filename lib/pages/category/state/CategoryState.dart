

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/bean/BaseGuangDiu.dart';
import 'package:flutter_gdchent_shop/config/service_url.dart';
import 'package:flutter_gdchent_shop/pages/category/category_page.dart';
import 'package:flutter_gdchent_shop/pages/detatil/DetailPage.dart';
import 'package:flutter_gdchent_shop/res/listData.dart';

class CategoryState extends State<CategoryPage> {


  List tempList=new List();
  List<DataListBean> pList=new List();
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
    print("init State");
    this.requestListData();
  }

   //请求逛丢列表数据
   requestListData() async{
     var apiUrl=gdbaseUrl;
     var response=await Dio().get(apiUrl,queryParameters:{},
         options:new Options(
             responseType:ResponseType.plain //默认是json 这里 text
        )
     );
     if(response.statusCode==200){
       //将JSON字符串转为Dart对象
       Map map=json.decode(response.data.toString());
       BaseGuangDiu baseGuangDiu=new BaseGuangDiu.fromJson(map);
       print(baseGuangDiu.toJson());
        // List<GuangDiuItemBean> list=new List();
        // int length=response.data['data'].length;
        // for(int i=0;i<length;i++){
        //      GuangDiuItemBean guangDiuItemBean=new GuangDiuItemBean();
        //      guangDiuItemBean.title=response.data['data'][i]['title'];
        //      guangDiuItemBean.id=response.data['data'][i]['id'];
        //      print(guangDiuItemBean);
        // }
       List<DataListBean> dataList=baseGuangDiu.data;
       setState(() {
          this.pList=dataList;
       });
     }else{
       print("失败${response.statusCode}");
     }
  }

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount:pList.length,
        itemBuilder: (BuildContext context, int index){
          return new GestureDetector(
               onTap: ()=>{
                   this._renderItem(index)
               },
               child: new Column(

                 children: <Widget>[
                   Text(
                     pList[index].title,
                   ),

                 ],
               ),
          );
        });
  }

   void _renderItem(int index){
     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
       return new DetailPage();
     }));
   }
}