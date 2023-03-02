import 'package:badge_case/badge/const/app_styles.dart';
import 'package:badge_case/badge/view_model/badge_view_model.dart';
import 'package:badge_case/badge/widgets/badge_gridview_slider_widget.dart';
import 'package:badge_case/badge/widgets/flag_with_all_badge_rating_widget.dart';
import 'package:badge_case/badge/widgets/loading_widget.dart';
import 'package:badge_case/badge/widgets/slider_indicator_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSlider extends StatelessWidget {
  final List<dynamic>? badges;
  final double? allAvarageRating;
  final int? allBadgeCount;
  final badgeManagerViewModel = Get.put(BadgeViewModel());

  CardSlider({
    super.key,
    this.badges,
    this.allAvarageRating,
    this.allBadgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 258,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: AppStyles.boxShadow,
      ),
      child: Obx(
        () => badgeManagerViewModel.isLoadingbadgesSlider.value
            ? Column(
                children: [
                  FlagWithAllBadgeRating(
                      allAvarageRating: allAvarageRating,
                      allBadgeCount: allBadgeCount),
                  BadgeGridViewSlider(
                      badgeManagerViewModel: badgeManagerViewModel,
                      badges: badges),
                  SliderIndicator(
                      badges: badges,
                      badgeManagerViewModel: badgeManagerViewModel)
                ],
              )
            : const LoadingWidget(),
      ),
    );
  }
}
