import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/barrels/utils.dart';

import '../barrels/localizations.dart';
import '../barrels/models.dart';
import '../barrels/resources.dart';

class RepoWidget extends StatelessWidget {

  final GithubRepo repo;
  final Function() onView;

  const RepoWidget({Key? key, required this.repo, required this.onView}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onView,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [

              _cardInfo(
                imagePath: 'assets/images/name.png',
                title: STR_NAME.tr,
                value: repo.name!,
              ),

              5.h,

              _cardInfo(
                imagePath: 'assets/images/programmer.png',
                title: STR_STAR.tr,
                value: repo.stargazersCount!.toString(),
              ),

              5.h,

              _cardInfo(
                imagePath: 'assets/images/star.png',
                title: STR_OWNER.tr,
                value: repo.owner!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardInfo({required String imagePath, required String title, required String value}) {

    return Row(
      children: [

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset(imagePath,
                height: 16,
                width: 16,
                fit: BoxFit.contain,
              ),

              8.w,

              Text(title + ' :',
                style: TextStyles.cardTitleStyle,
              ),
            ],
          ),
        ),

        10.w,

        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Flexible(
                child: Text(value,
                  textAlign: TextAlign.right,
                  style: TextStyles.cardTitleStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
