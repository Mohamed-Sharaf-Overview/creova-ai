import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerRight, child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => context.go('/home'), child: const Padding(padding: EdgeInsets.fromLTRB(16, 8, 4, 8), child: Text('Skip', style: TextStyle(color: C.textFaint, fontWeight: FontWeight.w600))))),
              const SizedBox(height: 22),
              Container(
                height: 300,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF241D4D), Color(0xFF132029)],
                    begin: Alignment.topLeft, end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: C.border),
                ),
                child: Stack(
                  children: [
                    Positioned(top: 30, left: 28, child: _bubble(const Avatar('Nora Khaled', size: 52), 0)),
                    Positioned(top: 96, right: 30, child: _bubble(const Avatar('Omar Adel', size: 44, gradient: C.gradient), 1)),
                    Positioned(bottom: 88, left: 60, child: _bubble(const Avatar('Sara Mostafa', size: 40, gradient: LinearGradient(colors: [C.teal, C.blue])), 2)),
                    Positioned(
                      bottom: 26, left: 0, right: 0,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(color: C.surface, borderRadius: BorderRadius.circular(30), border: Border.all(color: C.border)),
                          child: const Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(Icons.auto_awesome, size: 15, color: C.teal),
                            SizedBox(width: 7),
                            Text('Match score 94%', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: C.text)),
                          ]),
                        ),
                      ),
                    ),
                    const Positioned(top: 24, right: 26, child: AiBadge()),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text('Find the right creators\nfor your brand.', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w800, color: C.text, height: 1.25)),
              const SizedBox(height: 12),
              const Text('Describe your campaign, let AI build the plan, and get matched with verified media buyers and UGC creators.',
                  style: TextStyle(fontSize: 14, color: C.textDim, height: 1.55)),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _dot(true), _dot(false), _dot(false),
              ]),
              const SizedBox(height: 18),
              PrimaryButton(label: 'Get started', icon: Icons.arrow_forward_rounded, onTap: () => context.go('/login')),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(bool active) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        width: active ? 22 : 7, height: 7,
        decoration: BoxDecoration(
          gradient: active ? C.gradient : null,
          color: active ? null : C.border,
          borderRadius: BorderRadius.circular(6),
        ),
      );

  Widget _bubble(Widget child, int i) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: C.accent.withOpacity(0.25), blurRadius: 20)],
        ),
        child: child,
      );
}
