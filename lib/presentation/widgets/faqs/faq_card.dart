import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elanel_asistencia_it/domain/entities/faq.dart';

class FAQCard extends StatelessWidget {
  const FAQCard({
    super.key,
    required this.faq,
  });

  final FAQ faq;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Material(
        color: colors.onInverseSurface,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () => context.push('/faq/${faq.id}'),
          highlightColor: colors.primary.withAlpha(70),
          splashColor: colors.primary.withAlpha(50),
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [

                Text(
                  faq.title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: colors.primary
                  ),
                ),
                                
                Text(
                  faq.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}