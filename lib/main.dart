import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/dart/Person.dart';
import './pages/index_page.dart';
void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      Person p=Person();
      p.setInfo(23);
      print(p.age);
      return new Container(
           child: new MaterialApp(
             title:'百姓生活+',
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
                primaryColor: Colors.pink
             ),
             //initialRoute: '',
             home: IndexPage(),
//             routes: {
//                "home_page":(BuildContext context)=> new IndexPage(),
//             },
           ),
      );
  }
}


