import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    this.style,
    this.maxLines,
    this.overflow,
  });
  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? AppTextStyle.font16BlackWBold,
      maxLines: maxLines ?? 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      textScaler: const TextScaler.linear(1),
    );
  }
}
