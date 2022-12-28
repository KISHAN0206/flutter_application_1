import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'ui/cart/cart.dart';
import 'ui/fav/fav.dart';
import 'ui/home/home.dart';
import 'ui/profile/profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

//For Dark mode

      /*themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),*/
      theme: ThemeData(
          //primarySwatch: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
          outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0;
  final _pageNo = [Home(), Favorite(), CartPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Colors.black,
        backgroundColor: Colors.black,
        title: Text('Hair With Flair'),
        shadowColor: Colors.grey,
      ),
      body: _pageNo[selectedpage],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 12,
          ),
          child: GNav(
              //backgroundColor: Colors.black,
              activeColor: Colors.white,
              color: Colors.white,
              tabBackgroundColor: Color.fromARGB(76, 158, 158, 158),
              iconSize: 20,
              tabMargin: EdgeInsets.all(1),
              tabBorder: Border.all(color: Colors.grey, width: 1),
              tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
              curve: Curves.easeInOutExpo,
              duration: Duration(milliseconds: 100),
              gap: 5,
              padding: EdgeInsets.all(8),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "home",
                ),
                GButton(
                  icon: Icons.favorite,
                  text: "Favorite",
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Cart",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                ),
              ],
              selectedIndex: selectedpage,
              onTabChange: (int index) {
                setState(
                  () {
                    selectedpage = index;
                  },
                );
              }
              ),
        ),
      ),
    );
  }
}
