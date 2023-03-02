import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/const/app_styles.dart';
import 'package:badge_case/badge/models/badge_list_item.dart';
import 'package:badge_case/badge/utils/badge_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class BadgeListItemWidget extends StatelessWidget {
  final BagdeListItem? bagdeListItem;
  const BadgeListItemWidget({super.key, this.bagdeListItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 12,
      ),
      padding: const EdgeInsets.only(
        top: 12.5,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: AppStyles.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                ),
              ),
              const SizedBox(width: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bagdeListItem!.relatedPerson!.first.title!,
                    style: const TextStyle(
                      color: AppStyles.primaryColor,
                      fontFamily: AppConstants.gothamMedium,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "${BadgeUtils.formatDate(bagdeListItem!.created.toString())}'da Gönderdi",
                    style: const TextStyle(
                      color: AppStyles.primaryColor,
                      fontFamily: AppConstants.gothamBook,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 16.5),
          Row(
            children: [
              bagdeListItem!.badge!.first.lookupId! < 12
                  ? Image.asset(
                      BadgeUtils.getCardImagePathById(
                          bagdeListItem!.badge!.first.lookupId),
                      width: 64,
                    )
                  : const CircleAvatar(maxRadius: 32),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bagdeListItem!.badge!.first.lookupValue!,
                    style: const TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontFamily: AppConstants.gothamMedium,
                      fontSize: 22,
                    ),
                  ),
                  RatingBarIndicator(
                    rating: double.parse(bagdeListItem!.praiseRating!),
                    itemCount: 5,
                    itemSize: 19.2,
                    direction: Axis.horizontal,
                    itemPadding: const EdgeInsets.symmetric(vertical: 8.5),
                    unratedColor: AppStyles.primaryColor.withOpacity(0.2),
                    itemBuilder: (context, index) => SvgPicture.asset(
                      AppConstants.starIconSvgPath,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 11.5),
          Text(
            bagdeListItem!.message!,
            style: const TextStyle(
              height: 1.5,
              color: AppStyles.primaryColor,
              fontFamily: AppConstants.gothamBook,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
