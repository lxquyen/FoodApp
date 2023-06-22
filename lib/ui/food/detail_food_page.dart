import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/food.dart';

class DetailFoodPage extends StatelessWidget {
  static const String routeName = '/DetailFoodPage';

  const DetailFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Food>;
    final food = args['food'] as Food;
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Column(
        children: [
          Center(
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif', image: food.urlImage),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Ingredients',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView.builder(
                itemCount: food.ingredients.length,
                itemBuilder: (context, index) {
                  String ingredient = food.ingredients[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${index + 1}',
                        style:
                            const TextStyle(fontSize: 19, color: Colors.black),
                      ),
                    ),
                    title: Text(
                      ingredient,
                      style: const TextStyle(fontSize: 22),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
