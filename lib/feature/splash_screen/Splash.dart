import 'package:breastnew/core/AppRouter.dart';
import 'package:breastnew/feature/auth/presentation/login/login_page.dart';
import 'package:breastnew/feature/home/presentation/home.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      AppRouter.router.push("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash.png"),
      ),
    );
  }
}
