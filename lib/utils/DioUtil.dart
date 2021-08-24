import 'package:dio/dio.dart';
import 'dart:async';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const String API_PREFIX = 'https://novel.dkvirus.com/api/v1';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  ///Get请求测试
  static void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.cn");
      print("response$response");
    } catch (e) {
      print(e);
    }
  }

  ///Post请求测试
  static void postHttp<T>(
      String url, {
        parameters,
        Function(T t) onSuccess,
        Function(String error) onError,
      }) async {

    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance();
      response = await dio.post(url, data: parameters);
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(response.data);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  /// request method
  //url 请求链接
  //parameters 请求参数
  //metthod 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static Future<Map> request<T>(String url,
      {parameters,
        method,
        Function(T t) onSuccess,
        Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    /// 请求处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    /// 打印:请求地址-请求方式-请求参数
    print('请求地址：【' + method + '  ' + url + '】');
    print('请求参数：' + parameters.toString());

    Dio dio = createInstance();
    //请求结果
    var result;
    try {
      Response response = await dio.request(url,
          data: parameters, options: new Options(method: method));
      result = response.data;
      if (response.statusCode == 200) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception('statusCode:${response.statusCode}');
      }
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }

    return result;
  }

  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: "http://poetry.huhustory.com/",
      );

      dio = new Dio(options);
      dio.interceptors.add(new LogInterceptors()); //添加拦截器
    }

    return dio;
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }
}

///日志拦截器
class LogInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("【请求baseUrl】${options.baseUrl}");
    print("【请求path】${options.path}");
    print("【请求headers】${options.headers.toString()}");
    //todo 参数拦截
    print("【请求参数】${options.data.toString()}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print("【返回statusCode】${response.statusCode}");
    print("【返回headers】${response.headers.toString()}");
    print("【返回extra】${response.extra.toString()}");
    print("【返回data】${response.data.toString()}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(err.toString());
    print(err.response?.toString());
    return super.onError(err);
  }
}