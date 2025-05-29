import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elanel_asistencia_it/domain/entities/product.dart';
import 'package:elanel_asistencia_it/presentation/providers/providers.dart';

class ProductScreen extends ConsumerWidget {
  static const name = 'product-screen';
  final String productId;

  const ProductScreen({super.key, required this.productId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Product product = ref.watch(productByIdProvider(productId));
    
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del producto',
          style: TextStyle(
              color: colors.primary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _ProductView(product: product),
    );
  }
}

class _ProductView extends StatelessWidget {
  const _ProductView({
    required this.product, 
  });

  final Product product;

  @override
  Widget build(BuildContext context) {

    return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                _InfoProduct(product: product),

                const SizedBox(height: 20),

              ],
            ),
          );
  }
}

class _InfoProduct extends StatelessWidget {
  const _InfoProduct({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CircleAvatar(
            backgroundColor: colors.onSecondary,
            radius: 47,
            child: Icon(
              color: colors.primary,
              size: 57,
              product.type== ProductType.laptop
              ? Icons.laptop_rounded
              : product.type== ProductType.phone
              ? Icons.smartphone_rounded
              : product.type== ProductType.scanner
              ? Icons.adf_scanner_rounded
              : product.type== ProductType.printer
              ? Icons.print_rounded
              : product.type== ProductType.monitor
              ? Icons.monitor
              : product.type== ProductType.desktop
              ? Icons.desktop_mac_rounded
              : product.type== ProductType.keyboard
              ? Icons.keyboard
              : product.type== ProductType.accessControl
              ? Icons.person
              : product.type== ProductType.router
              ? Icons.router
              : product.type== ProductType.webcam
              ? Icons.videocam
              : product.type== ProductType.server
              ? Icons.dns
              : product.type== ProductType.tablet
              ? Icons.tablet_mac_rounded
              : product.type== ProductType.projector
              ? Icons.fit_screen_rounded
              : product.type== ProductType.speaker
              ? Icons.speaker
              :Icons.devices_other_outlined
            ),
          ),

          const SizedBox(height: 7),
    
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
    
          const SizedBox(height: 5),
    
          Text(
            'ID: ${product.id} - ${product.type.name}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
    
          const SizedBox(height: 10),
    
        ],
      ),
    );
  }
}