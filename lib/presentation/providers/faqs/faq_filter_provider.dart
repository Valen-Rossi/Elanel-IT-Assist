import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elanel_asistencia_it/domain/entities/faq.dart';
import 'faqs_provider.dart';

final faqFilterProvider = StateProvider<FAQType?>((ref) => null);
final faqSearchTermProvider = StateProvider<String>((ref) => '');

final filteredFaqsProvider = Provider<List<FAQ>>((ref) {
  final allFaqs = ref.watch(faqsProvider);
  final selectedType = ref.watch(faqFilterProvider);
  final searchTerm = ref.watch(faqSearchTermProvider).toLowerCase();

  return allFaqs.where((faq) {
    final matchesType = selectedType == null || faq.type == selectedType;
    final matchesTitle = faq.title.toLowerCase().contains(searchTerm);
    return matchesType && matchesTitle;
  }).toList();
});
