import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../app/theme/dalm_colors.dart';
import '../../../app/theme/dalm_typography.dart';

enum DalmPhotoPairStatus { searching, hidden, revealed }

class DalmPhotoPair extends StatelessWidget {
  const DalmPhotoPair({
    super.key,
    required this.leftImage,
    required this.status,
    this.rightImage,
  }) : assert(
         status == DalmPhotoPairStatus.searching || rightImage != null,
         'hidden 또는 revealed 상태에서는 오른쪽 이미지가 필요합니다.',
       );

  final ImageProvider leftImage;
  final ImageProvider? rightImage;
  final DalmPhotoPairStatus status;

  static const double _imageAspectRatio = 3 / 4; // 사진 가로, 세로 비율
  static const double _gap = 8;
  static const double _borderRadius = 6;

  // dalm_photo_pair widget
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildFrame(_buildImage(leftImage))),
        const SizedBox(width: _gap),
        Expanded(child: _buildFrame(_buildRightContent())),
      ],
    );
  }

  Widget _buildFrame(Widget child) {
    return AspectRatio(
      aspectRatio: _imageAspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: child,
      ),
    );
  }

  Widget _buildImage(ImageProvider image) {
    return Image(
      image: image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildRightContent() {
    return switch (status) {
      DalmPhotoPairStatus.searching => _buildSearchingPlaceholder(),
      DalmPhotoPairStatus.hidden => _buildHiddenImage(rightImage!),
      DalmPhotoPairStatus.revealed => _buildImage(rightImage!),
    };
  }

  Widget _buildSearchingPlaceholder() {
    return Image.asset(
      'assets/images/matching_placeholder.png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildHiddenImage(ImageProvider image) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ImageFiltered(
          imageFilter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: _buildImage(image),
        ),
        ColoredBox(color: DalmColors.surface.withValues(alpha: 0.72)),
        Center(
          child: Text(
            '아직 가려진\n낯선 사람의 장면',
            textAlign: TextAlign.center,
            style: DalmTypography.caption.copyWith(
              color: DalmColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
