import 'package:get/get.dart';
import 'package:untitled/wedgits/screens/category_meals_screen.dart';
import 'package:untitled/wedgits/screens/filter_screens.dart';
import 'package:untitled/wedgits/screens/meal_detail_screen.dart';
import 'package:untitled/wedgits/screens/my_home_page.dart';
import 'package:untitled/wedgits/screens/tabs_screen.dart';

routes() => [
      GetPage(
        name: "/",
        page: () => TabsScreen(),
      ),
      GetPage(
        name: MyHomePage.pageId,
        page: () => MyHomePage(),
      ),
      GetPage(
        name: CategoryMealsScreen.pageId,
        page: () => CategoryMealsScreen(),
      ),
      GetPage(
        name: MealDetailScreen.pageId,
        page: () => MealDetailScreen(),
      ),
      GetPage(
        name: FilterScreen.pageId,
        page: () => FilterScreen(),
      ),
      GetPage(
        name: TabsScreen.pageId,
        page: () => TabsScreen(),
      ),
    ];
