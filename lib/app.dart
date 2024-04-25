
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screens/daily_quote_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Цитата дня',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100), // Устанавливаем высоту AppBar
          child: AppBar(
            title: Center(
              child: Transform.scale(
                scale: 0.60,
                child: SvgPicture.asset('assets/logo.svg'),
              ),
            ),
            toolbarHeight: 100, // Устанавливаем высоту AppBar
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: DailyQuoteScreen(),
        ),
      ),
    );
  }
}
