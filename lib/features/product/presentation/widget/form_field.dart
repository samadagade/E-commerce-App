import 'package:flutter/material.dart';

class ReusableFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool obscureText;
  final bool isPasswordField;
  final bool isVisible;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;
  final IconData prefixIcon;

  // ignore: use_super_parameters
  const ReusableFormField({
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.isPasswordField = false,
    this.isVisible = false,
    this.toggleVisibility,
    this.validator,
    required this.prefixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordField && !isVisible,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black87),
        prefixIcon: Icon(prefixIcon, color: Colors.black54),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        filled: true,
        // ignore: deprecated_member_use
        fillColor: Colors.white.withOpacity(0.6),
        contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white70, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: validator,
    );
  }
}
