import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class ProviderProfilePage extends StatelessWidget {
  const ProviderProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      nav: 4,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackHeader(title: 'Provider profile'),
        const SizedBox(height: 22),
        Center(child: Column(children: [
          const Avatar('Nora Khaled', size: 88),
          const SizedBox(height: 12),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Nora Khaled', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text)),
            SizedBox(width: 6),
            Icon(Icons.verified_rounded, size: 19, color: C.blue),
          ]),
          const SizedBox(height: 5),
          const Text('UGC Creator - Cairo, Egypt', style: TextStyle(fontSize: 13, color: C.textDim)),
          const SizedBox(height: 10),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Tag('4.9 rating', color: C.amber, icon: Icons.star_rounded),
            SizedBox(width: 8),
            Tag('23 projects', color: C.teal, icon: Icons.work_outline),
            SizedBox(width: 8),
            Tag('Verified', color: C.blue, icon: Icons.verified),
          ]),
        ])),
        const SizedBox(height: 22),
        const GCard(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              AiBadge(text: 'AI PORTFOLIO ANALYSIS'),
              Spacer(),
              Text('model v0.3', style: TextStyle(fontSize: 11, color: C.textFaint)),
            ]),
            SizedBox(height: 12),
            Wrap(spacing: 7, runSpacing: 7, children: [
              Tag('Beauty & Skincare', color: C.pink),
              Tag('Short-form video', color: C.teal),
              Tag('TikTok', color: C.accentSoft),
              Tag('Instagram Reels', color: C.accentSoft),
              Tag('Arabic + English', color: C.blue),
            ]),
            SizedBox(height: 12),
            Text('Strong hook game and natural product demos. Best performing content: morning routines and unboxings. Consistent posting cadence.',
                style: TextStyle(fontSize: 12.5, color: C.textDim, height: 1.55)),
          ]),
        ),
        const SizedBox(height: 20),
        const SectionTitle('Portfolio', action: '12 items'),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8, crossAxisSpacing: 8,
          children: const [
            _PortfolioTile('Reel', '48K views', C.pink),
            _PortfolioTile('Tutorial', '31K views', C.teal),
            _PortfolioTile('Unboxing', '27K views', C.accentSoft),
            _PortfolioTile('Review', '22K views', C.blue),
            _PortfolioTile('Routine', '19K views', C.amber),
            _PortfolioTile('GRWM', '15K views', C.pink),
          ],
        ),
        const SizedBox(height: 24),
        PrimaryButton(label: 'Send proposal', icon: Icons.send_rounded, onTap: () {}),
        const SizedBox(height: 12),
        const GhostButton(label: 'Message first', icon: Icons.chat_bubble_outline_rounded),
      ]),
    );
  }
}

class _PortfolioTile extends StatelessWidget {
  final String kind;
  final String views;
  final Color color;
  const _PortfolioTile(this.kind, this.views, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color.withOpacity(0.35), C.cardAlt], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.border),
      ),
      child: Stack(children: [
        Center(child: Icon(Icons.play_circle_fill_rounded, color: Colors.white.withOpacity(0.85), size: 30)),
        Positioned(
          left: 9, bottom: 8, right: 6,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(kind, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
            Text(views, style: TextStyle(fontSize: 9.5, color: Colors.white.withOpacity(0.75))),
          ]),
        ),
      ]),
    );
  }
}
