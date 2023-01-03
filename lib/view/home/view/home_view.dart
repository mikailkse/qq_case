import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/textformfield/custom_text_form_field.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../movie_detail/view/movie_detail.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: context.width / 10),
              CustomTextFormField(),
              GridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) => const _HomeMovieCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeMovieCard extends StatelessWidget {
  const _HomeMovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          NavigationService.instance.navigateToPage(MovieDetail.routeName),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      ImageConstants.instance.qq_logo,
                    ),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
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
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'adwdaw',
                  style: TextStyle(color: Colors.white),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
