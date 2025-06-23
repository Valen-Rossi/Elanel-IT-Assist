import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:elanel_asistencia_it/domain/entities/ticket.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl); // por ejemplo: http://192.168.1.100:8000

  Future<List<String>> uploadMedia(List<File> files) async {
    final uri = Uri.parse('$baseUrl/upload/');
    final request = http.MultipartRequest('POST', uri);

    for (var file in files) {
      final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
      final parts = mimeType.split('/');
      final mediaType = MediaType(parts[0], parts[1]);

      request.files.add(
        await http.MultipartFile.fromPath(
          'files',
          file.path,
          contentType: mediaType,
        ),
      );
    }

    final streamed = await request.send();
    final response = await http.Response.fromStream(streamed);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return (data['urls'] as List).cast<String>();
    } else {
      throw Exception('Error subiendo archivos: ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
