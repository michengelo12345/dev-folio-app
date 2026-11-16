import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import 'badge_overlay.dart';

class ProfileIdentityCard extends StatelessWidget {
  const ProfileIdentityCard({super.key, required this.developer});

  final DeveloperProfile developer;

  @override
  Widget build(BuildContext context) {
    final String? photoAsset = developer.photoAsset;

    return BadgeOverlay(
      badgeText: 'DEVFOLIO',
      badgeColor: const Color(0xFF35D6A2),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 48, 22, 24),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFF5147C8),
              Color(0xFF7754D8),
              Color(0xFF283B75),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xFF5147C8).withValues(alpha: 0.2),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 49,
              backgroundColor: Colors.white.withValues(alpha: 0.18),
              child: CircleAvatar(
                radius: 44,
                backgroundColor: const Color(0xFFE9E7FF),
                backgroundImage: photoAsset == null
                    ? null
                    : AssetImage(photoAsset),
                child: photoAsset == null
                    ? Text(
                        developer.initials,
                        style: const TextStyle(
                          color: Color(0xFF5147C8),
                          fontSize: 23,
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              developer.name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              developer.professionalTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.88),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.code, size: 15, color: Colors.white),
                  SizedBox(width: 7),
                  Flexible(
                    child: Text(
                      'Desenvolvimento mobile e web',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
