import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:netxone/model/model.dart';

import '../../model/bodymodeld.dart';
import 'package:dio/dio.dart';

class ApiService {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTY2NjQzMzUxMSwiZXhwIjoxNjk3OTY5NTExfQ.99AkZAY7MJ6nR82r_Sm4FRPZwMpf_zrIUbxtQne0oyw";

  Dio dio = Dio();
  late Model? usersList;

  Future<Model?> datafetching({required Body body}) async {
    var url = "https://ajcjewel.com:5000/api/sub-categories/list";
    try {
      dio.options.headers["authorization"] = token;
      var response = await dio.post(
        url,
        data: body,
      );
      log(response.data.toString());

      if (response.statusCode == 201) {
        return Model.fromJson(response.data);
      } else {
        log(response.statusCode.toString());
        return null;
      }
    } on SocketException {
      Get.snackbar(
        "Network Error Occured",
        "Please Check Your Internet",
      );
    }
    return null;
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(onError:
        (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
      log(error.message);
    }, onResponse:
        (response, ResponseInterceptorHandler responseinterceptorHandler) {
      log(response.data);
    }));
  }
}
