import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elanel_asistencia_it/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Material(
        color: colors.onInverseSurface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => context.push('/product/${product.id}'),
          highlightColor: colors.primary.withAlpha(70),
          splashColor: colors.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            child: Row(
              children: [

                Icon(
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
                
                SizedBox(width: 17),

                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      Text("ID: ${product.id}")
                  
                    ],
                  ),
                ),

                Text(
                  product.type.name,
                  
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}