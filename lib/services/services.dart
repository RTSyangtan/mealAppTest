
import 'package:dio/dio.dart';

import '../constant/api.dart';
import '../model/category.dart';

class Services {
  static final dio = Dio();

  static Future getCategory() async{
    try{
      final response = await dio.get(Api.categoryUrl);
      return (response.data as List).map((e)=> Category.fromJson(e)).toList();
    }on DioException catch(err){
      throw (err);
    }
  }
}