import 'package:badge_case/badge/const/app_constants.dart';
import 'package:badge_case/badge/const/app_styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: AppStyles.appBarShadow),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        title: const Text(
          "TAKDIR & TEŞEKKÜR",
          style: TextStyle(
            color: Color(0xFF4A4A4A),
            fontFamily: AppConstants.gothamMedium,
          ),
        ),
      ),
    );
  }

  @override
  get preferredSize => const Size.fromHeight(60);
}
