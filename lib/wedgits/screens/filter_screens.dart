import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/filter_screen_controller.dart';
import 'package:untitled/widgets_reusable/build_drawer.dart';
import 'package:untitled/widgets_reusable/build_switch_list_tile.dart';

class FilterScreen extends StatelessWidget {
  static const pageId = "/filter";

  final FilterScreenController fsc = Get.put(FilterScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView(
                children: [
                  BuildSwitchListTile(
                    title: "Gluten Free",
                    description: "Only Include Gluten free meal.",
                    currentValue: fsc.glutenFree.value,
                    updateValue: (newValue) {
                      fsc.glutenFree.value = newValue;
                    },
                  ),
                  BuildSwitchListTile(
                    title: "Vegetarian ",
                    description: "Only Include Vegetarian meal.",
                    currentValue: fsc.vegetarian.value,
                    updateValue: (newValue) {
                      fsc.vegetarian.value = newValue;
                    },
                  ),
                  BuildSwitchListTile(
                    title: "Vegan ",
                    description: "Only Include Veagn meal.",
                    currentValue: fsc.vegan.value,
                    updateValue: (newValue) {
                      fsc.vegan.value = newValue;
                    },
                  ),
                  BuildSwitchListTile(
                    title: "Gluten Free",
                    description: "Only Include Lactose free meal.",
                    currentValue: fsc.lactoseFree.value,
                    updateValue: (newValue) {
                      fsc.lactoseFree.value = newValue;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
