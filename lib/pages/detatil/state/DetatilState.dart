

import 'package:flutter/material.dart';
import 'package:flutter_gdchent_shop/pages/detatil/DetailPage.dart';

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
