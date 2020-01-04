import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

//개발 모드에 따른 hostUrl
const bool bDebug = true;
const String hostUrl = bDebug ? "119.192.175.126:4001" : "www.yonple.com:4000";

//Dio Singleton
class MyDio {
  static final MyDio _singleton = MyDio._internal();

  final Dio dio = Dio();

  factory MyDio() {
    return _singleton;
  }

  MyDio._internal() {
    dio.options.connectTimeout = 5000;
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (Options options) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String token = prefs.getString("access_token");
        //만일 토큰이 있으면 끼워서 보낸다.
        if (token != null) {
          options.headers["x-access-token"] = token;
        }
      }, onResponse: (Response res) async {
        //만약 토큰이 갱신되면 새로 넣어준다.
        String token = res.headers.value('access_token');
        if (token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', token);
        }
      }),
    );
  }
}

Dio dio = MyDio().dio;

//현재 서버 경로 Uri
Uri getUri(String path, [Map<String, String> queryParameters]) {
  // Uri.https(authority, unencodedPath)
  return bDebug
      ? Uri.http(hostUrl, path, queryParameters)
      : Uri.https(hostUrl, path, queryParameters);
}

Uri getAuthUri(String path, [Map<String, String> queryParameters]) {
  // Uri.https(authority, unencodedPath)
  return bDebug
      ? Uri.http("52.79.118.67:3005", path, queryParameters)
      : Uri.https("52.79.118.67:3005", path, queryParameters);
}
