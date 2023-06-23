import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/food/category_item.dart';
import 'package:flutter_tutorial/ui/food/fake_data.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12),
        children: FAKE_CATEGORIES
            .map((category) => CategoryItem(category: category))
            .toList(),
      ),
    );
  }
}
