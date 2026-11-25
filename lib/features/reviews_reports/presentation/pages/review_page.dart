import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const BackHeader(title: 'Rate collaboration'),
        const SizedBox(height: 26),
        const Center(child: Tag('Workspace completed - review unlocked', color: C.teal, icon: Icons.lock_open_rounded)),
        const SizedBox(height: 22),
        const Avatar('Nora Khaled', size: 80),
        const SizedBox(height: 14),
        const Text('How was working with\nNora Khaled?', textAlign: TextAlign.center, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text, height: 1.3)),
        const SizedBox(height: 18),
        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.star_rounded, size: 40, color: C.amber),
          Icon(Icons.star_rounded, size: 40, color: C.amber),
          Icon(Icons.star_rounded, size: 40, color: C.amber),
          Icon(Icons.star_rounded, size: 40, color: C.amber),
          Icon(Icons.star_rounded, size: 40, color: C.amber),
        ]),
        const SizedBox(height: 24),
        _aspect('Quality of content', 0.95),
        _aspect('Communication', 0.90),
        _aspect('Meeting deadlines', 1.0),
        const SizedBox(height: 20),
        const AppTextField(hint: 'Share details that help other brands (optional)...', maxLines: 4),
        const SizedBox(height: 12),
        const Text('One review per project - ratings update the provider score and improve future matches.',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 11.5, color: C.textFaint, height: 1.5)),
        const SizedBox(height: 22),
        PrimaryButton(label: 'Submit review', icon: Icons.send_rounded, to: '/home'),
      ]),
    );
  }

  Widget _aspect(String name, double v) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(children: [
        Expanded(flex: 2, child: Text(name, style: const TextStyle(fontSize: 13.5, color: C.text))),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: v, minHeight: 7, backgroundColor: C.cardAlt, valueColor: const AlwaysStoppedAnimation(C.amber)),
          ),
        ),
        const SizedBox(width: 10),
        Text('${(v * 5).toStringAsFixed(1)}', style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w700, color: C.text)),
      ]),
    );
  }
}
