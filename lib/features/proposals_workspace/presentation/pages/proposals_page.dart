import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class ProposalsPage extends StatelessWidget {
  const ProposalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      nav: 2,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Proposals', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: C.text)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: C.border)),
          child: Row(children: [
            _tab('Received', true),
            _tab('Sent', false),
          ]),
        ),
        const SizedBox(height: 18),
        _proposal('Nora Khaled', 'UGC Creator', 'Ramadan Glow Campaign', 'EGP 9,600 - 3 reels', 'Accepted', C.teal, Icons.check_circle_rounded,
            'Excited to work on this! I can deliver the first reel within 5 days...'),
        _proposal('Omar Adel', 'Media Buyer', 'Ramadan Glow Campaign', 'EGP 8,000/mo management', 'Pending', C.amber, Icons.schedule_rounded,
            'I have managed 12 skincare accounts on Meta. My plan includes...'),
        _proposal('Layla Hassan', 'UGC Creator', 'Summer Launch Teaser', 'EGP 5,200 - 2 reels', 'Pending', C.amber, Icons.schedule_rounded,
            'I specialize in skincare content with a 6% avg engagement...'),
        _proposal('Karim Nabil', 'Media Buyer', 'Winter Retargeting', 'EGP 6,500/mo management', 'Rejected', C.danger, Icons.cancel_rounded,
            'TikTok-first performance buying for e-commerce brands...'),
      ]),
    );
  }

  Widget _tab(String t, bool active) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: active ? C.gradient : null,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(child: Text(t, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: active ? Colors.white : C.textDim))),
      ),
    );
  }

  Widget _proposal(String name, String role, String campaign, String price, String status, Color statusColor, IconData statusIcon, String preview) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GCard(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Avatar(name, size: 44),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.w700, color: C.text)),
              const SizedBox(height: 2),
              Text('$role - $campaign', style: const TextStyle(fontSize: 11.5, color: C.textDim), maxLines: 1, overflow: TextOverflow.ellipsis),
            ])),
            Tag(status, color: statusColor, icon: statusIcon),
          ]),
          const SizedBox(height: 11),
          Text(preview, style: const TextStyle(fontSize: 12.5, color: C.textDim, height: 1.45), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 11),
          Row(children: [
            const Icon(Icons.payments_outlined, size: 15, color: C.teal),
            const SizedBox(width: 6),
            Expanded(child: Text(price, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: C.teal))),
            const Text('View', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: C.accentSoft)),
            const Icon(Icons.chevron_right_rounded, size: 17, color: C.accentSoft),
          ]),
        ]),
      ),
    );
  }
}
