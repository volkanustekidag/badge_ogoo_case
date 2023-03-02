import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/const/app_styles.dart';
import 'package:badge_case/badge/utils/badge_utils.dart';
import 'package:badge_case/badge/view_model/badge_view_model.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class BadgeGridViewSlider extends StatelessWidget {
  const BadgeGridViewSlider({
    super.key,
    required this.badgeManagerViewModel,
    required this.badges,
  });

  final BadgeViewModel badgeManagerViewModel;
  final List? badges;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(
            onPageChanged: (index, reason) =>
                badgeManagerViewModel.onPageChanged(index),
            autoPlay: false,
            viewportFraction: 1,
            height: double.infinity),
        items: List.generate(
          BadgeUtils.getSliderPageCount(badges!.length),
          (i) => GridView.count(
            childAspectRatio: 2.8,
            shrinkWrap: true,
            crossAxisCount: 2,
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              BadgeUtils.getGridViewCouht(badges!.length, i),
              (j) {
                return Row(
                  children: [
                    Image.asset(
                      BadgeUtils.getCardImagePathById(badges![(i * 4) + j].id),
                      height: 48,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            badges![(i * 4) + j].title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: AppConstants.gothamBook,
                              color: AppStyles.primaryColor,
                              fontSize: 13,
                            ),
                          ),
                          RatingBarIndicator(
                            itemPadding:
                                const EdgeInsets.symmetric(vertical: 4),
                            rating: badges![(i * 4) + j].avarageRating,
                            itemCount: 5,
                            itemSize: 13.8,
                            direction: Axis.horizontal,
                            unratedColor:
                                AppStyles.primaryColor.withOpacity(0.2),
                            itemBuilder: (context, index) => SvgPicture.asset(
                              AppConstants.starIconSvgPath,
                            ),
                          ),
                          Text(
                            '${badges![(i * 4) + j].count} Adet',
                            style: TextStyle(
                              fontFamily: AppConstants.gothamMedium,
                              color: AppStyles.primaryColor.withOpacity(0.3),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
