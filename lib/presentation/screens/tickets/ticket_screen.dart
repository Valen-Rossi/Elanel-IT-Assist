import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

import 'package:elanel_asistencia_it/domain/entities/device.dart';
import 'package:elanel_asistencia_it/domain/entities/ticket.dart';
import 'package:elanel_asistencia_it/domain/entities/user.dart';
import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';

class TicketScreen extends ConsumerWidget {
  static const name = 'ticket-screen';
  final String ticketId;

  const TicketScreen({super.key, required this.ticketId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Ticket ticket = ref.watch(ticketByIdProvider(ticketId));
    final List<User> users = ref.watch(usersProvider);

    final User? technician = (ticket.technicianId != '')
        ? ref.watch(userByIdProvider(ticket.technicianId))
        : null;

    final Device device = ref.watch(deviceByIdProvider(ticket.deviceId));

    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalle del ticket',
          style: TextStyle(
            color: colors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _TicketView(
        ticket: ticket,
        technician: technician,
        users: users,
        device: device,
      ),
    );
  }
}

class _TicketView extends ConsumerStatefulWidget {
  const _TicketView({
    required this.ticket,
    required this.users,
    this.technician,
    required this.device,
  });

  final Ticket ticket;
  final List<User> users;
  final User? technician;
  final Device device;

  @override
  ConsumerState<_TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends ConsumerState<_TicketView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Información del ticket
          InfoTicketCard(size: size, ticket: widget.ticket, colors: colors),

          // Timeline separado en otro widget
          InfoTicketTimeline(
            ticket: widget.ticket,
            technician: widget.technician,
            users: widget.users,
            device: widget.device,
          ),
          
          widget.ticket.status != TicketStatus.resolved && widget.technician != null
              ? Padding(
                padding: const EdgeInsets.only(top: 27),
                child: SizedBox(
                  width: size.width,
                  child: FilledButton(
                    onPressed: () async {
                      final newStatus = widget.ticket.status != TicketStatus.inProgress
                          ? TicketStatus.inProgress
                          : TicketStatus.resolved;
                
                      final updatedTicket = widget.ticket.copyWith(status: newStatus);
                      await ref.read(recentTicketsProvider.notifier).updateTicket(updatedTicket);
                
                      if (await Vibration.hasVibrator()) {
                        Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
                      }
                
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              newStatus == TicketStatus.inProgress
                                  ? 'El ticket ha sido abierto con éxito.'
                                  : 'El ticket ha sido cerrado con éxito.',
                            ),
                            backgroundColor: colors.primary,
                          ),
                        );
                      }
                    },
                    child: Text(
                      widget.ticket.status != TicketStatus.inProgress
                          ? 'Abrir Ticket'
                          : 'Cerrar Ticket',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
              : widget.ticket.hasFeedback
                ? FeedbackCard(feedbackId: widget.ticket.id)
                : const Text('Este ticket no tiene feedback'),

        ],
      ),
    );
  }
}