import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/end_point.dart';
import '../../../../models/movie_details.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    Key? key, required this.movieDetailsModel,
  }) : super(key: key);
  final MovieDetailsModel movieDetailsModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: size.height / 2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      '$imagePath${movieDetailsModel.backdropPath}',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.8),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 35),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.black,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetailsModel.originalTitle!.toUpperCase(),
                // overflow: TextOverflow.clip,
                style: bodyStyle3.copyWith(color: AppColor.black),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                movieDetailsModel.overview!,
                style: bodyStyle3.copyWith(
                    color: AppColor.black, letterSpacing: 1),
              )
            ],
          ),
        )
      ],
    );
  }
}
