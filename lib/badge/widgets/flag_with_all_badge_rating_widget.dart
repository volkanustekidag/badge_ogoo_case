import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/const/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class FlagWithAllBadgeRating extends StatelessWidget {
  const FlagWithAllBadgeRating({
    super.key,
    required this.allAvarageRating,
    required this.allBadgeCount,
  });

  final double? allAvarageRating;
  final int? allBadgeCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            SvgPicture.asset(
              AppConstants.flagIconSvgPath,
            ),
            Positioned(
              left: 12,
              right: 10,
              top: 15,
              child: Text(
                allAvarageRating!.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: AppConstants.gothamMedium,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tüm Rozetlerde",
                style: TextStyle(
                  color: AppStyles.primaryColor,
                  fontFamily: AppConstants.gothamBook,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: allAvarageRating!,
                    itemCount: 5,
                    itemSize: 19.2,
                    direction: Axis.horizontal,
                    unratedColor: AppStyles.primaryColor.withOpacity(0.2),
                    itemBuilder: (context, index) => SvgPicture.asset(
                      AppConstants.starIconSvgPath,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "$allBadgeCount Adet",
                    style: TextStyle(
                      fontFamily: AppConstants.gothamMedium,
                      color: AppStyles.primaryColor.withOpacity(0.3),
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
