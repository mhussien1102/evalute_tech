import 'package:flutter/material.dart';
import '../data/models/product_model.dart';
import '../data/repo/product_repo.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductRepository repository = ProductRepository();

  List<ProductModel> products = [];
  bool isLoading = false;

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();

    products = await repository.fetchProducts();

    isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(int productId) {
    final index = products.indexWhere((e) => e.id == productId);
    products[index].isFavorite = !products[index].isFavorite;
    notifyListeners();
  }

  void addToCart(int productId) {
    final index = products.indexWhere((e) => e.id == productId);
    products[index].quantity++;
    notifyListeners();
  }
}
