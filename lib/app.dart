import 'package:flutter/material.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class CreovaApp extends StatelessWidget {
  const CreovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CREOVA AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      routerConfig: buildRouter(),
    );
  }
}
