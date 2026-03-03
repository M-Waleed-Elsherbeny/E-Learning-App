import 'package:e_learning_app/core/routes/app_route_path.dart';
import 'package:e_learning_app/core/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyCustomButton(
          text: "Logout",
          onPressed: () {
            Supabase.instance.client.auth.signOut().then((_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutePath.loginScreen,
                (route) => false,
              );
            });
          },
        ),
      ),
    );
  }
}
