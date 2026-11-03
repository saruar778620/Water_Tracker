import 'package:flutter/material.dart';
import 'package:water_traker/home_screen.dart';

void main(){
  runApp(Water_tracker());
}


class Water_tracker extends StatelessWidget {
  const Water_tracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,

        )
      ),
      home: HomeScreen(),
    );
  }
}
