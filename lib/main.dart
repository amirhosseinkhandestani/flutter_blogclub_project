import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blogclub_project/article.dart';
import 'package:flutter_blogclub_project/carousel/carousel_slider.dart';
import 'package:flutter_blogclub_project/data.dart';
import 'package:flutter_blogclub_project/gen/assets.gen.dart';
import 'package:flutter_blogclub_project/gen/fonts.gen.dart';
import 'package:flutter_blogclub_project/home.dart';
import 'package:flutter_blogclub_project/profile.dart';
import 'package:flutter_blogclub_project/splash.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0d253c);
    final secondaryTextColor = Color(0xff2d4379);
    final primaryColor = Color(0xff376aed);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: FontFamily.avenir)))),
          colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryTextColor,
              onBackground: primaryTextColor,
              background: Color(0xfffbfcff),
              surface: Colors.white),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: primaryColor,
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor,
              titleSpacing: 32),
          textTheme: TextTheme(
              headlineSmall: const TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              headlineMedium: TextStyle(
                fontFamily: FontFamily.avenir,
                fontSize: 24,
                color: primaryTextColor,
                fontWeight: FontWeight.w700,
              ),
              titleMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w200,
                  color: secondaryTextColor,
                  fontSize: 18),
              titleLarge: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
              titleSmall: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: primaryTextColor),
              bodySmall: const TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7b8bb2),
                  fontSize: 10),
              bodyMedium: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontSize: 12))),
      //
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  Navigator(
                      key: _homeKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )),
                  Navigator(
                      key: _articleKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => ArticleScreen(),
                          )),
                  Navigator(
                      key: _searchKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => SimpleScreen(),
                          )),
                  Navigator(
                      key: _menuKey,
                      onGenerateRoute: (settings) => MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          )),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNaigation(
                  selectedIndex: selectedScreenIndex,
                  onTab: (int index) {
                    setState(() {
                      _history.remove(selectedScreenIndex);
                      _history.add(selectedScreenIndex);
                      selectedScreenIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

int screenNumber = 1;

class SimpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Screen #$screenNumber',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ElevatedButton(
              onPressed: () {
                screenNumber++;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SimpleScreen()));
              },
              child: Text('Click Me'))
        ],
      ),
    );
  }
}

class _BottomNaigation extends StatelessWidget {
  final Function(int index) onTab;
  final int selectedIndex;

  const _BottomNaigation(
      {super.key, required this.onTab, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0xff9b8487).withOpacity(0.3),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNaigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'homeactive.png',
                      onTab: () {
                        onTab(homeIndex);
                      },
                      isActive: selectedIndex == homeIndex,
                      title: 'Home'),
                  BottomNaigationItem(
                      iconFileName: 'articel.png',
                      activeIconFileName: 'articleactiv.png',
                      onTab: () {
                        onTab(articleIndex);
                      },
                      isActive: selectedIndex == articleIndex,
                      title: 'Article'),
                  Expanded(child: Container()),
                  BottomNaigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'searchactive.png',
                      onTab: () {
                        onTab(searchIndex);
                      },
                      isActive: selectedIndex == searchIndex,
                      title: 'Search'),
                  BottomNaigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'menuactive.png',
                      onTab: () {
                        onTab(menuIndex);
                      },
                      isActive: selectedIndex == menuIndex,
                      title: 'Profile')
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                  height: bottomNavigationHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.5),
                      color: const Color(0xff376aed),
                      border: Border.all(color: Colors.white, width: 4)),
                  child: Image.asset('assets/img/icons/plus.png')),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNaigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final bool isActive;
  final Function() onTab;

  const BottomNaigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title,
      required this.onTab,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTab,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
                width: 24,
                height: 24,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(title,
                  style: themeData.textTheme.bodySmall!.apply(
                      color: isActive
                          ? themeData.colorScheme.primary
                          : themeData.textTheme.bodySmall!.color))
            ],
          ),
        ),
      ),
    );
  }
}
