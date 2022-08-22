// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 🌎 Project imports:

import 'rectangle_gradient_border.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final Icon? suffixIcon;
  final bool? readOnly;
  final int? maxLength;
  final int? maxLine;
  final Function(String?)? validator;
  final String hint;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final bool isEnabled;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;

  const LoginTextField({
    this.padding,
    required this.controller,
    required this.hint,
    this.suffixIcon,
    this.maxLength,
    this.onTap,
    this.maxLine,
    this.onEditingComplete,
    this.focusNode,
    this.validator,
    this.readOnly,
    this.keyboardType,
    this.inputFormatters,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    GradientPainter painter = GradientPainter(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.red.withOpacity(0.4),
              Colors.transparent
            ]),
        radius: 5,
        strokeWidth: 1);
    // var W = context.safePercentWidth;
    // var H = context.safePercentHeight;
    return Card(
      elevation: 3,
      child: CustomPaint(
        painter: painter,
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
          child: TextFormField(
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              maxLines: maxLine ?? 01,
              enabled: isEnabled,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              onTap: onTap,

              ///max length property weirdly expands the TF height, be careful while implementing it

              //maxLength: maxLength ?? TextField.noMaxLength,
              readOnly: readOnly ?? false,
              validator: (value) => validator?.call(value),
              controller: controller,
              decoration: InputDecoration(
                  contentPadding:
                      padding ?? const EdgeInsets.fromLTRB(12, 8, 12, 8),
                  hintStyle: const TextStyle(fontSize: 12),
                  suffixIcon: suffixIcon ??
                      const Icon(Icons.help_outline, color: Colors.transparent),
                  hintText: hint,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ))),
        ),
      ),
    );
  }
}
