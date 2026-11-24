import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenBody(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [
          Expanded(child: Text('Admin', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: C.text))),
          Tag('ADMIN ROLE', color: C.danger, icon: Icons.admin_panel_settings_rounded),
        ]),
        const SizedBox(height: 18),
        const Row(children: [
          Expanded(child: StatTile(value: '1,284', label: 'Users', icon: Icons.people_alt_rounded, color: C.blue)),
          SizedBox(width: 12),
          Expanded(child: StatTile(value: '312', label: 'Providers', icon: Icons.verified_user_rounded, color: C.teal)),
        ]),
        const SizedBox(height: 12),
        const Row(children: [
          Expanded(child: StatTile(value: '96', label: 'Active campaigns', icon: Icons.rocket_launch_rounded, color: C.accentSoft)),
          SizedBox(width: 12),
          Expanded(child: StatTile(value: '7', label: 'Open reports', icon: Icons.flag_rounded, color: C.pink)),
        ]),
        const SizedBox(height: 20),
        const SectionTitle('Verification queue', action: 'View all'),
        const SizedBox(height: 12),
        _verify('Mariam Samy', 'UGC Creator - 8 portfolio items', 'Submitted 2h ago'),
        _verify('Ahmed Fathy', 'Media Buyer - Meta certified', 'Submitted 5h ago'),
        const SizedBox(height: 20),
        const SectionTitle('Matching weights', action: 'v4 active'),
        const SizedBox(height: 12),
        GCard(child: Column(children: [
          _weight('w1 - Skills & category', 0.35, C.teal),
          _weight('w2 - Platform fit', 0.20, C.accentSoft),
          _weight('w3 - Budget fit', 0.15, C.pink),
          _weight('w4 - Rating (decayed)', 0.15, C.amber),
          _weight('w5 - Availability', 0.10, C.blue),
          _weight('w6 - New provider boost', 0.05, C.textDim),
          const SizedBox(height: 4),
          const Row(children: [
            Icon(Icons.history_edu_rounded, size: 13, color: C.textFaint),
            SizedBox(width: 6),
            Expanded(child: Text('Every change is written to audit_logs.', style: TextStyle(fontSize: 11, color: C.textFaint))),
          ]),
        ])),
        const SizedBox(height: 20),
        const SectionTitle('Anomaly checks'),
        const SizedBox(height: 12),
        _alert('Spam proposals spike blocked', 'Daily limit enforced on 3 accounts', C.amber),
        _alert('Suspicious review pattern', '2 reviews held for manual check', C.pink),
      ]),
    );
  }

  Widget _verify(String name, String sub, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GCard(
        padding: const EdgeInsets.all(13),
        child: Row(children: [
          Avatar(name, size: 40),
          const SizedBox(width: 11),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: C.text)),
            Text(sub, style: const TextStyle(fontSize: 11, color: C.textDim), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(time, style: const TextStyle(fontSize: 10, color: C.textFaint)),
          ])),
          _mini('Approve', C.teal),
          const SizedBox(width: 7),
          _mini('Reject', C.danger),
        ]),
      ),
    );
  }

  Widget _mini(String t, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(color: color.withOpacity(0.13), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withOpacity(0.35))),
      child: Text(t, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: color)),
    );
  }

  Widget _weight(String name, double v, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(children: [
        Expanded(flex: 3, child: Text(name, style: const TextStyle(fontSize: 12.5, color: C.text))),
        Expanded(
          flex: 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: v / 0.4, minHeight: 7, backgroundColor: C.cardAlt, valueColor: AlwaysStoppedAnimation(color)),
          ),
        ),
        const SizedBox(width: 10),
        Text(v.toStringAsFixed(2), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: C.text)),
      ]),
    );
  }

  Widget _alert(String title, String sub, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GCard(
        padding: const EdgeInsets.all(13),
        child: Row(children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(color: color.withOpacity(0.13), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.shield_outlined, size: 19, color: color),
          ),
          const SizedBox(width: 11),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.text)),
            Text(sub, style: const TextStyle(fontSize: 11, color: C.textDim)),
          ])),
        ]),
      ),
    );
  }
}
