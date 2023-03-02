import 'package:badge_case/badge/view_model/badge_view_model.dart';
import 'package:badge_case/badge/widgets/app_bar_widget.dart';
import 'package:badge_case/badge/widgets/badge_listview_widget.dart';
import 'package:badge_case/badge/widgets/card_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeManager extends StatefulWidget {
  const BadgeManager({super.key});

  @override
  State<BadgeManager> createState() => _BadgeManagerState();
}

class _BadgeManagerState extends State<BadgeManager> {
  final badgeManagerViewModel = Get.put(BadgeViewModel());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        badgeManagerViewModel.loadPaginatioList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Obx(
              () => CardSlider(
                badges: badgeManagerViewModel.badges.value,
                allAvarageRating: badgeManagerViewModel.allAvarageRating.value,
                allBadgeCount: badgeManagerViewModel.allBadgeCount.value,
              ),
            ),
            const SizedBox(height: 17),
            Obx(
              () => BagdeListViewWidget(
                badgeListItem: badgeManagerViewModel.paginatioList.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
