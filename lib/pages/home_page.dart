import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_gdchent_shop/service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";

  @override
  void initState() {
    // TODO: implement initState
    getHomePageContent().then((value) {
      homePageContent = value.toString();
      print(homePageContent);
    });
    super.initState();
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
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
        textDirection:TextDirection.ltr ,
      ),
      color: Colors.blue,
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
              child: SwiperWidget(),
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

//声明首页轮播图
class SwiperWidget extends StatelessWidget {
  final List swiperList;

  SwiperWidget({this.swiperList});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 162.0,
      child: Swiper(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=500542857,4026327610&fm=26&gp=0.jpg",
              fit: BoxFit.fill);
        },
        onTap: (index) {
          print('点击了第${index}');
        },
        // 点击事件 onTap
        autoplayDisableOnInteraction: true,
        // 用户进行操作时停止自动翻页
        pagination: SwiperPagination(
            // 分页指示器
            alignment: Alignment.bottomCenter, // 位置 Alignment.bottomCenter 底部中间
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 5), // 距离调整
            builder: DotSwiperPaginationBuilder(
                // 指示器构建
                space: 5.0,
                // 点之间的间隔
                size: 10.0,
                // 没选中时的大小
                activeSize: 16.0,
                // 选中时的大小
                color: Colors.black54,
                // 没选中时的颜色
                activeColor: Colors.white)),
        // 选中时的颜色
        control: new SwiperControl(color: Colors.pink),
        // 页面控制器 左右翻页按钮
        scale: 0.95,
        // 两张图片之间的间隔
        itemCount: 3,
        autoplay: true,
      ),
    );
  }
}

