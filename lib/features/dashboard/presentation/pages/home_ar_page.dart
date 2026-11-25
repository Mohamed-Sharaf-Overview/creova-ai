import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

/// Arabic RTL variant of the home dashboard (localization showcase).
class HomeArPage extends StatelessWidget {
  const HomeArPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arTheme = Theme.of(context).copyWith(
      textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Cairo'),
    );
    return Theme(
      data: arTheme,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ScreenBody(
          nav: 0,
          child: Builder(builder: (context) {
            final ar = DefaultTextStyle.of(context).style.copyWith(fontFamily: 'Cairo');
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                const Avatar('Nova Cosmetics', size: 46),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('مساء الخير', style: ar.copyWith(fontSize: 12.5, color: C.textDim)),
                  Text('نوفا كوزمتكس', style: ar.copyWith(fontSize: 17, fontWeight: FontWeight.w800, color: C.text)),
                ])),
                const Tag('عربي', color: C.teal, icon: Icons.translate_rounded),
              ]),
              const SizedBox(height: 22),
              GCard(
                gradient: const LinearGradient(colors: [Color(0xFF2A2160), Color(0xFF173040)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text('حملة رمضان جلو', style: ar.copyWith(fontSize: 19, fontWeight: FontWeight.w800, color: Colors.white)),
                    const Spacer(),
                    const Tag('نشطة', color: C.teal),
                  ]),
                  const SizedBox(height: 6),
                  Text('٣ صناع محتوى - ميزانية ٢٥٬٠٠٠ جنيه', style: ar.copyWith(fontSize: 12.5, color: Colors.white.withOpacity(0.75))),
                  const SizedBox(height: 14),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(value: 0.62, minHeight: 7, backgroundColor: Colors.white.withOpacity(0.15), valueColor: const AlwaysStoppedAnimation(C.teal)),
                  ),
                  const SizedBox(height: 8),
                  Text('اكتمل ٦٢٪', style: ar.copyWith(fontSize: 11.5, color: Colors.white.withOpacity(0.75), fontWeight: FontWeight.w600)),
                ]),
              ),
              const SizedBox(height: 22),
              Row(children: [
                Expanded(child: _action(Icons.auto_awesome_rounded, 'حملة جديدة بالذكاء الاصطناعي', C.accent, ar, '/campaign/new')),
                const SizedBox(width: 12),
                Expanded(child: _action(Icons.travel_explore_rounded, 'اكتشف صناع المحتوى', C.teal, ar, '/discover')),
                const SizedBox(width: 12),
                Expanded(child: _action(Icons.work_outline_rounded, 'مساحة العمل', C.pink, ar, '/workspace')),
              ]),
              const SizedBox(height: 22),
              Text('النشاط الأخير', style: ar.copyWith(fontSize: 17, fontWeight: FontWeight.w700, color: C.text)),
              const SizedBox(height: 12),
              _activity(Icons.check_circle_rounded, C.teal, 'تم قبول العرض', 'نورا خالد قبلت عرضك وتم إنشاء مساحة العمل.', ar),
              _activity(Icons.auto_awesome, C.accentSoft, 'الخطة جاهزة', 'الخطة الثالثة من الذكاء الاصطناعي جاهزة للمراجعة.', ar),
              _activity(Icons.upload_file_rounded, C.blue, 'تسليم جديد', 'سارة مصطفى رفعت ملف Reel_v2.mp4 للمراجعة.', ar),
            ]);
          }),
        ),
      ),
    );
  }

  Widget _action(IconData icon, String label, Color color, TextStyle ar, String to) {
    return GCard(
      to: to,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(children: [
        Container(
          width: 42, height: 42,
          decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(14)),
          child: Icon(icon, color: color, size: 21),
        ),
        const SizedBox(height: 9),
        Text(label, textAlign: TextAlign.center, style: ar.copyWith(fontSize: 11, fontWeight: FontWeight.w600, color: C.text, height: 1.4)),
      ]),
    );
  }

  Widget _activity(IconData icon, Color color, String title, String sub, TextStyle ar) {
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
          Text(title, style: ar.copyWith(fontSize: 13.5, fontWeight: FontWeight.w700, color: C.text)),
          const SizedBox(height: 2),
          Text(sub, style: ar.copyWith(fontSize: 12, color: C.textDim), maxLines: 1, overflow: TextOverflow.ellipsis),
        ])),
      ]),
    );
  }
}
