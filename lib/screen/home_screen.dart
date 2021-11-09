import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zido_app/provider/settings_provider.dart';
import 'package:zido_app/screen/sections/last_post.dart';
import 'package:zido_app/screen/sections/new_zido.dart';
import 'package:zido_app/screen/sections/private_zido.dart';
import 'package:zido_app/screen/sections/slider.dart';
import 'package:zido_app/utils/components.dart';
import 'package:zido_app/utils/style.dart';
import 'package:zido_app/widget/custom_title.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<BottomNavigationBarItem> bottomBarItems(context) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/images/home_smile.svg'),
        label: getString(context, 'home'),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/images/shopping.svg',
        ),
        label: getString(context, 'buy'),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/images/sell.svg'),
        label: getString(context, 'sell'),
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset('assets/images/person.svg'),
        label: getString(context, 'profile'),
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Zido',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<SettingsProvider>(context, listen: false)
                  .toggleLocale();
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ZidoSlider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ZidoTitle(
                    title: getString(context, "newZido"),
                    seeAllFunction: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3 + 40,
                    child: NewZido(),
                  ),
                  ZidoTitle(
                    title: getString(context, "privateZido"),
                    seeAllFunction: () {},
                  ),
                  PrivateZido(),
                  ZidoTitle(
                    title: getString(context, "lastPost"),
                    seeAllFunction: () {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: const LastPosts(),
                  ),
                  const SizedBox(
                    height: kToolbarHeight / 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomBarItems(context),
        currentIndex: _selectedIndex,
        // onTap: _onItemTapped,

        showUnselectedLabels: true,
      ),
    );
  }
}
