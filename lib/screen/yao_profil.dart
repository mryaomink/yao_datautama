import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';

class YaoProfil extends StatelessWidget {
  const YaoProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Material(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              authService.signOut();
              Navigator.pushReplacementNamed(context, '/auth');
            },
            child: const Text('Logout')),
      ),
    );
  }
}
