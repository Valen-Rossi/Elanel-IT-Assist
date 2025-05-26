import 'package:elanel_asistencia_it/domain/entities/product.dart';


abstract class IProductsRepository {
  
  Future<List<Product>> getProducts();
  Future<void> addProduct(Product product);
  Future<void> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  
}