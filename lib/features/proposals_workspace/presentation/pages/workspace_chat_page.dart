import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/creova_widgets.dart';

class WorkspaceChatPage extends StatelessWidget {
  const WorkspaceChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 10),
            child: Row(children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => context.canPop() ? context.pop() : context.go('/proposals'),
                child: Container(
                  width: 38, height: 38,
                  decoration: BoxDecoration(color: C.cardAlt, borderRadius: BorderRadius.circular(13), border: Border.all(color: C.border)),
                  child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: C.text),
                ),
              ),
              const SizedBox(width: 12),
              const Avatar('Nora Khaled', size: 40),
              const SizedBox(width: 10),
              const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Nora Khaled', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: C.text)),
                Row(children: [
                  Icon(Icons.circle, size: 7, color: C.success),
                  SizedBox(width: 5),
                  Text('Online - Ramadan Glow workspace', style: TextStyle(fontSize: 11, color: C.textDim)),
                ]),
              ])),
              const Tag('IN PROGRESS', color: C.teal),
            ]),
          ),
          const Divider(color: C.border, height: 1),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              children: [
                _in('Hi! I reviewed the brief. For the first reel I am thinking a morning-routine hook with the glow serum.', '10:02'),
                _out('Sounds great. Can you include the promo code in the caption?', '10:05'),
                _in('Sure, GLOW20 in caption and pinned comment. I will shoot tomorrow.', '10:07'),
                GestureDetector(onTap: () => context.push('/workspace/deliverables'), child: _file('Reel_draft_v1.mp4', 'Video - 84 MB - Version 1', '11:40')),
                _out('Watched it, love the hook! Two small notes in the review.', '11:58'),
                _system('Deliverable "Reel 1" moved to Changes requested'),
                _in('On it, v2 tonight.', '12:01'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),
            child: Row(children: [
              Container(
                width: 44, height: 44,
                decoration: BoxDecoration(color: C.card, borderRadius: BorderRadius.circular(14), border: Border.all(color: C.border)),
                child: const Icon(Icons.attach_file_rounded, size: 20, color: C.textDim),
              ),
              const SizedBox(width: 10),
              const Expanded(child: AppTextField(hint: 'Message Nora...')),
              const SizedBox(width: 10),
              Container(
                width: 46, height: 46,
                decoration: BoxDecoration(gradient: C.gradient, borderRadius: BorderRadius.circular(15)),
                child: const Icon(Icons.send_rounded, size: 19, color: Colors.white),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _in(String text, String time) => _bubble(text, time, false);
  Widget _out(String text, String time) => _bubble(text, time, true);

  Widget _bubble(String text, String time, bool mine) {
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 270),
        decoration: BoxDecoration(
          gradient: mine ? C.gradient : null,
          color: mine ? null : C.card,
          border: mine ? null : Border.all(color: C.border),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18), topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(mine ? 18 : 6), bottomRight: Radius.circular(mine ? 6 : 18),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text(text, style: const TextStyle(fontSize: 13.5, color: C.text, height: 1.45)),
          const SizedBox(height: 3),
          Text(time, style: TextStyle(fontSize: 10, color: mine ? Colors.white.withOpacity(0.7) : C.textFaint)),
        ]),
      ),
    );
  }

  Widget _file(String name, String meta, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 270),
        decoration: BoxDecoration(color: C.card, border: Border.all(color: C.border), borderRadius: BorderRadius.circular(18)),
        child: Column(children: [
          Row(children: [
            Container(
              width: 42, height: 42,
              decoration: BoxDecoration(color: C.pink.withOpacity(0.15), borderRadius: BorderRadius.circular(13)),
              child: const Icon(Icons.play_circle_fill_rounded, size: 22, color: C.pink),
            ),
            const SizedBox(width: 10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: C.text)),
              const SizedBox(height: 2),
              Text(meta, style: const TextStyle(fontSize: 10.5, color: C.textDim)),
            ])),
          ]),
          const SizedBox(height: 6),
          Align(alignment: Alignment.centerRight, child: Text(time, style: const TextStyle(fontSize: 10, color: C.textFaint))),
        ]),
      ),
    );
  }

  Widget _system(String text) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: C.cardAlt, borderRadius: BorderRadius.circular(20)),
        child: Text(text, style: const TextStyle(fontSize: 10.5, color: C.textDim)),
      ),
    );
  }
}
