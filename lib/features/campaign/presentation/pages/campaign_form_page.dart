import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class CampaignFormPage extends StatelessWidget {
  const CampaignFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackHeader(title: 'New campaign'),
        const SizedBox(height: 24),
        const Text('Tell us about your campaign', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text)),
        const SizedBox(height: 6),
        const Text('The AI planner uses this brief to build your plan.', style: TextStyle(fontSize: 13, color: C.textDim)),
        const SizedBox(height: 22),
        _label('Campaign name'),
        const AppTextField(hint: 'e.g. Ramadan Glow Campaign', value: 'Ramadan Glow Campaign'),
        const SizedBox(height: 16),
        _label('Objective'),
        const AppTextField(hint: 'Brand awareness', icon: Icons.flag_outlined),
        const SizedBox(height: 16),
        _label('Platforms'),
        const Wrap(spacing: 8, runSpacing: 8, children: [
          Tag('Instagram', color: C.pink, icon: Icons.check),
          Tag('TikTok', color: C.teal, icon: Icons.check),
          Tag('Facebook', color: C.textFaint),
          Tag('YouTube', color: C.textFaint),
        ]),
        const SizedBox(height: 16),
        _label('Budget (EGP)'),
        GCard(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('25,000', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: C.text)),
              Tag('EGP', color: C.accentSoft),
            ]),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: C.accentSoft,
                inactiveTrackColor: C.border,
                thumbColor: Colors.white,
                overlayColor: C.accent.withOpacity(0.2),
              ),
              child: const Slider(value: 0.45, onChanged: _noop),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('5k', style: TextStyle(fontSize: 11, color: C.textFaint)),
              Text('50k', style: TextStyle(fontSize: 11, color: C.textFaint)),
            ]),
          ]),
        ),
        const SizedBox(height: 16),
        _label('Duration'),
        const Row(children: [
          Expanded(child: AppTextField(hint: 'Mar 1, 2026', icon: Icons.calendar_today_rounded)),
          SizedBox(width: 12),
          Expanded(child: AppTextField(hint: 'Mar 30, 2026', icon: Icons.event_rounded)),
        ]),
        const SizedBox(height: 16),
        _label('Brief'),
        const AppTextField(
          hint: 'Describe your product, audience and goals...',
          maxLines: 4,
          value: 'Launching our new skincare line for Ramadan. Target: women 18-35 in Egypt. We want authentic UGC reels and paid amplification on Meta.',
        ),
        const SizedBox(height: 26),
        PrimaryButton(label: 'Generate AI plan', icon: Icons.auto_awesome_rounded, to: '/campaign/plan/generating'),
        const SizedBox(height: 12),
        const Center(child: Text('Plan generation usually takes 10-30 seconds', style: TextStyle(fontSize: 12, color: C.textFaint))),
      ]),
    );
  }

  static void _noop(double _) {}

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(t, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: C.textDim)),
      );
}
