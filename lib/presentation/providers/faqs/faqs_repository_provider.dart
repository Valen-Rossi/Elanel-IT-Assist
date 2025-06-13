import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:elanel_asistencia_it/infrastructure/datasources/faqs_fb_datasource.dart';
import 'package:elanel_asistencia_it/infrastructure/repositories/faqs_repository_impl.dart';

final faqsRepositoryProvider = Provider((ref) {
  return FAQsRepositoryImpl(FAQsFbDatasource());
});