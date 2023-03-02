import 'package:badge_case/badge/const/app_styles.dart';
import 'package:badge_case/badge/utils/badge_utils.dart';
import 'package:badge_case/badge/view_model/badge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
    super.key,
    required this.badges,
    required this.badgeManagerViewModel,
  });

  final List? badges;
  final BadgeViewModel badgeManagerViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          BadgeUtils.getSliderPageCount(badges!.length),
          (index) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: Obx(
              () => Icon(
                Icons.circle,
                size: 10,
                color: badgeManagerViewModel.sliderCurrentIndex == index
                    ? AppStyles.secondaryColor
                    : AppStyles.secondaryColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
