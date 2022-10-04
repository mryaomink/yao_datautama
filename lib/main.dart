import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yao_datautama/auth_wrapper.dart';
import 'package:yao_datautama/firebase_options.dart';
import 'package:yao_datautama/provider/screen_index_provider.dart';
import 'package:yao_datautama/screen/yao_login.dart';
import 'package:yao_datautama/screen/yao_navbar.dart';
import 'package:yao_datautama/screen/yao_register.dart';
import 'package:yao_datautama/screen/yao_splash.dart';
import 'package:yao_datautama/service/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScreenIndexProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PT. Data Utama Yaomink',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const YaoSplash(),
          '/home': (context) => YaoNav(),
          '/login': (context) => const YaoLogin(),
          '/register': (context) => const YaoRegister(),
          '/auth': (context) => const AuthWrapper(),
        },
      ),
    );
  }
}
