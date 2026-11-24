import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class DeliverablesPage extends StatelessWidget {
  const DeliverablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackHeader(title: 'Deliverables', trailing: Tag('3 of 5', color: C.accentSoft)),
        const SizedBox(height: 20),
        GCard(
          padding: const EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(children: [
              Avatar('Nora Khaled', size: 38),
              SizedBox(width: 10),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Ramadan Glow - Nora Khaled', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: C.text)),
                Text('Workspace opened Mar 3', style: TextStyle(fontSize: 11, color: C.textDim)),
              ])),
            ]),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: const LinearProgressIndicator(value: 0.6, minHeight: 6, backgroundColor: C.cardAlt, valueColor: AlwaysStoppedAnimation(C.teal)),
            ),
          ]),
        ),
        const SizedBox(height: 18),
        _item('Reel 1 - Morning routine hook', 'Reel_v2.mp4', 'v2', 'Awaiting review', C.amber, Icons.schedule_rounded, true),
        _item('Reel 2 - Unboxing', 'Unboxing_final.mp4', 'v3', 'Approved', C.teal, Icons.check_circle_rounded, false),
        _item('Reel 3 - GRWM', 'GRWM_v1.mp4', 'v1', 'Changes requested', C.danger, Icons.edit_note_rounded, false),
        _item('Story set (3 frames)', 'Not uploaded yet', '-', 'Pending', C.textFaint, Icons.upload_file_rounded, false),
        const SizedBox(height: 22),
        PrimaryButton(label: 'Approve Reel 1', icon: Icons.check_rounded, onTap: () {}),
        const SizedBox(height: 12),
        const GhostButton(label: 'Request changes', icon: Icons.edit_outlined),
      ]),
    );
  }

  Widget _item(String title, String file, String ver, String status, Color color, IconData icon, bool highlight) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GCard(
        color: highlight ? C.cardAlt : C.card,
        child: Row(children: [
          Container(
            width: 44, height: 44,
            decoration: BoxDecoration(color: color.withOpacity(0.13), borderRadius: BorderRadius.circular(14)),
            child: Icon(icon, size: 21, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: C.text)),
            const SizedBox(height: 3),
            Text('$file - $ver', style: const TextStyle(fontSize: 11, color: C.textDim)),
          ])),
          Tag(status, color: color),
        ]),
      ),
    );
  }
}
