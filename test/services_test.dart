import 'dart:developer';

import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/services/badge_service.dart';
import 'package:badge_case/badge/services/local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test("Local Service  Test", () {
    final data = LocalService().readLocalJson(AppConstants.badgeJsonPath);
    expect(data, isNotNull);
  });

  test("Get Badge List Data ", () async {
    final response = await BadgeService().getBadgeListData();

    expect(response is List<dynamic>, true);
  });

  test("Get Badges ", () async {
    final response = await BadgeService().getBadges();

    expect(response is List<dynamic>, true);
  });
}
