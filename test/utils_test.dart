import 'package:badge_case/badge/utils/badge_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  setUp(() => initializeDateFormatting('tr'));
  test("Get Slider Page Count", () {
    int pageCount = BadgeUtils.getSliderPageCount(12);

    expect(pageCount, 3);
  });

  test("Get Grid View Couht", () {
    int gridViewCount = BadgeUtils.getGridViewCouht(9, 0);

    expect(gridViewCount, 4);
  });

  test(" Get Card Image Path By Id ", () {
    String path = BadgeUtils.getCardImagePathById(1);

    expect(path, "assets/image/1.png");
  });

  test("Format Date", () {
    String date = BadgeUtils.formatDate("2021-08-09T13:48:06Z");
    expect(date, "Ağustos 9, 13:48");
  });
}
