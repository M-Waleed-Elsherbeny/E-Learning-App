import 'package:e_learning_app/core/helper/password_and_email_validations.dart';
import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/style/colors/app_colors.dart';
import 'package:e_learning_app/core/style/fonts/app_text_style.dart';
import 'package:e_learning_app/core/widgets/custom_text.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:e_learning_app/core/widgets/have_account_or_not.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/login_with_social_media.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:e_learning_app/features/auth/presentation/widgets/top_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = false;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopLogo(title: "Sign Up"),
          heightSpace(40),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.w),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title: "Name",
                        style: AppTextStyle.font14BlackW600,
                      ),
                      heightSpace(8),
                      CustomTextField(
                        labelText: "Enter your name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: AppColors.kLightBlue,
                        ),
                      ),
                      heightSpace(20),
                      CustomText(
                        title: "Email",
                        style: AppTextStyle.font14BlackW600,
                      ),
                      heightSpace(8),
                      CustomTextField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Email can't be empty";
                          if (!PasswordAndEmailValidations.isValidEmail(
                            email: value,
                          )) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        labelText: "Enter your email",
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.kLightBlue,
                        ),
                      ),
                      heightSpace(20),
                      CustomText(
                        title: "Password",
                        style: AppTextStyle.font14BlackW600,
                      ),
                      heightSpace(8),
                      CustomTextField(
                        controller: passwordController,
                        isPassword: !isPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          }
                          if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                        labelText: "Enter your password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.kLightBlue,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.kLightBlue,
                          ),
                          onPressed: () {
                            isPassword = !isPassword;
                            setState(() {});
                          },
                        ),
                      ),
                      heightSpace(20),
                      CustomText(
                        title: "Confirm Password",
                        style: AppTextStyle.font14BlackW600,
                      ),
                      heightSpace(8),
                      CustomTextField(
                        controller: confirmPasswordController,
                        isPassword: !isPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password can't be empty";
                          }
                          if (PasswordAndEmailValidations.hasMatchedPassword(
                            passwordController.text,
                            value,
                          )) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                        labelText: "Confirm your password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: AppColors.kLightBlue,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.kLightBlue,
                          ),
                          onPressed: () {
                            isPassword = !isPassword;
                            setState(() {});
                          },
                        ),
                      ),
                      heightSpace(20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          title: "Forgot password?",
                          style: AppTextStyle.font14BlueW500Underline,
                        ),
                      ),
                      heightSpace(30),
                      MyCustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // Perform sign up action
                          }
                        },
                        text: "Sign Up",
                      ),
                      heightSpace(18),
                      const LoginWithSocialMedia(),
                      heightSpace(50),
                      const HaveAccountOrNot(isLogin: false),
                      heightSpace(50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
