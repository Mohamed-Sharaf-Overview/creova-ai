import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Logo(size: 40),
              const SizedBox(height: 40),
              const Text('Welcome back', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800, color: C.text)),
              const SizedBox(height: 8),
              const Text('Sign in to continue your campaigns.', style: TextStyle(fontSize: 14, color: C.textDim)),
              const SizedBox(height: 30),
              const AppTextField(hint: 'Email address', icon: Icons.mail_outline_rounded),
              const SizedBox(height: 14),
              const AppTextField(hint: 'Password', icon: Icons.lock_outline_rounded),
              const SizedBox(height: 12),
              const Align(alignment: Alignment.centerRight, child: Text('Forgot password?', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: C.accentSoft))),
              const SizedBox(height: 24),
              PrimaryButton(label: 'Sign in', onTap: () {}),
              const SizedBox(height: 22),
              const Row(children: [
                Expanded(child: Divider(color: C.border)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('or', style: TextStyle(color: C.textFaint, fontSize: 12.5))),
                Expanded(child: Divider(color: C.border)),
              ]),
              const SizedBox(height: 22),
              const GhostButton(label: 'Continue with Google', icon: Icons.g_mobiledata_rounded),
              const SizedBox(height: 28),
              const Center(
                child: Text.rich(TextSpan(
                  text: "New to CREOVA? ",
                  style: TextStyle(color: C.textDim, fontSize: 13.5),
                  children: [TextSpan(text: 'Create account', style: TextStyle(color: C.accentSoft, fontWeight: FontWeight.w700))],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
