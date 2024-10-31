import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors_constants.dart';
import '../../../../core/constants/localization_constants.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../domain/entities/repository_entity.dart';
import '../../../../../core/extensions/sized_box_extension.dart';
import '../../../../../core/extensions/date_time_extension.dart';

// ignore: must_be_immutable
class RepositoryDetails extends StatelessWidget {

  late RepositoryEntity _repository;

  RepositoryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _repository = Get.arguments as RepositoryEntity;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: white,
        ),
        title: Text(_repository.name ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            _buildRepositoryInfo(_repository),

            _buildRepositoryStats(_repository),
          ],
        ),
      ),
    );
  }

  Widget _buildRepositoryInfo(RepositoryEntity repo) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          16.h,

          Text(repo.owner!,
            style: TextStyles.repoDescriptionStyle.copyWith(
              color: grey,
            ),
          ),

          4.h,

          Text(repo.name!,
            style: TextStyles.repoTitleStyle.copyWith(
              fontSize: 24,
            ),
          ),

          8.h,

          Text(repo.description ?? strNoDescription.tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.repoDescriptionStyle,
          ),

          8.h,

          Row(
            children: [

              Text(repo.language ?? strNun.tr,
                style: TextStyles.repoDescriptionStyle.copyWith(
                  color: primary,
                ),
              ),

              16.w,

              Row(
                children: [

                  const Icon(Icons.star, size: 16, color: amber),
                  4.w,
                  Text('${repo.stars}'),

                  16.w,
                  const Icon(Icons.call_split, size: 16),
                  4.w,

                  Text('${repo.forks}'),
                  16.w,
                  const Icon(Icons.arrow_drop_down_circle_outlined, size: 16),

                  4.w,
                  Text('${repo.openIssuesCount}'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRepositoryStats(RepositoryEntity repo) {

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          16.h,

          Text('${strLastUpdate.tr} ${DateTime.parse(repo.updatedAt!).toDateWithFullMonthString}',
            style: TextStyles.repoDescriptionStyle.copyWith(
              color: grey,
            ),
          ),

          4.h,

          Text('${strVisibility.tr} ${repo.visibility ?? strVisibility.tr}',
            style: TextStyles.repoDescriptionStyle.copyWith(
              color: grey,
            ),
          ),

          20.h,

          Text('${strTopic.tr} ${repo.topics!.isEmpty ? strNun.tr : ''}',
            style: TextStyles.repoDescriptionStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          8.h,

          Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: repo.topics!.map((topic) {

              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(topic),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
