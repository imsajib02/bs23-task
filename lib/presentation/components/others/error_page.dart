import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/localization_constants.dart';
import '../../../core/extensions/sized_box_extension.dart';
import '../../../core/styles/text_styles.dart';

class ErrorPage extends StatelessWidget {

  final Function() onRetry;

  const ErrorPage({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.isDarkMode ? Colors.grey : Colors.blue.shade50,
                image: const DecorationImage(
                  image: AssetImage('assets/images/robot_oops.png')
                ),
              ),
            ),

            40.h,

            Text(strOops.tr,
              style: TextStyles.errorStyle.copyWith(
                fontSize: 30,
              ),
            ),

            10.h,

            Text(strDataLoadFailure.tr,
              style: TextStyles.errorStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),

            30.h,

            ElevatedButton(
              onPressed: onRetry,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade400),
                textStyle: MaterialStateProperty.all(TextStyles.buttonTextStyle),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                child: Text(strTryAgain.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}