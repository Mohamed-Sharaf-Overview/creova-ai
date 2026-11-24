import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      nav: 3,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Expanded(child: Text('Notifications', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: C.text))),
          Tag('3 new', color: C.pink),
        ]),
        const SizedBox(height: 18),
        const Text('TODAY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: C.textFaint, letterSpacing: 1.2)),
        const SizedBox(height: 10),
        _n(Icons.check_circle_rounded, C.teal, 'Proposal accepted', 'Nora Khaled accepted your proposal. A workspace was created.', '2h ago', true),
        _n(Icons.auto_awesome, C.accentSoft, 'AI plan ready', 'Ramadan Glow plan v3 is ready to review and edit.', '5h ago', true),
        _n(Icons.upload_file_rounded, C.blue, 'New deliverable', 'Sara Mostafa uploaded "Reel_v2.mp4" for review.', '6h ago', true),
        const SizedBox(height: 16),
        const Text('EARLIER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: C.textFaint, letterSpacing: 1.2)),
        const SizedBox(height: 10),
        _n(Icons.chat_bubble_outline_rounded, C.pink, 'New message', 'Omar Adel: "I can start Monday if the brief is final."', 'Yesterday', false),
        _n(Icons.star_rounded, C.amber, 'Review reminder', 'Your workspace with Omar Adel was completed. Rate your experience.', 'Yesterday', false),
        _n(Icons.verified_rounded, C.blue, 'Profile verified', 'Your business profile passed verification.', '2 days ago', false),
      ]),
    );
  }

  Widget _n(IconData icon, Color color, String title, String body, String time, bool unread) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: GCard(
        color: unread ? C.cardAlt : C.card,
        padding: const EdgeInsets.all(14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: color.withOpacity(0.13), borderRadius: BorderRadius.circular(13)),
            child: Icon(icon, size: 19, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Expanded(child: Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: C.text))),
              if (unread) Container(width: 8, height: 8, decoration: const BoxDecoration(color: C.pink, shape: BoxShape.circle)),
            ]),
            const SizedBox(height: 3),
            Text(body, style: const TextStyle(fontSize: 12, color: C.textDim, height: 1.45)),
            const SizedBox(height: 5),
            Text(time, style: const TextStyle(fontSize: 10.5, color: C.textFaint)),
          ])),
        ]),
      ),
    );
  }
}
