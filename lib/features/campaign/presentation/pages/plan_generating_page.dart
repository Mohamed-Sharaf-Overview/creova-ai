import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class PlanGeneratingPage extends StatefulWidget {
  const PlanGeneratingPage({super.key});

  @override
  State<PlanGeneratingPage> createState() => _PlanGeneratingPageState();
}

class _PlanGeneratingPageState extends State<PlanGeneratingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) context.pushReplacement('/campaign/plan');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(children: [
            const BackHeader(title: 'AI plan'),
            const Spacer(),
            Stack(alignment: Alignment.center, children: [
              Container(width: 150, height: 150, decoration: BoxDecoration(shape: BoxShape.circle, color: C.accent.withOpacity(0.08))),
              Container(width: 110, height: 110, decoration: BoxDecoration(shape: BoxShape.circle, color: C.accent.withOpacity(0.13))),
              Container(
                width: 76, height: 76,
                decoration: BoxDecoration(gradient: C.gradient, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: C.accent.withOpacity(0.5), blurRadius: 30)]),
                child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 34),
              ),
            ]),
            const SizedBox(height: 30),
            const Text('AI is crafting your plan...', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text)),
            const SizedBox(height: 8),
            const Text('Job queued - you will get a notification when it is ready.\nNo need to keep the app open.', textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: C.textDim, height: 1.5)),
            const SizedBox(height: 32),
            _step('Analyzing your brief', true, true),
            _step('Matching platforms and audience', true, true),
            _step('Building budget split and timeline', true, false),
            _step('Estimating KPIs', false, false),
            const Spacer(),
            const Tag('Running in background - GeneratePlanJob', color: C.teal, icon: Icons.cloud_queue_rounded),
            const SizedBox(height: 14),
            const GhostButton(label: 'Notify me and close', icon: Icons.notifications_active_outlined, to: '/notifications'),
          ]),
        ),
      ),
    );
  }

  Widget _step(String t, bool started, bool done) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(children: [
        Container(
          width: 26, height: 26,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? C.teal.withOpacity(0.15) : C.cardAlt,
            border: Border.all(color: done ? C.teal : started ? C.accentSoft : C.border),
          ),
          child: Icon(done ? Icons.check_rounded : started ? Icons.more_horiz : Icons.circle, size: done ? 15 : 10, color: done ? C.teal : started ? C.accentSoft : C.textFaint),
        ),
        const SizedBox(width: 12),
        Text(t, style: TextStyle(fontSize: 14, fontWeight: started ? FontWeight.w600 : FontWeight.w400, color: started ? C.text : C.textFaint)),
      ]),
    );
  }
}
