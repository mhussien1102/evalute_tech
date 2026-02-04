import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<dynamic>> getProducts() async {
    final response = await dio.get("products");
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception();
  }
}
