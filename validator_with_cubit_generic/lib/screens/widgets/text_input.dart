import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.maxLine = 1,
      this.controller,
      this.icon,
      this.focusNode,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.hint,
      this.label,
      this.helperText,
      this.errorText,
      this.prefixText,
      this.shouldShowDropdownIcon,
      this.shouldEnableGesture,
      this.suffixText,
      this.keyboardType = TextInputType.name,
      this.suffixIcon,
      this.maxLength = 100,
      this.prefixIcon})
      : super(key: key);

  final String? initialValue;
  final String? hint;
  final String? label;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLine;
  final Icon? icon;
  final TextEditingController? controller;
  final AutovalidateMode autoValidateMode;
  final FocusNode? focusNode;
  final String? helperText;
  final String? prefixText;
  final String? errorText;
  final int? maxLength;
  final bool? shouldShowDropdownIcon;
  final bool? shouldEnableGesture;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      autovalidateMode: autoValidateMode,
      cursorColor: Colors.grey,
      maxLength: maxLength,
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLines: maxLine,
      readOnly: !(shouldEnableGesture ?? true),
      enabled: (shouldEnableGesture ?? true),
      decoration: InputDecoration(
        counterText: "",
        contentPadding: const EdgeInsets.all(16),

        // isDense: true,
        hintText: hint,
        prefixIcon: icon,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                width: 2),
            borderRadius: BorderRadius.circular(10)),

        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: BorderRadius.circular(10)),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(10)),

        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(10)),

        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.error),
            borderRadius: BorderRadius.circular(10)),
        prefixText: prefixText != null ? "$prefixText " : prefixText,
        suffixText: suffixText != null ? "$suffixText " : suffixText,
        helperText: helperText,
        labelText: label,
        errorText: errorText,
        suffixIcon: suffixIcon ??
            ((shouldShowDropdownIcon ?? false)
                ? const Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 24,
                  )
                : null),
        prefix: prefixIcon,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
