// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.name,
    this.height,
    required this.width,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.enabled = true,
    this.maxLines,
    this.borderCurve = 100,
    this.leftPadding = 10,
    this.onChanged,
    this.prefilledData,
    this.prefixIcon,
    this.textEditingController,
    this.inputFormatters,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    required this.outlineColor,
  });

  final String name;
  final String? prefilledData;
  final String? hintText;
  final double? height;
  final double width;
  final double borderCurve;
  final int? maxLines;
  final double leftPadding;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  final TextInputType? keyboardType;
  final bool? prefixIcon;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final Color outlineColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: leftPadding),
      child: SizedBox(
        height: height,
        width: width,
        child: FormBuilderTextField(
          style: const TextStyle(color: Colors.white),
          textInputAction: textInputAction,
          focusNode: focusNode,
          controller: textEditingController,
          initialValue: prefilledData,
          onChanged: onChanged,
          maxLines: maxLines,
          textCapitalization: TextCapitalization.sentences,
          enabled: enabled,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2.w,
                color: Colors.white,
              ),
            ),
            filled: true,
            fillColor: Colors.black54,
            contentPadding: const EdgeInsets.only(left: 20),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white54),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 2.w,
                color: outlineColor,
              ),
            ),
          ),
          name: name,
        ),
      ),
    );
  }
}
