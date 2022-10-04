import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_datautama/service/auth_service.dart';

class YaoLogin extends StatelessWidget {
  const YaoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/dulogo.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  Text('Username/Email/Phone'),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.lock_open,
                    color: Colors.black,
                  ),
                  Text('Password'),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    'Lupa Password?',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 52.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2A4187),
                  ),
                  onPressed: () {
                    authService.signWithEmail(
                      emailController.text,
                      passController.text,
                    );
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Anda Anggota Baru?',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'DAFTAR DISINI',
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
