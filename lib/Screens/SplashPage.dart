
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/Screens/Login.dart';
import 'package:taskapp/Screens/Singup.dart';
import 'package:taskapp/Screens/logodesign.dart';
import 'package:taskapp/utils/AppColors.dart';
import 'package:taskapp/utils/AppImages.dart';
import 'package:taskapp/utils/AppStrings.dart';
import 'package:taskapp/utils/text_style.dart';



void main() async {

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),

      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
      debugShowCheckedModeBanner: false,
    );


  }
}
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as per your requirement
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: AppColors.primary,
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: AppColors.primary,
                ),
                Positioned(
                  bottom: 120,
                  left: 0,
                  right: 0,
                  child: ItemWhiteOpacityCircle(),),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(""),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 280,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              AppStrings.title,
                              textAlign: TextAlign.center,
                              style: CustomStyle.title
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "",
                            textAlign: TextAlign.center,
                            style: CustomStyle.optimze,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  style:CustomStyle.txtvalue1,
                                  children: [
                                    TextSpan(text: '© ${DateTime.now().year} '),
                                    TextSpan(
                                        text: "",
                                        style: TextStyle(
                                            color: AppColors.primary)),
                                    TextSpan(text: AppStrings.copyRights),
                                  ]))
                        ],
                      ),
                    )),
                const Positioned(
                  bottom: 200,
                  left: 0,
                  right: 0,
                  child: ItemLogoRounded(),
                ),
              ],
            ),
          ),
        ));
  }


}