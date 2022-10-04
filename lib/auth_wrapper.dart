import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_datautama/model/user.dart';
import 'package:yao_datautama/screen/yao_login.dart';
import 'package:yao_datautama/screen/yao_navbar.dart';
import 'package:yao_datautama/service/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            return user == null ? const YaoLogin() : YaoNav();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
