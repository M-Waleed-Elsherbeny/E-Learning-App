import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({super.key, this.isLogin = true});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: isLogin
              ? "Don't have an account? "
              : "Already have an account? ",
          style: AppTextStyle.font16greyW400.copyWith(fontSize: 14.sp),
        ),
        GestureDetector(
          onTap: () {
            isLogin
                ? Navigator.pushNamed(context, AppRoutePath.signUpScreen)
                : Navigator.pop(context);
          },
          child: CustomText(
            title: isLogin ? "Sign Up" : "Login",
            style: AppTextStyle.font14BlueWBold,
          ),
        ),
      ],
    );
  }
}
