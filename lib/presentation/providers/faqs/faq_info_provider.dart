import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/faq.dart';
import 'package:elanel_asistencia_it/presentation/providers/faqs/faqs_provider.dart';

// Provider to fetch a FAQ by its ID
final faqByIdProvider = Provider.family<FAQ, String>((ref, faqId) {
  final faqs = ref.watch(faqsProvider);
  return faqs.firstWhere((faq) => faq.id == faqId);
});