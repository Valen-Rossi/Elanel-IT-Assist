import 'package:elanel_asistencia_it/presentation/widgets/shared/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:elanel_asistencia_it/presentation/providers/providers.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userEmail = '';
  String userPassword = '';
  bool isLoading = false;
  bool isPasswordVisible = false;

  String? error;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 17,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 30),

                // Logo o imagen de la empresa
                Image.asset(
                  'assets/images/elanel.png',
                  height: 100,
                ),

                const SizedBox(height: 3),

                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 3),

                if (error != null)
                  Text(error!, style: const TextStyle(color: Colors.red)),

                CustomTextFormField(
                  label: 'Correo electrónico',
                  hintText: 'usuario@ejemplo.com',
                  icon: Icons.mail_outline_rounded,
                  onChanged: (value) => userEmail = value.trim(),
                  textInputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'El correo es requerido';
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'El correo no es válido';
                    }
                    return null;
                  },
                ),

                CustomTextFormField(
                  label: 'Contraseña',
                  hintText: 'Ingresa tu contraseña',
                  icon: Icons.lock_outline,
                  obscureText: !isPasswordVisible,
                  onChanged: (value) => userPassword = value.trim(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => isPasswordVisible = !isPasswordVisible);
                    },
                    icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  textInputType: TextInputType.visiblePassword,
                  textCapitalization: TextCapitalization.none,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) return 'La contraseña es requerida';
                    if (value.length < 6) return 'Debe tener al menos 6 caracteres';
                    if (!RegExp(r'\d').hasMatch(value)) return 'Debe contener al menos un número';
                    return null;
                  },
                ),

                const SizedBox(height: 3),

                FilledButton(
                  onPressed: isLoading ? null : () async {
                    final isValid = _formKey.currentState!.validate();
                    if (!isValid || isLoading) {
                      if (await Vibration.hasVibrator()) {
                        Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
                      }
                      return;
                    }

                    setState(() {
                      error = null;
                      isLoading = true;
                    });

                    try {
                      final authService = ref.read(authServiceProvider);
                      await authService.login(userEmail, userPassword);

                      if (context.mounted) context.go('/');
                    } catch (e) {
                      setState(() => error = 'Credenciales inválidas');
                    }

                    setState(() => isLoading = false);
                  },
                  child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
