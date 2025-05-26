import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelpView extends ConsumerStatefulWidget {

  static const name = 'help-view';

  const HelpView({super.key});

  @override
  HelpViewState createState() => HelpViewState();
}

class HelpViewState extends ConsumerState<HelpView> {

  @override
  void initState() {
    super.initState();

    ref.read(faqsProvider.notifier).loadFAQs();

  }

  @override
  Widget build(BuildContext context) {

    final faqs = ref.watch(faqsProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Preguntas Frecuentes'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return ListTile(
            title: Text(faq.title),
            subtitle: Text(faq.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              // Aquí podrías implementar una acción al tocar el FAQ
            },
          );
        },
      ),
  );
 }
}