import 'package:elanel_asistencia_it/domain/datasources/faqs_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/faq.dart';
import 'package:elanel_asistencia_it/domain/repositories/faqs_repository.dart';


class FAQsRepositoryImpl extends IFAQsRepository {

  final IFAQsDatasource datasource;

  FAQsRepositoryImpl(this.datasource);

  @override
  Future<List<FAQ>> getFAQs() {
    return datasource.getFAQs();
  }

  @override
  Future<void> addFAQ(FAQ faq) {
    // TODO: implement addFAQ
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFAQ(String id) {
    // TODO: implement deleteFAQ
    throw UnimplementedError();
  }

  @override
  Future<void> updateFAQ(FAQ faq) {
    // TODO: implement updateFAQ
    throw UnimplementedError();
  }
  
}