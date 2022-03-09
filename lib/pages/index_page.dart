import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'shop/shopcart_page.dart';
import 'member/member_page.dart';

/**
 * 首页有状态组件
 */
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.share_up), label: '分类'),
    BottomNavigationBarItem( icon: Icon(CupertinoIcons.shopping_cart), label: '购物车'),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '会员中心'),
  ];


  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    ShopCartPage(),
    MemberPage()
  ];
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    //默认初始化选中第一个页面
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return new Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }

}
