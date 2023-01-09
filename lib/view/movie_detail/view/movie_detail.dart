import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MovieDetail extends StatefulWidget {
  static const routeName = 'movieDetail';
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final _dummyImage = 'https://picsum.photos/1200';

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          expandedHeight: context.height / 2,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(innerBoxIsScrolled ? 'Hello' : ' data'),
            centerTitle: true,
            background: Image.network(
              _dummyImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      body: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Text('$index'),
            );
          },
        ),
      ),
    );
  }
}
