import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

import 'package:elanel_asistencia_it/domain/entities/user.dart';
import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:elanel_asistencia_it/presentation/widgets/widgets.dart';

class UserScreen extends ConsumerStatefulWidget {
  static const name = 'user-screen';

  final String userId;

  const UserScreen({super.key, required this.userId});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String userName;
  late String userEmail;
  late UserRole userRole;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    final user = ref.read(userByIdProvider(widget.userId));
    userName = user.name;
    userEmail = user.email;
    userRole = user.role;
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userByIdProvider(widget.userId));
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Editar Usuario',
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
                initialValue: userName,
                label: 'Nombre del Usuario',
                hintText: 'Ejemplo: Lautaro Rodríguez',
                icon: Icons.title,
                textCapitalization: TextCapitalization.words,
                onChanged: (value) => userName = value.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'El nombre del usuario es requerido';
                  if (value.length < 4) return 'El nombre del usuario debe tener al menos 4 caracteres';
                  if (value.length > 20) return 'El nombre del usuario no puede tener más de 20 caracteres';
                  return null;
                },
              ),
              CustomTextFormField(
                initialValue: userEmail,
                label: 'Correo del Usuario',
                hintText: 'Ejemplo: lautaro@gmail.com',
                icon: Icons.mail_outline_rounded,
                textCapitalization: TextCapitalization.none,
                textInputType: TextInputType.emailAddress,
                onChanged: (value) => userEmail = value.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'El correo del usuario es requerido';
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) return 'El correo del usuario no tiene un formato válido';
                  return null;
                },
              ),
              CustomDropdownFormField<UserRole>(
                label: 'Rol de Usuario',
                hint: 'Seleccione el rol de usuario',
                value: userRole,
                items: UserRole.values
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.label),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) setState(() => userRole = value);
                },
                validator: (value) {
                  if (value == null) return 'El rol de usuario es obligatorio';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              FilledButton.icon(
                onPressed: () async {
                  final isValid = _formKey.currentState!.validate();
                  if (!isValid || isLoading) {
                    if (await Vibration.hasVibrator()) {
                      Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
                    }
                    return;
                  }

                  setState(() => isLoading = true);

                  final updatedUser = user.copyWith(
                    name: userName,
                    email: userEmail,
                    role: userRole,
                  );

                  await ref.read(usersProvider.notifier).userUpdate(updatedUser);

                  setState(() => isLoading = false);

                  if (await Vibration.hasVibrator()) {
                    Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
                  }

                  if (context.mounted) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Usuario actualizado con éxito'),
                        duration: const Duration(seconds: 3),
                        backgroundColor: colors.primary,
                      ),
                    );
                  }
                },
                label: const Text(
                  'Guardar Cambios',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                icon: const Icon(Icons.save_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
