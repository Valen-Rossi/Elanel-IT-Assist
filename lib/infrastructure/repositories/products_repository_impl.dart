import 'package:elanel_asistencia_it/domain/datasources/products_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/product.dart';
import 'package:elanel_asistencia_it/domain/repositories/products_repository.dart';


class ProductsRepositoryImpl extends IProductsRepository {

  final IProductsDatasource datasource;
  
  ProductsRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts() {
    return datasource.getProducts();
  }

  @override
  Future<void> addProduct(Product product) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<void> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}