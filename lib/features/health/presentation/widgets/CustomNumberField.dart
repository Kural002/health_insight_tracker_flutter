import 'package:flutter/material.dart';

class CustomNumberField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Color color;
  final String? suffixText;
  final String emptyError;
  final String invalidError;
  final String? Function(double)? customValidator;

  const CustomNumberField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.color,
    required this.emptyError,
    required this.invalidError,
    this.suffixText,
    this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: color),
          suffixText: suffixText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return emptyError;
          }

          final v = double.tryParse(value);

          if (v == null) {
            return invalidError;
          }

          if (customValidator != null) {
            return customValidator!(v);
          }

          return null;
        },
      ),
    );
  }
}
