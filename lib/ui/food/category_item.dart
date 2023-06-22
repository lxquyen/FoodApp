import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/food/foods_page.dart';
import 'package:flutter_tutorial/models/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    Color color = category.color;
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodsPage(
        //           category: category,
        //         )));
        Navigator.pushNamed(context, FoodsPage.routeName, arguments: {'category': category});
      },
      splashColor: Colors.deepPurple,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            gradient: LinearGradient(
                colors: [color.withOpacity(0.6), color],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              category.content,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
