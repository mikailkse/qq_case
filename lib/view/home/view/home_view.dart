import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../core/init/navigation/navigation_service.dart';
import '../../movie_detail/view/movie_detail.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  static const routeName = 'homeView';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().homeServiceInitState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<HomeViewModel>(
        builder: (context, value, child) => GridView.builder(
          itemCount: value.movieResultsArray.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => NavigationService.instance
                .navigateToPage(MovieDetail.routeName),
            child: Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              fit: StackFit.expand,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: context.normalBorderRadius,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    height: context.mediumValue * 1.8,
                    width: context.width * .31,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        value.movieResultsArray[index].originalTitle.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
