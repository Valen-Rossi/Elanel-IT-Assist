import 'package:elanel_asistencia_it/domain/entities/faq.dart';


abstract class IFAQsDatasource {
  
  Future<List<FAQ>> getFAQs();
  Future<void> addFAQ(FAQ faq);
  Future<void> updateFAQ(FAQ faq);
  Future<void> deleteFAQ(String id);
  
}