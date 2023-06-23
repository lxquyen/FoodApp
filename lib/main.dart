import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/counter/counter_page.dart';
import 'package:flutter_tutorial/ui/food/category_page.dart';
import 'package:flutter_tutorial/ui/food/detail_food_page.dart';
import 'package:flutter_tutorial/ui/food/foods_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          CounterPage.routeName: (context) => CounterPage(),
          CategoriesPage.routeName: (context) => const CategoriesPage(),
          FoodsPage.routeName: (context) => const FoodsPage(),
          DetailFoodPage.routeName: (context) => const DetailFoodPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          fontFamily: 'Itim',
          // textTheme: ThemeData.light().textTheme.copyWith(
          //     bodyMedium: const TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
          //     bodySmall: const TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
          //     titleMedium: const TextStyle(fontSize: 20, fontFamily: 'Sunshiney', color: Colors.white)),
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Demo"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, CategoriesPage.routeName);
                },
                child: const Text(
                  'Food App',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, CounterPage.routeName);
                },
                child: const Text(
                  'Counter App',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      )),
    );
  }
}
