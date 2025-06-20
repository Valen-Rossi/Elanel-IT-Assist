import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elanel_asistencia_it/domain/datasources/tickets_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/ticket.dart';
import 'package:elanel_asistencia_it/infrastructure/mappers/ticket_mapper.dart';
import 'package:elanel_asistencia_it/infrastructure/models/firebase/ticket_firebase.dart';

class TicketsFbDatasource extends ITicketsDatasource {
  final _db = FirebaseFirestore.instance.collection('tickets');

  @override
  Future<List<Ticket>> getTickets() async {
    final snap = await _db.orderBy('createdAt', descending: true).get();
    return snap.docs
        .map((d) => TicketMapper.fromFirebase(
            TicketFromFirebase.fromJson(d.id, d.data())))
        .toList();
  }

  @override
  Future<void> addTicket(Ticket ticket) async {
    final fb = TicketMapper.toFirebase(ticket);
    await _db.doc(ticket.id).set(fb.toJson());
  }

  @override
  Future<void> updateTicket(Ticket ticket) async {
    final fb = TicketMapper.toFirebase(ticket);
    await _db.doc(ticket.id).update(fb.toJson());
  }

  @override
  Future<void> deleteTicket(String id) async {
    await _db.doc(id).delete();
  }
}
