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
      home: ArticleScreen(),
    );
  }
}

class _BottomNaigation extends StatelessWidget {
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
                children: const [
                  BottomNaigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  BottomNaigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Article'),
                  SizedBox(
                    width: 8,
                  ),
                  BottomNaigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                  BottomNaigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Menu')
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
                  height: 65,
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

  const BottomNaigationItem(
      {super.key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
