import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../app_constant/app_constant.dart';
import '../models/model.dart';
import '../models/user_allReq_model.dart';

class ApiService {
  static final getAllUser = '/user/all';
  static final dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl2));

  static Future<List<UserAllReqModel>> fetchItem() async {
    try {
      var response = await dio.get(getAllUser);
      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        List<UserAllReqModel> users = List<UserAllReqModel>.from(
            response.data.map((x) => UserAllReqModel.fromJson(x)));
        return users;
      } else {
        return [];
      }
    } on DioError catch (e) {
      debugPrint('error:${e.toString()}');
      return [];
    }
  }
}
