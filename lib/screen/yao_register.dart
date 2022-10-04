import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/auth_service.dart';

class YaoRegister extends StatefulWidget {
  const YaoRegister({Key? key}) : super(key: key);

  @override
  State<YaoRegister> createState() => _YaoRegisterState();
}

class _YaoRegisterState extends State<YaoRegister> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController numController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    String gender = 'Pria';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'PENDAFTARAN',
          style: TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     RadioListTile(
                  //         title: const Text('Pria'),
                  //         value: true,
                  //         groupValue: gender,
                  //         onChanged: (value) => {
                  //               setState(() {
                  //                 gender = value.toString();
                  //               }),
                  //             }),
                  //     RadioListTile(
                  //         title: const Text('WANITA'),
                  //         value: false,
                  //         groupValue: gender,
                  //         onChanged: (value) => {
                  //               setState(() {
                  //                 gender = value.toString();
                  //               }),
                  //             })
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      Text('Nama Lengkap'),
                    ],
                  ),
                  TextFormField(
                    controller: namaController,
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
                        Icons.email,
                        color: Colors.black,
                      ),
                      Text('Email Aktif'),
                    ],
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
                        Icons.call,
                        color: Colors.black,
                      ),
                      Text('No HP/WA'),
                    ],
                  ),
                  TextFormField(
                    controller: numController,
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
                    height: 20.0,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.lock_open,
                        color: Colors.black,
                      ),
                      Text('Ulangi Password'),
                    ],
                  ),
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
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 52.0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2A4187),
                      ),
                      onPressed: () async {
                        authService.createWithEmail(
                            emailController.text, passController.text);
                        await Navigator.pushNamed(context, '/login');
                      },
                      child: const Text(
                        'BUAT AKUN',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
