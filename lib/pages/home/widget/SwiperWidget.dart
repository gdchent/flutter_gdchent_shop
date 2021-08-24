import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/utils/ColorUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
/**
 * 首页轮播图
 */
class SwiperWidget extends StatelessWidget {
  final List swiperList;

  SwiperWidget({this.swiperList});

   void _swiperOnTap(int index){
     print('点击了第${index}');
     Fluttertoast.showToast(
         msg: '点击了第${index}',
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         backgroundColor:ColorUtil.hexColor(0xe74c3c,alpha: 0.6),
         textColor: ColorUtil.hexColor(0xffffff,alpha: 0.6)
     );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 162.0,
      child:new Swiper(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
              "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=500542857,4026327610&fm=26&gp=0.jpg",
              fit: BoxFit.fill);
        },
        onTap: (index) {
            this._swiperOnTap(index);
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
                color: ColorUtil.hexColor(0x00ff00,alpha: 0.6),
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
