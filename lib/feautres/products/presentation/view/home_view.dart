import 'package:flutter/material.dart';
import '../../../cart/presentation/view/cart_view.dart';
import '../../../favorite/presentation/view/favorite_view.dart';
import '../../../auth/presentation/view/profile/profile_view.dart';
import '../widgets/home/home_view_body.dart';

import '../widgets/drawer/drawer_body.dart';
import '../widgets/home/custom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const HomeViewBody(),
    const CartView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerBody(),
      bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex, onTap: _onItemTapped),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
