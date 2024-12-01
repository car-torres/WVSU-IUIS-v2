import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class CustomTextField extends StatelessWidget {
  final String? _label;
  final String? _hint;
  final void Function(String)? _onChanged;
  final PhosphorFlatIconData? _icon;
  final bool _obscureText;
  final bool _enabled;

  const CustomTextField(
      {super.key,
      String? label,
      String? hint,
      void Function(String)? onChanged,
      PhosphorFlatIconData? icon,
      bool obscureText = false,
      final String? Function(String?)? validator,
      final bool enabled = true})
      : _obscureText = obscureText,
        _onChanged = onChanged,
        _hint = hint,
        _label = label,
        _icon = icon,
        _enabled = enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GlobalFontSize.standard,
      obscureText: _obscureText,
      onChanged: _onChanged,
      enabled: _enabled,
      decoration: InputDecoration(
        suffixIcon: _icon != null ? PhosphorIcon(_icon, size: 14) : null,
        labelText: _label,
        hintText: _hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GlobalFontSize.standard,
        enabledBorder: GlobalStyles.inputBorder,
        focusedBorder: GlobalStyles.inputBorder,
        disabledBorder: GlobalStyles.inputBorder,
        errorBorder: GlobalStyles.inputBorder,
        focusedErrorBorder: GlobalStyles.inputBorder,
        hintStyle: GlobalFontSize.standard
            .copyWith(color: GlobalColor.shadeDark.withAlpha(128)),
      ),
    );
  }
}
