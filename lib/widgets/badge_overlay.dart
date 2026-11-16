import 'package:material_ui/material_ui.dart';

class BadgeOverlay extends StatelessWidget {
  const BadgeOverlay({
    super.key,
    required this.child,
    required this.badgeText,
    this.badgeColor = const Color(0xFF35D6A2),
  });

  final Widget child;
  final String badgeText;
  final Color badgeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        child,
        Positioned(
          top: 10,
          right: 10,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: badgeColor.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                badgeText,
                style: const TextStyle(
                  color: Color(0xFF07131A),
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
