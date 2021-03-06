import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';


//获取首页主题内容
Future getHomePageContent() async {
    try{
      print("开始获取首页内容");
      Response response;
      Dio dio=new Dio();
      dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded").toString() ;
      var formData={"lon":"115.02932","lat":"35.76189"};
      String url=servicePath['homePageContent'];
      print("url:"+url);
      response=await dio.post(url,data:formData );
      if(response.statusCode==200){
        return response.data;
      }else{
        throw Exception("后端接口异常");
      }
    }catch(e){
        return print("ERROR :======${e}====");
    }
}