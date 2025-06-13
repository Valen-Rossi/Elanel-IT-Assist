import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class FeedbackCard extends ConsumerWidget {
  final String feedbackId;

  const FeedbackCard({
    super.key,
    required this.feedbackId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedback = ref.watch(feedbackByIdProvider(feedbackId));
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withAlpha(150),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Fecha
          Text(
            DateFormat('dd MMM yyyy – HH:mm').format(feedback.createdAt),
            style: TextStyle(
              fontSize: 12,
              color: colors.outline,
            ),
          ),

          const SizedBox(height: 12),

          // Estrellas con soporte para .5
          Row(
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              if (feedback.rating >= starIndex) {
                return const Icon(Icons.star_rounded, color: Colors.amber, size: 24);
              } else if (feedback.rating >= starIndex - 0.5) {
                return const Icon(Icons.star_half_rounded, color: Colors.amber, size: 24);
              } else {
                return Icon(Icons.star_border_rounded, color: colors.outline, size: 24);
              }
            }),
          ),

          const SizedBox(height: 12),

          // Comentario
          Text(
            feedback.comment!=''
            ? feedback.comment
            :'No hay comentarios disponibles.',
            style: TextStyle(
              fontSize: 16,
              color: colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
