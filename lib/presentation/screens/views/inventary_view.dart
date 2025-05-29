import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InventaryView extends ConsumerStatefulWidget {

  static const name = 'inventary-view';

  const InventaryView({super.key});

  @override
  InventaryViewState createState() => InventaryViewState();
}

class InventaryViewState extends ConsumerState<InventaryView> {

  @override
  void initState() {
    super.initState();

    ref.read(productsProvider.notifier).loadProducts();

  }

  @override
  Widget build(BuildContext context) {

    final products = ref.watch(productsProvider);
    final colors = Theme.of(context).colorScheme;
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/new-product');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Inventario',
        style: TextStyle(
          color: colors.primary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: products.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {

              final product = products[index];
              
              return ProductCard(product: product);
            },
          ),
    );
 }
}