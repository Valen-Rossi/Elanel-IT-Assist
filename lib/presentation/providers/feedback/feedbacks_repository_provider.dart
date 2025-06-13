import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:elanel_asistencia_it/infrastructure/datasources/feedbacks_fb_datasource.dart';
import 'package:elanel_asistencia_it/infrastructure/repositories/feedbacks_repository_impl.dart';

final feedbacksRepositoryProvider = Provider((ref) {
  return FeedbacksRepositoryImpl(FeedbacksFbDatasource());
});