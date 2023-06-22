import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ui/food/detail_food_page.dart';
import 'package:flutter_tutorial/ui/food/fake_data.dart';
import 'package:flutter_tutorial/models/Category.dart';
import 'package:flutter_tutorial/models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';

  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    final category = arguments['category'] as Category;
    List<Food> foods =
        FAKE_FOODS.where((food) => food.categoryId == category.id).toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Foods from ${category.content}"),
      ),
      body: Center(
          child: foods.isNotEmpty
              ? ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    Food food = foods[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DetailFoodPage.routeName,
                            arguments: {'food': food});
                      },
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: Center(
                                child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: food.urlImage),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                              child: Row(
                                children: [
                                  const Icon(Icons.timer,
                                      color: Colors.white, size: 25),
                                  Text(
                                    '${food.duration.inMinutes} minutes',
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  })
              : const Text(
                  'No food found',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
    );
  }
}
