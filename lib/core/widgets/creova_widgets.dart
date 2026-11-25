import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

/// Rounded card used across the app.
class GCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Gradient? gradient;
  final double radius;
  final VoidCallback? onTap;
  final String? to;
  const GCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.color,
    this.gradient,
    this.radius = 20,
    this.onTap,
    this.to,
  });

  @override
  Widget build(BuildContext context) {
    final box = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? C.card) : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        border: gradient == null ? Border.all(color: C.border, width: 1) : null,
      ),
      child: child,
    );
    final tap = onTap ?? (to != null ? () => context.push(to!) : null);
    if (tap == null) return box;
    return GestureDetector(behavior: HitTestBehavior.opaque, onTap: tap, child: box);
  }
}

class Logo extends StatelessWidget {
  final double size;
  const Logo({super.key, this.size = 34});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            gradient: C.gradient,
            borderRadius: BorderRadius.circular(size * 0.32),
          ),
          child: Icon(Icons.auto_awesome_rounded, color: Colors.white, size: size * 0.55),
        ),
        const SizedBox(width: 10),
        ShaderMask(
          shaderCallback: (r) => C.gradient.createShader(r),
          child: Text(
            'CREOVA AI',
            style: TextStyle(fontSize: size * 0.52, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: 1.2),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? to;
  final bool expand;
  const PrimaryButton({super.key, required this.label, this.icon, this.onTap, this.to, this.expand = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ?? (to != null ? () => context.push(to!) : null),
      child: Container(
        width: expand ? double.infinity : null,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
        decoration: BoxDecoration(
          gradient: C.gradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: C.accent.withOpacity(0.35), blurRadius: 18, offset: const Offset(0, 6))],
        ),
        child: Row(
          mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon, color: Colors.white, size: 19), const SizedBox(width: 8)],
            Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final String? to;
  const GhostButton({super.key, required this.label, this.icon, this.onTap, this.to});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap ?? (to != null ? () => context.push(to!) : null),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: C.cardAlt,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: C.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[Icon(icon, color: C.text, size: 18), const SizedBox(width: 8)],
            Text(label, style: const TextStyle(color: C.text, fontWeight: FontWeight.w600, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  final String? action;
  const SectionTitle(this.text, {super.key, this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: C.text)),
        if (action != null) Text(action!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: C.accentSoft)),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  const Tag(this.text, {super.key, this.color = C.accent, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.14),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        if (icon != null) ...[Icon(icon, size: 12, color: color), const SizedBox(width: 4)],
        Text(text, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: color)),
      ]),
    );
  }
}

class Avatar extends StatelessWidget {
  final String name;
  final double size;
  final Gradient? gradient;
  const Avatar(this.name, {super.key, this.size = 44, this.gradient});

  @override
  Widget build(BuildContext context) {
    final initials = name.trim().split(RegExp(r'\s+')).take(2).map((w) => w[0]).join().toUpperCase();
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: gradient ?? C.gradientWarm,
        borderRadius: BorderRadius.circular(size * 0.34),
      ),
      child: Text(initials, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: size * 0.36)),
    );
  }
}

class ScoreRing extends StatelessWidget {
  final double score; // 0..1
  final double size;
  const ScoreRing({super.key, required this.score, this.size = 52});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: score,
            strokeWidth: 4.5,
            backgroundColor: C.border,
            valueColor: const AlwaysStoppedAnimation(C.teal),
            strokeCap: StrokeCap.round,
          ),
          Text('${(score * 100).round()}%', style: TextStyle(fontSize: size * 0.26, fontWeight: FontWeight.w800, color: C.text)),
        ],
      ),
    );
  }
}

class StatTile extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  const StatTile({super.key, required this.value, required this.label, required this.icon, this.color = C.accent});

  @override
  Widget build(BuildContext context) {
    return GCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34, height: 34,
            decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(11)),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: C.text)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(fontSize: 11.5, color: C.textDim)),
        ],
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final int maxLines;
  final String? value;
  const AppTextField({super.key, required this.hint, this.icon, this.maxLines = 1, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: C.cardAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: C.border),
      ),
      child: Row(
        crossAxisAlignment: maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(top: maxLines > 1 ? 14 : 0),
              child: Icon(icon, size: 19, color: C.textFaint),
            ),
          if (icon != null) const SizedBox(width: 10),
          Expanded(
            child: TextField(
              maxLines: maxLines,
              style: const TextStyle(color: C.text, fontSize: 14.5),
              controller: value != null ? TextEditingController(text: value) : null,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: C.textFaint, fontSize: 14.5),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  final int active;
  const BottomNav({super.key, required this.active});

  static const items = [
    (Icons.home_rounded, 'Home', '/home'),
    (Icons.travel_explore_rounded, 'Discover', '/discover'),
    (Icons.description_rounded, 'Proposals', '/proposals'),
    (Icons.notifications_rounded, 'Alerts', '/notifications'),
    (Icons.person_rounded, 'Profile', '/provider'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 14),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: C.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: C.border),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (var i = 0; i < items.length; i++)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.go(items[i].$3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(items[i].$1, size: 23, color: i == active ? C.accentSoft : C.textFaint),
                    const SizedBox(height: 3),
                    Text(items[i].$2, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: i == active ? C.accentSoft : C.textFaint)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ScreenBody extends StatelessWidget {
  final Widget child;
  final int? nav;
  const ScreenBody({super.key, required this.child, this.nav});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: nav != null ? BottomNav(active: nav!) : null,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
          child: child,
        ),
      ),
    );
  }
}

class BackHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const BackHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.canPop() ? context.pop() : context.go('/home'),
          child: Container(
            width: 38, height: 38,
            decoration: BoxDecoration(color: C.cardAlt, borderRadius: BorderRadius.circular(13), border: Border.all(color: C.border)),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16, color: C.text),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: C.text))),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class AiBadge extends StatelessWidget {
  final String text;
  const AiBadge({super.key, this.text = 'AI'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(gradient: C.gradientWarm, borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.auto_awesome, size: 11, color: Colors.white),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w800, color: Colors.white)),
      ]),
    );
  }
}
