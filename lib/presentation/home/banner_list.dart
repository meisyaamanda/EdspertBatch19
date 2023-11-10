import 'package:flutter/material.dart';

import '../../data/model/banner_response_model.dart';

class BannerListWidget extends StatelessWidget {
  final List<BannerData> bannerList;
  const BannerListWidget({super.key, required this.bannerList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 146,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 29,
        ),
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          final banner = bannerList[index];

          return SizedBox(
            height: 146,
            width: 284,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                banner.eventImage ?? '',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
