import 'package:get/get.dart';
import 'package:untitled/constants/dummy_data.dart';
import 'package:untitled/models/meals.dart';

class MealScreenController extends GetxController {
  String categoryTitle;
  RxList<Meal> displayedMeals =RxList<Meal>([]);

  @override
  void onInit() {
    super.onInit();

    //get arguments fromm categoryItemPage
    categoryTitle = Get.arguments['title'];
    final categoryId = Get.arguments['id'];

    //Returns a new lazy Iterable with all elements that satisfy the predicate
    // test here in Dummy_Meals list it check for all meals and return corresponding value;
    displayedMeals.value = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  void removeMeal(String mealId) {
    displayedMeals.removeWhere((meal) => meal.id == mealId);
  }
}
