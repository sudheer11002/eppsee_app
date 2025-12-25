import 'package:flutter/material.dart';
import 'package:eppsee/src/constants/app_colors.dart';
import 'package:eppsee/src/constants/app_dimens.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final String? prefixImage;
  final List<Color>? prefixGradientColors;
  final Color? inputFilledColor;
  final Color? borderColor;

  const CustomInputField({
    super.key,
    required this.label,
    this.hintText,
    this.initialValue,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isPassword = false,
    this.prefixImage,
    this.prefixGradientColors,
    this.inputFilledColor,
    this.borderColor,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late TextEditingController controller;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _obscureText = widget.isPassword;
  }

  void _toggleVisibility() {
    if (widget.isPassword) {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(color: AppColors.white),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.white.withValues(alpha: 0.4)),
        filled: true,
        fillColor: widget.inputFilledColor ?? AppColors.secondaryDark,
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppDimens.size16,
          horizontal: AppDimens.size12,
        ),
        prefixIcon: widget.prefixImage != null
            ? Padding(
                padding: const EdgeInsets.all(AppDimens.size12),
                child: Image.asset(widget.prefixImage!, width: 20, height: 20, color: Colors.white),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.size10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.size10),
          borderSide: BorderSide(
            color: widget.borderColor ?? AppColors.secondaryDark,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
