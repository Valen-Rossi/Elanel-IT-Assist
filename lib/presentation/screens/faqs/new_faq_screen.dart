import 'package:elanel_asistencia_it/domain/entities/faq.dart';
import 'package:elanel_asistencia_it/presentation/providers/faqs/faqs_provider.dart';
import 'package:flutter/material.dart';
import 'package:elanel_asistencia_it/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_toolbar/markdown_toolbar.dart';

class NewFAQScreen extends ConsumerStatefulWidget {
  static const name = 'new-faq-screen';

  const NewFAQScreen({super.key});

  @override
  NewFAQScreenState createState() => NewFAQScreenState();
}

class NewFAQScreenState extends ConsumerState<NewFAQScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _descriptionController = TextEditingController();

  String faqTitle = '';
  FAQType faqType = FAQType.hardware;
  bool isLoading = false;

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nueva Pregunta Frecuente',
          style: TextStyle(
            color: colors.primary,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [

              CustomTextFormField(
                label: 'Título',
                hintText: 'Ingrese el título del problema',
                icon: Icons.title,
                onChanged: (value) => faqTitle = value.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El título es obligatorio';
                  }
                  return null;
                },
              ),

              MarkdownToolbar(
                useIncludedTextField: false,
                controller: _descriptionController,
                alignment: WrapAlignment.center,
                width: 50,
                backgroundColor: colors.surface,
                iconColor: colors.onSurface,
              ),

              CustomTextFormField(
                label: 'Descripción',
                hintText: 'Detalla la solución del problema',
                controller: _descriptionController,
                minLines: 10,
                maxLines: 25,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'La descripción es obligatoria';
                  }
                  return null;
                },
              ),

              FilledButton.tonalIcon(
                onPressed: () async {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid || isLoading) return;

                  setState(() => isLoading = true);

                  final newFAQ = FAQ(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    title: faqTitle,
                    description: _descriptionController.text.trim(),
                    type: faqType,
                  );

                  await ref
                      .read(faqsProvider.notifier)
                      .createFAQ(newFAQ);

                  setState(() => isLoading = false);

                  if (context.mounted) {
                    Navigator.of(context).pop();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('FAQ creada con éxito'),
                        duration: const Duration(seconds: 3),
                        backgroundColor: colors.primary,
                      ),
                    );
                  }
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
