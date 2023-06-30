import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/repository/comment_repository.dart';
import 'package:flutter_tutorial/ui/comments/cubit/comment_cubit.dart';
import 'package:flutter_tutorial/ui/comments/views/comments_page.dart';
import 'package:flutter_tutorial/ui/counter/cubit/counter_cubit.dart';
import 'package:flutter_tutorial/ui/counter/views/counter_page.dart';
import 'package:flutter_tutorial/ui/food/category_page.dart';
import 'package:flutter_tutorial/ui/food/detail_food_page.dart';
import 'package:flutter_tutorial/ui/food/foods_page.dart';
import 'package:flutter_tutorial/ui/travel_app/cubit/app_cubit_logics.dart';
import 'package:flutter_tutorial/ui/travel_app/cubit/app_cubits.dart';
import 'package:flutter_tutorial/ui/travel_app/nav_pages/main_page.dart';
import 'package:flutter_tutorial/ui/travel_app/pages/detail_page.dart';

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
        debugShowCheckedModeBanner: false,
        routes: {
          CounterPage.routeName: (context) => BlocProvider<CounterCubit>(
                create: (context) => CounterCubit(),
                child: CounterPage(),
              ),
          CategoriesPage.routeName: (context) => const CategoriesPage(),
          FoodsPage.routeName: (context) => const FoodsPage(),
          DetailFoodPage.routeName: (context) => const DetailFoodPage(),
          CommentsPage.routeName: (context) => BlocProvider<CommentCubit>(
                create: (context) => CommentCubit(CommentRepository()),
                child: CommentsPage(),
              ),
        },
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          fontFamily: 'Itim',
          // textTheme: ThemeData.light().textTheme.copyWith(
          //     bodyMedium: const TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
          //     bodySmall: const TextStyle(color: Color.fromARGB(20, 52, 52, 1)),
          //     titleMedium: const TextStyle(fontSize: 20, fontFamily: 'Sunshiney', color: Colors.white)),
        ),
        home: BlocProvider<AppCubits> (
          create: (_) => AppCubits(),
          child: AppCubitLogics(),
        ));
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
                )),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, CommentsPage.routeName);
                },
                child: const Text(
                  'Comments App',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      )),
    );
  }
}
