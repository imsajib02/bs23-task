import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../barrels/localizations.dart';
import '../barrels/resources.dart';
import '../barrels/utils.dart';

class ErrorPage extends StatelessWidget {

  final Function() onTap;

  ErrorPage({Key? key, required this.onTap}) : super(key: key);

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
                color: Colors.blue.shade50,
                image: DecorationImage(
                  image: AssetImage('assets/images/robot_oops.png')
                ),
              ),
            ),

            40.h,

            Text(STR_OOPS.tr,
              style: TextStyles.errorStyle.copyWith(
                fontSize: 30,
              ),
            ),

            10.h,

            Text(STR_DATA_FAILURE.tr,
              style: TextStyles.errorStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),

            30.h,

            ElevatedButton(
              onPressed: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 11),
                child: Text(STR_TRY_AGAIN.tr),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey.shade400),
                textStyle: MaterialStateProperty.all(TextStyles.buttonTextStyle),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}