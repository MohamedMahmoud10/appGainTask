import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

import '../../../../controllers/cubit/home_page_cubit.dart';
import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/end_point.dart';
import '../../../../models/popular_movies.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key, required this.results}) : super(key: key);
  final Results results;

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  StreamSubscription? _sub;

  Future<void> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub = linkStream.listen((String? link) async {
      if (link != null) {
        var uri = Uri.parse(link);
        //GET DEEP LINK WITH MOVIE ID
        if (uri.queryParameters['id'] != null) {
          log(uri.queryParameters['id'].toString());
          await BlocProvider.of<HomePageCubit>(context).getMovieDetails(
              id: int.parse(uri.queryParameters['id'].toString()));
        await  Navigator.of(context).pushNamed('/detailsScreen',
              arguments: int.parse(uri.queryParameters['id'].toString()));
        }
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  @override
  void initState() {
    initUniLinks();
    super.initState();
  }

  @override
  void dispose() {
    _sub!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: () async {
          await BlocProvider.of<HomePageCubit>(context)
              .getMovieDetails(id: widget.results.id!);
          Navigator.of(context)
              .pushNamed('/detailsScreen', arguments: widget.results.id);
        },
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height / 2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        '$imagePath${widget.results.posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: size.width,
                color: AppColor.greyColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle_fill_rounded)),
                    Expanded(
                      child: Text(
                        widget.results.title!,
                        style: titleStyle,
                        maxLines: 1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.results.overview!,
                style: bodyStyle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Released:${widget.results.releaseDate!}',
                    style: bodyStyle2,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
