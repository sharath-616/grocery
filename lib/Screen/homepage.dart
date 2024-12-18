import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:grocery/Screen/carousel.dart';
import 'package:grocery/Screen/product_grid.dart';
import 'package:grocery/Utilities/customtext.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _bottomNavIndex = 0;
  final List<IconData> iconList = [
    Icons.home,
    Icons.menu,
    Icons.bookmark,
    Icons.account_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/menu.png'),
          ),
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.location_on_outlined,
              ),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Customtext(
                      text: 'Current location',
                      clr: Colors.black,
                      fs: 13,
                      fw: FontWeight.bold,
                      fm: 'Roboto',
                    ),
                    Customtext(
                      text: 'New York',
                      clr: Colors.black,
                      fs: 13,
                      fw: FontWeight.normal,
                      fm: 'Roboto',
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0.0), 
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200, 
                child: Carousel(),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, 
                child: ProductGrid(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
          size: 20,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 10,
        rightCornerRadius: 10,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
