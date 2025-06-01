import 'package:flutter/material.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const CustomDropdownFormField({
    super.key,
    this.label,
    this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );

    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: border,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade900)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade900)),
      ),
      items: items,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}
