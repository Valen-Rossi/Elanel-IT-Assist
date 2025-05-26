import 'package:elanel_asistencia_it/domain/datasources/products_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/product.dart';


class ProductsFbDatasource extends IProductsDatasource {

  final List<Product> products = [
    Product(
      id: '001',
      name: 'Laptop Dell XPS 13',
      type: ProductType.laptop,
    ),
    Product(
      id: '002',
      name: 'Smartphone Samsung Galaxy S21',
      type: ProductType.phone,
    ),
    Product(
      id: '003',
      name: 'Monitor LG UltraWide 34"',
      type: ProductType.screen,
    ),
  ];

  @override
  Future<List<Product>> getProducts() async {
    return products;
  }
  
  @override
  Future<void> addProduct(Product product) async {
    products.insert(0, product);
  }
  
  @override
  Future<void> deleteProduct(String id) async {
  }
  
  @override
  Future<void> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  
}