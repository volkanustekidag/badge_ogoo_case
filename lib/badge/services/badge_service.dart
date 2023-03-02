import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/models/badge.dart';
import 'package:badge_case/badge/models/badge_list_item.dart';
import 'package:badge_case/badge/services/local_service.dart';

class BadgeService {
  Future<List<dynamic>> getBadges() async {
    try {
      final data =
          await LocalService().readLocalJson(AppConstants.badgeJsonPath);
      return data["value"].map((data) => Badge.fromJson(data)).toList();
    } catch (_) {}
    return throw Exception();
  }

  Future<List<dynamic>> getBadgeListData() async {
    try {
      final data =
          await LocalService().readLocalJson(AppConstants.listDataJsonPath);
      return data["Row"].map((data) => BagdeListItem.fromJson(data)).toList();
    } catch (_) {
      return throw Exception();
    }
  }
}
