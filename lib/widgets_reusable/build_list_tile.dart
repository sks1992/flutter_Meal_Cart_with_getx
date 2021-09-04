import 'package:flutter/material.dart';
import 'package:untitled/constants/style.dart';

class BuildListTile extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function selectionHandler;


  BuildListTile(this.title, this.icon,this.selectionHandler);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: kDrawerListTileTextStyle,
      ),
      onTap: selectionHandler,
    );
  }
}
