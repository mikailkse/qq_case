import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qq_case/view/search/view/search_view.dart';
import '../../../core/components/bottomnavigationbar/bottomnavigationbar.dart';
import '../../home/view/home_view.dart';
import '../viewmodel/bottom_navbar_view_model.dart';

class BottomNavbar extends StatefulWidget {
  static const routeName = 'bottomNavbar';
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<BottomNavbarViewModel>().selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: CustomBottomNavigationBar(context: context),
      ),
    );
  }

  List screens = [
    const HomeView(),
    const SearchView(),
  ];
}
