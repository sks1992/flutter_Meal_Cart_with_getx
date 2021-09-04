import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/dummy_data.dart';
import 'package:untitled/widgets_reusable/build_container.dart';
import 'package:untitled/widgets_reusable/build_selection_title.dart';

class MealDetailScreen extends StatelessWidget {
  static const pageId = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = Get.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) => meals.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSelectionTitle('Ingredients'),
            BuildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            BuildSelectionTitle('Steps'),
            BuildContainer(
              ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.black54,
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          //Pop the current page, snackbar, dialog or bottomless in the stack
          Get.back(result: mealId);
        },
      ),
    );
  }
}
