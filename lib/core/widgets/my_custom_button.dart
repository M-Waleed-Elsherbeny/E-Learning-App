import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.color,
    this.style,
    this.width,
    this.height,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final TextStyle? style;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      height: height ?? 52.h,
      color: color ?? AppColors.kPrimaryColorBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      onPressed: onPressed,
      child: CustomText(
        title: text ?? "Type text here",
        style: style ?? AppTextStyle.font18White600,
      ),
    );
  }
}
