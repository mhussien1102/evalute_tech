import '../models/product_model.dart';
import '../servicecs/api_services.dart';

class ProductRepository {
  final ApiService apiService = ApiService();

  Future<List<ProductModel>> fetchProducts() async {
    final data = await apiService.getProducts();
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}
