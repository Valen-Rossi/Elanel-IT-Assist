import 'package:elanel_asistencia_it/domain/datasources/faqs_datasource.dart';
import 'package:elanel_asistencia_it/domain/entities/faq.dart';


class FAQsFbDatasource extends IFAQsDatasource{

  final List<FAQ> faqs = [
    FAQ(
      id: '001',
      title: '¿Cómo puedo restablecer mi contraseña?',
      description: 'Para restablecer tu contraseña, ve a la página de inicio de sesión y haz clic en "¿Olvidaste tu contraseña?". Sigue las instrucciones para recibir un enlace de restablecimiento por correo electrónico.',
      type: FAQType.software,
    ),
    FAQ(
      id: '002',
      title: '¿Qué debo hacer si mi computadora no enciende?',
      description: 'Si tu computadora no enciende, verifica que esté conectada a la corriente y que el cable de alimentación esté en buen estado. Si sigue sin encender, contacta al soporte técnico.',
      type: FAQType.hardware,
    ),
    FAQ(
      id: '003',
      title: '¿Cómo puedo instalar una impresora nueva?',
      description: 'Para instalar una impresora nueva, conecta el cable USB o configura la conexión Wi-Fi. Luego, instala los controladores desde el sitio web del fabricante o desde el CD incluido.',
      type: FAQType.hardware,
    ),
  ];

  @override
  Future<List<FAQ>> getFAQs() async {
    return faqs;
  }
  
  @override
  Future<void> addFAQ(FAQ faq) async{
    faqs.insert(0, faq);
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