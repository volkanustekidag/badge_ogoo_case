import 'package:badge_case/badge/services/badge_service.dart';
import 'package:get/get.dart';

class BadgeViewModel extends GetxController {
  RxList<dynamic> badgeListItem = <dynamic>[].obs;
  RxList<dynamic> badges = <dynamic>[].obs;
  RxList<dynamic> paginatioList = <dynamic>[].obs;
  Rx<bool> isLoadingbadgesSlider = false.obs;
  Rx<bool> isLoadingListListview = false.obs;
  Rx<int> allBadgeCount = 0.obs;
  Rx<double> allAvarageRating = 0.0.obs;
  Rx<int> sliderCurrentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getAllBadgeDataList().then((value) {
      getAllBadges().then((value) {
        countAvarageRatingAndCount()
            .then((value) => isLoadingbadgesSlider.value = true);
      });
    }).then((value) => isLoadingListListview.value = true);
  }

  /*
   * Gerekli performans iyileştirmesi  widgetlarla iyileştirildiği için
   * pagination ve lazy loading işlemine gerek kalmadı.
   */
  //Liste genişletilmek istendikçe 10'ar 10'ar listeyi arttırıyor.
  // Future<void> loadPaginatioList() async {
  //   paginatioList.value = paginatioList.value +
  //       List.generate(
  //           badgeListItem.value.length - paginatioList.value.length >= 10
  //               ? 10
  //               : badgeListItem.value.length - paginatioList.value.length,
  //           (i) => badgeListItem.value[i + paginatioList.value.length]);
  // }

  //Servisler aracılığıyla list-data.json dosyasındaki datayı alıypr.
  Future<void> getAllBadgeDataList() async {
    badgeListItem.value = await BadgeService().getBadgeListData();
    allBadgeCount.value = badgeListItem.value.length;
  }

  //Servisler aracılığıyla badge-data.json dosyasındaki datayı alıypr.
  Future<void> getAllBadges() async {
    badges.value = await BadgeService().getBadges();
  }

  //Bagde listesini kullanarak tüm dataları kontrol edip badge count ve avaragerating hesaplanıyor.
  Future<void> countAvarageRatingAndCount() async {
    double allBadgeTotalRating = 0;
    for (int i = 0; i < badges.value.length; i++) {
      double totalRating = 0;
      badges.value[i].count = 0;
      badges.value[i].avarageRating = 0.0;
      for (var badgeData in badgeListItem.value) {
        if (badges.value[i].id == badgeData.badge.first.lookupId) {
          badges.value[i].count++;
          totalRating += double.parse(badgeData.praiseRating);
        }
      }
      //Eğer badge listede hiç yoksa listeden çıkarılıyor ve sliderda görünmüyor.
      if (badges.value[i].count == 0) badges.value.remove(i);
      allBadgeTotalRating += totalRating;
      badges.value[i].avarageRating = totalRating / badges.value[i].count;
    }
    allAvarageRating.value = allBadgeTotalRating / allBadgeCount.value;
  }

  //Slider sayfalarının değişimini kontrol ediyor.
  onPageChanged(index) => sliderCurrentIndex.value = index;
}
