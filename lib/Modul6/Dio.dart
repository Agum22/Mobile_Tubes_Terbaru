import 'package:android/Modul6/Model.dart';
import 'package:dio/dio.dart';

class DioClass {
  Dio dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:8000',
        connectTimeout: 20000,
        sendTimeout: 20000,
        receiveTimeout: 20000,
        contentType: "application/json",
        responseType: ResponseType.json,
      )
  );
  
  Future<Welcome> getData()async{
    final res = await dio.post('/api/posts/show');
    return Welcome.fromJson(res.data);
  }

  Future<int> add({
    required int categoryId,
    required String nama,
    required String tampil,
    required String body,
    required String img,
  }) async {
    try{
      final response = await dio.post(
          '/api/posts/create',
          data:{
            'category_id': categoryId,
            'nama': nama,
            'tampil': tampil,
            'body': body,
            'img': img,
          });
      return response.statusCode ?? 404;
    }catch (e){
      return 404;
    }
  }

  Future<Welcome> delete (String id) async{
    final res = await dio.post('/api/posts/delete/$id');
    return Welcome.fromJson(res.data);
  }


}

