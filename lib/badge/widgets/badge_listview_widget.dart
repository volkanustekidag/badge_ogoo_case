import 'package:badge_case/badge/view_model/badge_view_model.dart';
import 'package:badge_case/badge/widgets/badge_list_item_widget.dart';
import 'package:badge_case/badge/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BagdeListViewWidget extends StatefulWidget {
  final List<dynamic>? badgeListItem;

  BagdeListViewWidget({
    super.key,
    this.badgeListItem,
  });

  @override
  State<BagdeListViewWidget> createState() =>
      _BagdeListViewWidgetState(badgeListItem: badgeListItem);
}

class _BagdeListViewWidgetState extends State<BagdeListViewWidget> {
  final badgeManagerViewModel = Get.put(BadgeViewModel());
  final List<dynamic>? badgeListItem;

  _BagdeListViewWidgetState({
    this.badgeListItem,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => badgeManagerViewModel.isLoadingListListview.value
          ? Column(
              children: List.generate(
                  widget.badgeListItem!.length,
                  (index) => BadgeListItemWidget(
                        bagdeListItem: widget.badgeListItem![index],
                      )),
            )
          : const LoadingWidget(),
    );
  }
}
