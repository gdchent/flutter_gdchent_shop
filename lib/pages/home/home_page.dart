import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/pages/detatil/detail_page.dart';
import 'package:flutter_gdchent_shop/pages/home/widget/SwiperWidget.dart';
import 'package:dio/dio.dart';
import 'package:flutter_gdchent_shop/service/service_method.dart';

/**
 * 首页页面
 */
class HomePage extends StatefulWidget {
  @override
  State createState() {
    return new HomePageState();
  }
}

/**
 * 首页页面有状态组件对应的state
 */
class HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";

  /**
   * State的初始化
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomePageContent().then((value) {
      homePageContent = value.toString();
      print(homePageContent);
    });
  }

  void getHttp() async {
    try {
      Response response;
      response = await Dio().get(
          'https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女');
      print("install b");
      return print("gdchent:" + response.toString());
    } catch (e) {
      return print(e);
    }
  }

  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return new GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return new DetailPage();
          }));
        },
        child:Container(
          alignment: Alignment.center,
          child: Text(
            item,
            style: TextStyle(color: Colors.white, fontSize: 20),
            textDirection:TextDirection.ltr ,
          ),
          color: Colors.blue,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(
            "首页AppBar",
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: new SwiperWidget(),
            ),
            Expanded(
                child:GridView.count(
                  //shrinkWrap: true,
                  mainAxisSpacing:3.0,
                  crossAxisSpacing: 5.0,
                  //childAspectRatio: 1.0,
                  crossAxisCount: 3,
                  children: this.getWidgetList(),
                )
            ),
          ],
        ));
  }
}


