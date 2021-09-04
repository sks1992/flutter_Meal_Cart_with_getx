import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/wedgits/screens/category_meals_screen.dart';


class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItems(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    //we use inkwell because it produce ripple effect when onTap
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      //we use Get.to for go to next page. CategoryMealScreen Take two property
      //onTap: () => Get.to(() => CategoryMealsScreen(id, title)),

      //we use toNamed so we can pass arguments to next page
      onTap: () => Get.toNamed(
        CategoryMealsScreen.pageId,
        arguments: {
          'id': id,
          'title': title,
        },
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
