import 'package:e_learning_app/core/helper/custom_loading.dart';
import 'package:e_learning_app/core/helper/spacer.dart';
import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:e_learning_app/features/profile/data/cubit/profile_cubit.dart';
import 'package:e_learning_app/features/profile/data/cubit/profile_state.dart';
import 'package:e_learning_app/features/profile/data/repo/profile_repo.dart';
import 'package:e_learning_app/features/profile/presentation/widgets/custom_buttons_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? userName, userEmail;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(ProfileRepo())..getUserName(),
      child: Scaffold(
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetUserNameSuccessState) {
              userName = state.userName;
              userEmail = state.userEmail;
              setState(() {});
            }
            if (state is ProfileStateSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutePath.loginScreen,
                (root) => false,
              );
            }
          },
          builder: (context, state) {
            return state is ProfileStateLoading
                ? customLoading()
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 15.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButtonsProfile(
                          userName: userName ?? "",
                          userEmail: userEmail ?? "",
                        ),
                        heightSpace(40),
                        MyCustomButton(
                          onPressed: () {
                            context.read<ProfileCubit>().signOut();
                          },
                          text: "Log Out",
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
