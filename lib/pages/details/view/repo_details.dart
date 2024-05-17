import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../barrels/models.dart';

class RepoDetails extends StatelessWidget {

  const RepoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var repo = Get.arguments as GithubRepo;

    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(repo.name!),
        ),
        body: Builder(
          builder: (context) {

            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [


                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
