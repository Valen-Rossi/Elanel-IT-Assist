import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elanel_asistencia_it/domain/entities/product.dart';
import 'package:elanel_asistencia_it/presentation/providers/products/products_provider.dart';

// Product by id provider
final productByIdProvider = Provider.family<Product, String>((ref, id) {
  final products = ref.watch(productsProvider);
  return products.firstWhere((product) => product.id == id);
});