import 'package:ecommerce/common/widgets/bottom_bar.dart';
import 'package:ecommerce/constants/global_variables.dart';
import 'package:ecommerce/feature/admin/screens/admin_screen.dart';
import 'package:ecommerce/feature/auth/screens/auth_screen.dart';
import 'package:ecommerce/feature/auth/services/auth_service.dart';
import 'package:ecommerce/providers/user_provider.dart';
import 'package:ecommerce/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    var userType = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: userType.token.isNotEmpty
          ? userType.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
