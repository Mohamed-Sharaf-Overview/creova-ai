import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class PlanReviewPage extends StatelessWidget {
  const PlanReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackHeader(title: 'Campaign plan', trailing: Tag('v3', color: C.accentSoft)),
        const SizedBox(height: 20),
        GCard(
          gradient: const LinearGradient(colors: [Color(0xFF241D4D), Color(0xFF141428)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              AiBadge(text: 'AI GENERATED'),
              SizedBox(width: 8),
              Tag('model creova-plan-0.3', color: C.textDim, icon: Icons.memory_rounded),
            ]),
            const SizedBox(height: 14),
            const Text('Ramadan Glow Campaign', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
            const SizedBox(height: 6),
            Text('Objective: brand awareness - Women 18-35 - Egypt - Mar 1 to Mar 30',
                style: TextStyle(fontSize: 12.5, color: Colors.white.withOpacity(0.72), height: 1.5)),
          ]),
        ),
        const SizedBox(height: 20),
        const SectionTitle('Budget split', action: 'EGP 25,000'),
        const SizedBox(height: 12),
        GCard(child: Column(children: [
          _budgetRow('UGC content production', 0.40, '10,000', C.pink),
          _budgetRow('Paid amplification (Meta)', 0.35, '8,750', C.accentSoft),
          _budgetRow('TikTok Spark Ads', 0.15, '3,750', C.teal),
          _budgetRow('Contingency', 0.10, '2,500', C.amber),
        ])),
        const SizedBox(height: 20),
        const SectionTitle('Timeline'),
        const SizedBox(height: 12),
        GCard(child: Column(children: [
          _phase('Week 1', 'Creator outreach and contracts', true),
          _phase('Week 2', 'Content production and reviews', true),
          _phase('Week 3', 'Paid amplification launch', false),
          _phase('Week 4', 'Optimization and wrap-up report', false, last: true),
        ])),
        const SizedBox(height: 20),
        const SectionTitle('Estimated KPIs'),
        const SizedBox(height: 12),
        const Row(children: [
          Expanded(child: StatTile(value: '480K', label: 'Reach', icon: Icons.groups_rounded, color: C.blue)),
          SizedBox(width: 12),
          Expanded(child: StatTile(value: '5.8%', label: 'Engagement', icon: Icons.favorite_rounded, color: C.pink)),
          SizedBox(width: 12),
          Expanded(child: StatTile(value: '9-12', label: 'Reels', icon: Icons.video_library_rounded, color: C.teal)),
        ]),
        const SizedBox(height: 26),
        PrimaryButton(label: 'Find matching creators', icon: Icons.travel_explore_rounded, onTap: () {}),
        const SizedBox(height: 12),
        const Row(children: [
          Expanded(child: GhostButton(label: 'Edit plan', icon: Icons.edit_outlined)),
          SizedBox(width: 12),
          Expanded(child: GhostButton(label: 'Regenerate', icon: Icons.refresh_rounded)),
        ]),
      ]),
    );
  }

  Widget _budgetRow(String name, double share, String amount, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(children: [
        Row(children: [
          Expanded(child: Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: C.text))),
          Text('${(share * 100).round()}%', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: color)),
          const SizedBox(width: 8),
          Text(amount, style: const TextStyle(fontSize: 12.5, color: C.textDim)),
        ]),
        const SizedBox(height: 7),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(value: share, minHeight: 6, backgroundColor: C.cardAlt, valueColor: AlwaysStoppedAnimation(color)),
        ),
      ]),
    );
  }

  Widget _phase(String week, String desc, bool done, {bool last = false}) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(children: [
        Container(
          width: 22, height: 22,
          decoration: BoxDecoration(shape: BoxShape.circle, color: done ? C.teal.withOpacity(0.15) : C.cardAlt, border: Border.all(color: done ? C.teal : C.border)),
          child: done ? const Icon(Icons.check, size: 13, color: C.teal) : null,
        ),
        if (!last) Container(width: 2, height: 34, color: C.border),
      ]),
      const SizedBox(width: 12),
      Expanded(child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(week, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.accentSoft)),
          const SizedBox(height: 2),
          Text(desc, style: const TextStyle(fontSize: 13.5, color: C.text)),
        ]),
      )),
    ]);
  }
}
