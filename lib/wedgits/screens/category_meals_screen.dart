import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/meal_screen_controller.dart';
import 'package:untitled/wedgits/items/meal_items.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const pageId = "/category-meals";

  final MealScreenController msc = Get.put(MealScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(msc.categoryTitle),
      ),
      //Creates a scrollable, linear array of widgets that are created on demand.
      //we use ListView.builder because we don't know number of item need to show
      // itemBuilder provide ue with a method so that this method will be call for
      //every item in list and add item to screen
      body: Obx(
        () => ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItems(
              id: msc.displayedMeals[index].id,
              title: msc.displayedMeals[index].title,
              imageUrl: msc.displayedMeals[index].imageUrl,
              duration: msc.displayedMeals[index].duration,
              complexity: msc.displayedMeals[index].complexity,
              affordability: msc.displayedMeals[index].affordability,
              removeItem: msc.removeMeal,
            );
          },
          itemCount: msc.displayedMeals.length,
        ),
      ),
    );
  }
}

/*
Changed 1.
class CategoryMealsScreen extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child:Text("The Recipes for the Categories"),
      ),
    );
  }
}

*/
