import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../core/constants/localization_constants.dart';
import '../../../core/styles/text_styles.dart';
import '../../../domain/entities/repository_entity.dart';
import '../../../core/extensions/sized_box_extension.dart';
import '../../../core/extensions/date_time_extension.dart';

class RepoCard extends StatelessWidget {

  final RepositoryEntity repository;
  final Function(RepositoryEntity) onClick;

  const RepoCard({Key? key, required this.repository, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => onClick(repository),
      child: Card(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(repository.name!,
                style: TextStyles.repoTitleStyle,
              ),

              4.h,

              Text(repository.owner!,
                style: TextStyles.repoDescriptionStyle.copyWith(
                  color: grey,
                ),
              ),

              8.h,

              Text(repository.description ?? strNoDescription.tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.repoDescriptionStyle,
              ),

              8.h,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [

                      const Icon(Icons.star, size: 16, color: amber),

                      4.w,

                      Text('${repository.stars}'),

                      16.w,

                      const Icon(Icons.call_split, size: 16),

                      4.w,

                      Text('${repository.forks}'),
                    ],
                  ),

                  Text(repository.language ?? strNun.tr,
                    style: TextStyles.repoDescriptionStyle.copyWith(
                      color: primary,
                    ),
                  ),
                ],
              ),

              8.h,

              Text('${strLastUpdate.tr} ${DateTime.parse(repository.updatedAt!).toDateWithFullMonthString}',
                style: TextStyles.repoUpdateAtStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
