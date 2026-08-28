import 'package:flutter/material.dart';

import '../../app/theme/dalm_colors.dart';
import '../../app/theme/dalm_typography.dart';

class DalmBottomNavigationBar extends StatelessWidget {
  const DalmBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  }) : assert(
         currentIndex >= 0 && currentIndex < _items.length,
         'currentIndex가 바텀 네비게이션 범위를 벗어났습니다.',
       );

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<_DalmBottomNavigationItem> _items = [
    _DalmBottomNavigationItem(label: '오늘', icon: Icons.home_outlined),
    _DalmBottomNavigationItem(label: '순간들', icon: Icons.article_outlined),
    _DalmBottomNavigationItem(label: '엽서함', icon: Icons.mail_outline),
    _DalmBottomNavigationItem(label: '나', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: DalmColors.background,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: DalmColors.border, width: 1)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 72,
            child: Row(children: List.generate(_items.length, _buildItem)),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final item = _items[index];
    final isSelected = currentIndex == index;

    final color = isSelected
        ? DalmColors.textPrimary
        : DalmColors.textSecondary;

    return Expanded(
      child: Semantics(
        button: true,
        selected: isSelected,
        label: item.label,
        child: InkWell(
          onTap: () => onTap(index),
          child: ExcludeSemantics(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, size: 26, color: color),
                const SizedBox(height: 6),
                Text(
                  item.label,
                  style: DalmTypography.caption.copyWith(
                    color: color,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DalmBottomNavigationItem {
  const _DalmBottomNavigationItem({required this.label, required this.icon});

  final String label;
  final IconData icon;
}
