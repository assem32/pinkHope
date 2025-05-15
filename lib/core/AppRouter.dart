import 'package:breastnew/feature/auth/presentation/login/login_page.dart';
import 'package:breastnew/feature/drawer/presentation/chat/Chat.dart';
import 'package:breastnew/feature/drawer/presentation/doctors/DoctorsScreen.dart';
import 'package:breastnew/feature/drawer/presentation/riskFactor/RiskFactors.dart';
import 'package:breastnew/feature/drawer/presentation/symptoms/Symptoms.dart';
import 'package:breastnew/feature/drawer/presentation/whatIs/WhatIs.dart';
import 'package:breastnew/feature/home/presentation/home.dart';
import 'package:breastnew/feature/splash_screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SpalshScreen()),
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoginPage(),
            transitionDuration: const Duration(milliseconds: 1200),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              // Change the opacity of the screen using a Curve based on the the animation's
              // value
              return FadeTransition(
                opacity: CurveTween(
                  curve: Curves.easeInOutCirc,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),

      GoRoute(path: '/login/home', builder: (context, state) => HomePage()),
      
      GoRoute(path: '/login/home/riskfactor', builder: (context, state) => RiskFactors()),
      GoRoute(path: '/login/home/symptoms', builder: (context, state) => Symptoms()),
      GoRoute(path: '/login/home/doctors', builder: (context, state) => DoctorsScreen()),
      GoRoute(path: '/login/home/whatis', builder: (context, state) => WhatIs()),

      GoRoute(path: '/login/home/doctos/chat/:id', builder: (context, state) => ChatScreen(
        state.pathParameters['id']!
      )),


      
    ],
  );
}