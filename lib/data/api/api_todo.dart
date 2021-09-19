import 'dart:convert';

import 'package:demotechnixo/domain/reposittories/todo_reposittory.dart';
import 'package:dio/dio.dart';

class TodoApi extends TodosRepository {
  var _dio = new Dio();

  Future<dynamic> createTask(DateTime starttime, DateTime endtime, String title,
      String decription, int id) async {
    try {
      Response response = await _dio.post(
          "https://6142f75dc8700e00178d002c.mockapi.io/api/v1/todo",
          data: jsonEncode({
            "starttime": starttime,
            "endtime": endtime,
            "title": title,
            "decription": decription,
            "id": id,
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> updateTask(DateTime starttime, DateTime endtime, String title,
      String decription, int id) async {
    try {
      Response response = await _dio.put(
          "https://6142f75dc8700e00178d002c.mockapi.io/api/v1/todo/$id",
          data: jsonEncode({
            "starttime": starttime,
            "endtime": endtime,
            "title": title,
            "decription": decription,
            "id": id,
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> deleteTask(int id) async {
    try {
      Response response = await _dio.delete(
        "https://6142f75dc8700e00178d002c.mockapi.io/api/v1/todo/$id",
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> getTask() async {
    try {
      Response response = await _dio
          .get("https://6142f75dc8700e00178d002c.mockapi.io/api/v1/todo");
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
