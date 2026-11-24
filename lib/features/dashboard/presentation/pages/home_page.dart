import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      nav: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const Avatar('Mohamed Sharaf', size: 46),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Good evening', style: TextStyle(fontSize: 12.5, color: C.textDim)),
                Text('Nova Cosmetics', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: C.text)),
              ]),
            ),
            _iconBtn(Icons.search_rounded),
            const SizedBox(width: 8),
            _iconBtn(Icons.notifications_none_rounded, dot: true),
          ]),
          const SizedBox(height: 22),
          GCard(
            gradient: const LinearGradient(colors: [Color(0xFF2A2160), Color(0xFF173040)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Tag('ACTIVE', color: C.teal),
                const Spacer(),
                Text('EGP 25,000 budget', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.75), fontWeight: FontWeight.w600)),
              ]),
              const SizedBox(height: 12),
              const Text('Ramadan Glow Campaign', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white)),
              const SizedBox(height: 6),
              Text('3 creators hired - 2 deliverables awaiting review', style: TextStyle(fontSize: 12.5, color: Colors.white.withOpacity(0.7))),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(value: 0.62, minHeight: 7, backgroundColor: Colors.white.withOpacity(0.15), valueColor: const AlwaysStoppedAnimation(C.teal)),
              ),
              const SizedBox(height: 8),
              Text('62% complete', style: TextStyle(fontSize: 11.5, color: Colors.white.withOpacity(0.75), fontWeight: FontWeight.w600)),
            ]),
          ),
          const SizedBox(height: 22),
          const Row(children: [
            Expanded(child: StatTile(value: '4', label: 'Campaigns', icon: Icons.rocket_launch_rounded, color: C.accentSoft)),
            SizedBox(width: 12),
            Expanded(child: StatTile(value: '12', label: 'Proposals', icon: Icons.description_rounded, color: C.teal)),
            SizedBox(width: 12),
            Expanded(child: StatTile(value: '7', label: 'Creators', icon: Icons.people_alt_rounded, color: C.pink)),
          ]),
          const SizedBox(height: 22),
          const SectionTitle('Quick actions'),
          const SizedBox(height: 12),
          Row(children: [
            Expanded(child: _action(Icons.auto_awesome_rounded, 'New AI\ncampaign', C.accent)),
            const SizedBox(width: 12),
            Expanded(child: _action(Icons.travel_explore_rounded, 'Discover\ncreators', C.teal)),
            const SizedBox(width: 12),
            Expanded(child: _action(Icons.work_outline_rounded, 'Open\nworkspace', C.pink)),
          ]),
          const SizedBox(height: 22),
          const SectionTitle('Recent activity', action: 'See all'),
          const SizedBox(height: 12),
          _activity(Icons.check_circle_rounded, C.teal, 'Proposal accepted', 'Nora Khaled accepted your proposal - workspace created.', '2h'),
          _activity(Icons.auto_awesome, C.accentSoft, 'AI plan ready', 'Your Ramadan Glow plan v3 is ready to review.', '5h'),
          _activity(Icons.star_rounded, C.amber, 'New review', 'You rated Omar Adel 5 stars. Rating updated.', '1d'),
          _activity(Icons.upload_file_rounded, C.blue, 'Deliverable submitted', 'Sara Mostafa uploaded "Reel_v2.mp4".', '1d'),
        ],
      ),
    );
  }

  Widget _iconBtn(IconData icon, {bool dot = false}) {
    return Stack(children: [
      Container(
        width: 42, height: 42,
        decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: C.border)),
        child: Icon(icon, size: 20, color: C.text),
      ),
      if (dot) Positioned(top: 9, right: 10, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: C.pink, shape: BoxShape.circle))),
    ]);
  }

  Widget _action(IconData icon, String label, Color color) {
    return GCard(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      child: Column(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(15)),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(height: 10),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: C.text, height: 1.35)),
      ]),
    );
  }

  Widget _activity(IconData icon, Color color, String title, String sub, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: color.withOpacity(0.13), borderRadius: BorderRadius.circular(13)),
          child: Icon(icon, size: 19, color: color),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: C.text)),
          const SizedBox(height: 2),
          Text(sub, style: const TextStyle(fontSize: 12, color: C.textDim), maxLines: 1, overflow: TextOverflow.ellipsis),
        ])),
        Text(time, style: const TextStyle(fontSize: 11, color: C.textFaint)),
      ]),
    );
  }
}
