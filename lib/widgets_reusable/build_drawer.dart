import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/style.dart';
import 'package:untitled/wedgits/screens/filter_screens.dart';
import 'package:untitled/wedgits/screens/tabs_screen.dart';

import 'build_list_tile.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking App!',
              style: kDrawerTextStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          BuildListTile(
            "Meals",
            Icons.restaurant,
            () {
              //Pop the current named page in the stack and push a new one in its place
              Get.offNamed(TabsScreen.pageId);
            },
          ),
          BuildListTile(
            "Filters",
            Icons.settings,
            () {
              //Pop the current named page in the stack and push a new one in its place
              Get.offNamed(FilterScreen.pageId);
            },
          ),
        ],
      ),
    );
  }
}
