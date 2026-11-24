import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) context.go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.4),
            radius: 1.2,
            colors: [Color(0xFF1B1436), C.bg],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 92, height: 92,
                decoration: BoxDecoration(
                  gradient: C.gradient,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: C.accent.withOpacity(0.5), blurRadius: 50, spreadRadius: 2)],
                ),
                child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 46),
              ),
              const SizedBox(height: 26),
              ShaderMask(
                shaderCallback: (r) => C.gradient.createShader(r),
                child: const Text('CREOVA AI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 2.5)),
              ),
              const SizedBox(height: 10),
              const Text('AI-powered influencer marketing,\nplanned and matched in minutes.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: C.textDim, height: 1.5)),
              const SizedBox(height: 46),
              const SizedBox(
                width: 26, height: 26,
                child: CircularProgressIndicator(strokeWidth: 2.5, valueColor: AlwaysStoppedAnimation(C.accentSoft)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
