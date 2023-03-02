import 'package:badge_case/badge/view_model/badge_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  late BadgeViewModel badgeViewModel;
  setUpAll(() async {
    badgeViewModel = Get.put(BadgeViewModel());
    await badgeViewModel.getAllBadgeDataList().then((value) {
      badgeViewModel.getAllBadges().then((value) {
        badgeViewModel
            .countAvarageRatingAndCount()
            .then((value) => badgeViewModel.isLoadingbadgesSlider.value = true);
      });
    }).then((value) => badgeViewModel.loadPaginatioList());
  });
  test("Get Badges", () {
    expect(badgeViewModel.badges.value.length, 9);
  });

  test("Load Pagination List", () {
    expect(badgeViewModel.paginatioList.length, 20);
  });

  test("Get Badge List", () {
    expect(badgeViewModel.badgeListItem.length, 546);
  });

  test("All Avarage Rating", () {
    expect(badgeViewModel.allAvarageRating.value.toStringAsFixed(1), "2.8");
  });
}
