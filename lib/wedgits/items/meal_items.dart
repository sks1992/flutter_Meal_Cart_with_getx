import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/style.dart';
import 'package:untitled/models/meals.dart';
import 'package:untitled/wedgits/screens/meal_detail_screen.dart';

class MealItems extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;

  final Complexity complexity;

  final Affordability affordability;
  final Function removeItem;

  MealItems(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.removeItem});

  //to get text from enum class we create a getter
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "UnKnown";
    }
    /*if (complexity == Complexity.Simple) {
          return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else if (complexity == Complexity.Hard) {
      return "Hard";
    }*/
  }

  //to get text from enum class we create a getter
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "UnKnown";
    }
    /*if (complexity == Complexity.Simple) {
          return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else if (complexity == Complexity.Hard) {
      return "Hard";
    }*/
  }

  void selectMeal() {
    //here then will be run when the initial page will be pop from stack
    //Register callbacks to be called when this future completes.
    // When this future completes with a value, the onValue callback will be called with that value.
    Get.toNamed(MealDetailScreen.pageId, arguments: id).then((result) {
      removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: kTextStyle,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
