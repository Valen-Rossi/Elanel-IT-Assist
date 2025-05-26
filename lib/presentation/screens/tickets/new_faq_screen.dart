import 'package:elanel_asistencia_it/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NewFAQScreen extends StatefulWidget {

  static const name = 'new-faq-screen';

  const NewFAQScreen({super.key});

  @override
  State<NewFAQScreen> createState() => _NewFAQScreenState();
}

class _NewFAQScreenState extends State<NewFAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewFAQ'),
      ),
      body: const _NewFAQView(),
    );
  }
}

class _NewFAQView extends StatelessWidget {
 const _NewFAQView();

 @override
 Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          spacing: 20,
          children: [

            CustomTextFormField(
              label: 'Título',
              hintText: 'Ingrese el título del problema',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'El título es obligatorio';
                }
                return null;
              },
            ),

            CustomTextFormField(
              label: 'Descripción',
              hintText: 'Ingrese la descripción de la solución',
              minLines: 10,
              maxLines: 25,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'La descripción es obligatoria';
                }
                return null;
              },
            ),
            
            ElevatedButton.icon(
              onPressed: () {
                // Aquí se implementaría la lógica para guardar el FAQ
                
              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar'),
            ),
          
          ],
        ),
      ),
    ),
  );
 }
}