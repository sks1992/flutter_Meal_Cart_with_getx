import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/tab_controller.dart';
import 'package:untitled/widgets_reusable/build_drawer.dart';

class TabsScreen extends StatelessWidget {
  static const pageId = "/tab-screen";

  final TabsController tc = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(tc.pages[tc.selectedPageIndex.value]['title'])),
      ),
      drawer: MyDrawer(),
      body: Obx(() => tc.pages[tc.selectedPageIndex.value]['page']),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: tc.selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: tc.selectedPageIndex.value,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: "Categories GetX",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites GetX",
            ),
          ],
        ),
      ),
    );
  }
}
