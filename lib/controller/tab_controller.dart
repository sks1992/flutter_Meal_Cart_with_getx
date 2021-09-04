import 'package:get/get.dart';
import 'package:untitled/wedgits/screens/categories_screen.dart';
import 'package:untitled/wedgits/screens/favorites_screen.dart';

class TabsController extends GetxController {
  final List<Map<String, Object>> pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Favorite'},
  ];

  var selectedPageIndex = 0.obs;

  void selectPage(int index) {
    selectedPageIndex.value = index;
  }
}
