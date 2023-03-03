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
  // ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /*
   * Gerekli performans iyileştirmesi  widgetlarla iyileştirildiği için
   * pagination ve lazy loading işlemine gerek kalmadı.
   */
    // //Aşağı scroll işlemini kontrol ederek listeye yeni veriler ekliyor.(Lazy loading)
    // scrollController.addListener(() {
    //   if (scrollController.position.pixels >=
    //       scrollController.position.maxScrollExtent) {
    //     // badgeManagerViewModel.loadPaginatioList();
    //     print(badgeManagerViewModel.paginatioList.length);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
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
          badgeListItem: badgeManagerViewModel.badgeListItem.value,
        ),
      ),
    ];

    return Scaffold(
      appBar: const AppBarWidget(),
      body: ListView.builder(
        // controller: scrollController,
        itemCount: bodyWidgets.length,
        itemBuilder: (context, index) => bodyWidgets[index],
      ),
    );
  }
}
