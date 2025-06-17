import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:elanel_asistencia_it/domain/entities/ticket.dart';
import 'package:elanel_asistencia_it/domain/entities/feedback.dart';
import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';

class NewFeedbackCard extends ConsumerStatefulWidget {
  final Ticket ticket;

  const NewFeedbackCard({
    super.key,
    required this.ticket,
  });

  @override
  NewFeedbackCardState createState() => NewFeedbackCardState();
}

class NewFeedbackCardState extends ConsumerState<NewFeedbackCard> {
  double _rating = 0.0;
  final commentController = TextEditingController();
  bool isSubmitting = false;

  void _setRating(double value) {
    setState(() {
      _rating = value;
    });
  }

  Future<void> _submitFeedback(ColorScheme colors) async {
    if (_rating == 0.0) {
      Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor seleccioná una calificación'),
          backgroundColor: colors.error,
        ),
      );
      return;
    }
    if (!isSubmitting){

    setState(() => isSubmitting = true);

      final feedback = TicketFeedback(
        ticketId: widget.ticket.id,
        rating: _rating,
        comment: commentController.text.trim(),
        createdAt: DateTime.now(),
      );

      await ref.read(feedbacksProvider.notifier).createFeedback(feedback);
      await ref.read(recentTicketsProvider.notifier).updateTicket(widget.ticket.copyWith(hasFeedback: true));
      if (mounted) {
        Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡Feedback enviado con éxito!'),
            backgroundColor: colors.primary,
          ),
        );
      }
      setState(() {
        _rating = 0;
        commentController.clear();
      });

      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            'Calificá el servicio recibido',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          // Estrellas
          Row(
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return GestureDetector(
                onTap: () => _setRating(starIndex.toDouble()),
                onLongPress: () => _setRating(starIndex - 0.5),
                child: Icon(
                  _rating >= starIndex
                      ? Icons.star
                      : (_rating >= starIndex - 0.5
                          ? Icons.star_half
                          : Icons.star_border),
                  color: Colors.amber,
                  size: 32,
                ),
              );
            }),
          ),

          const SizedBox(height: 8),

          // Puntaje numérico
          Text('Puntaje: $_rating', style: TextStyle(fontSize: 16, color: colors.primary)),

          const SizedBox(height: 20),

          // Comentario opcional
          CustomTextFormField(
            controller: commentController,
            label: 'Comentario (opcional)',
            hintText: 'Por ejemplo: Muy rápido y eficiente',
            maxLines: 10,
            icon: Icons.comment,
          ),

          const SizedBox(height: 20),

          // Botón enviar
          ElevatedButton.icon(
            onPressed: isSubmitting ? null : () => _submitFeedback(colors),
            icon: const Icon(Icons.send),
            label: isSubmitting
                ? const CircularProgressIndicator()
                : const Text('Enviar Feedback'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: colors.primary,
              foregroundColor: colors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
