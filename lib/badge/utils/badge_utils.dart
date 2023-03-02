import 'package:intl/intl.dart';

class BadgeUtils {
  //Sliderın kaç sayfa olacağını belirlemek için kullanılıyor.
  static getSliderPageCount(int length) => length / 4 > (length / 4).round()
      ? (length / 4).round() + 1
      : (length / 4).round();

  //Her bir slider sayfasında toplamda kaç item olacak onu belirliyor.
  static getGridViewCouht(int l1, int index) =>
      (index * 4 < l1 && l1 - (index * 4) > 4) ? 4 : (l1 - (index * 4));

  //Jsonda bulunan date formatını ui'da görülen date formatına çeviriyor.
  static formatDate(String date) =>
      DateFormat("MMMM d, HH:mm", 'tr').format(DateTime.parse(date));

  //badge fotoğraflarını id'ye bağlı olarak path dosyayı döndürüyor.
  static getCardImagePathById(id) => "assets/image/$id.png";
}
