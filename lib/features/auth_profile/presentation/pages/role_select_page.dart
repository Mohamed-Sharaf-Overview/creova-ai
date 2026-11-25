import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class RoleSelectPage extends StatelessWidget {
  const RoleSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackHeader(title: 'Create account'),
              const SizedBox(height: 30),
              const Text('How will you use\nCREOVA AI?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: C.text, height: 1.3)),
              const SizedBox(height: 8),
              const Text('Pick your role. You can complete your profile after.', style: TextStyle(fontSize: 13.5, color: C.textDim)),
              const SizedBox(height: 26),
              _role(Icons.storefront_rounded, 'Brand / Business', 'Plan campaigns, discover creators and manage collaborations.', true, C.accent),
              const SizedBox(height: 14),
              _role(Icons.campaign_rounded, 'Media Buyer', 'Offer ad-buying services and get matched with brands.', false, C.teal),
              const SizedBox(height: 14),
              _role(Icons.video_camera_front_rounded, 'UGC Creator', 'Show your portfolio and win content deals.', false, C.pink),
              const Spacer(),
              PrimaryButton(label: 'Continue', to: '/home'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _role(IconData icon, String title, String sub, bool selected, Color color) {
    return GCard(
      color: selected ? C.cardAlt : C.card,
      child: Row(
        children: [
          Container(
            width: 48, height: 48,
            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(15)),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700, color: C.text)),
              const SizedBox(height: 3),
              Text(sub, style: const TextStyle(fontSize: 12, color: C.textDim, height: 1.4)),
            ]),
          ),
          Icon(selected ? Icons.radio_button_checked : Icons.radio_button_off, color: selected ? C.accentSoft : C.textFaint, size: 21),
        ],
      ),
    );
  }
}
