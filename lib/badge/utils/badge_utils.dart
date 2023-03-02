import 'package:intl/intl.dart';

class BadgeUtils {
  static getSliderPageCount(int length) => length / 4 > (length / 4).round()
      ? (length / 4).round() + 1
      : (length / 4).round();

  static getGridViewCouht(int l1, int index) =>
      (index * 4 < l1 && l1 - (index * 4) > 4) ? 4 : (l1 - (index * 4));

  static formatDate(String date) {
    print(DateFormat("MMMM d, HH:mm", 'tr').format(DateTime.parse(date)));
    return DateFormat("MMMM d, HH:mm", 'tr').format(DateTime.parse(date));
  }

  static getCardImagePathById(id) => "assets/image/$id.png";
}
