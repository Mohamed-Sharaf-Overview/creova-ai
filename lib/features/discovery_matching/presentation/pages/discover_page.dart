import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      nav: 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Discover', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: C.text)),
        const SizedBox(height: 4),
        const Text('AI-ranked matches for Ramadan Glow Campaign', style: TextStyle(fontSize: 13, color: C.textDim)),
        const SizedBox(height: 16),
        const AppTextField(hint: 'Search creators, skills, niches...', icon: Icons.search_rounded),
        const SizedBox(height: 14),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Tag('All', color: C.accentSoft, icon: Icons.check),
            SizedBox(width: 8),
            Tag('Media Buyers', color: C.textFaint),
            SizedBox(width: 8),
            Tag('UGC Creators', color: C.teal, icon: Icons.check),
            SizedBox(width: 8),
            Tag('Verified', color: C.blue, icon: Icons.verified),
            SizedBox(width: 8),
            Tag('Available now', color: C.textFaint),
          ]),
        ),
        const SizedBox(height: 18),
        _matchCard(
          name: 'Nora Khaled', role: 'UGC Creator', score: 0.94, rate: 'EGP 3,200/reel', rating: '4.9',
          topPick: true,
          reasons: [('Skills match 96%', C.teal), ('TikTok + IG', C.pink), ('In budget', C.accentSoft), ('Available', C.blue)],
        ),
        _matchCard(
          name: 'Omar Adel', role: 'Media Buyer', score: 0.89, rate: 'EGP 8,000/mo', rating: '4.8',
          reasons: [('Meta ads expert', C.teal), ('Beauty niche', C.pink), ('Rating 4.8', C.amber)],
        ),
        _matchCard(
          name: 'Layla Hassan', role: 'UGC Creator', score: 0.83, rate: 'EGP 2,600/reel', rating: '4.6',
          reasons: [('Skincare niche', C.teal), ('New provider boost', C.accentSoft)],
        ),
        _matchCard(
          name: 'Karim Nabil', role: 'Media Buyer', score: 0.78, rate: 'EGP 6,500/mo', rating: '4.5',
          reasons: [('TikTok ads', C.teal), ('In budget', C.accentSoft)],
        ),
      ]),
    );
  }

  Widget _matchCard({
    required String name,
    required String role,
    required double score,
    required String rate,
    required String rating,
    required List<(String, Color)> reasons,
    bool topPick = false,
  }) {
    return GCard(
      padding: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Avatar(name, size: 48),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(child: Text(name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: C.text), overflow: TextOverflow.ellipsis)),
                const SizedBox(width: 5),
                const Icon(Icons.verified_rounded, size: 15, color: C.blue),
                if (topPick) ...[const SizedBox(width: 6), const Tag('TOP PICK', color: C.amber, icon: Icons.star_rounded)],
              ]),
              const SizedBox(height: 3),
              Text('$role - $rate', style: const TextStyle(fontSize: 12, color: C.textDim)),
            ])),
            ScoreRing(score: score),
          ]),
          const SizedBox(height: 12),
          Wrap(spacing: 6, runSpacing: 6, children: [for (final r in reasons) Tag(r.$1, color: r.$2)]),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.auto_awesome, size: 13, color: C.accentSoft),
            const SizedBox(width: 6),
            Expanded(
              child: Text('Why this match: strong semantic fit with your brief, platforms aligned, price inside budget.',
                  style: const TextStyle(fontSize: 11.5, color: C.textDim, height: 1.4), maxLines: 2),
            ),
          ]),
        ]),
      ),
    );
  }
}
