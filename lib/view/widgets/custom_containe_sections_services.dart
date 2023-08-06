import 'package:flutter/material.dart';

import '../../const/colors.dart';

class ContainerServices extends StatelessWidget {
   ContainerServices({super.key ,required this.nameAsset,required this.nameServices});
  String nameAsset;
  String nameServices;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 83,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.05),
          )
        ],
      ),
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey,
        child: Column(
          children: [
            Image.asset(nameAsset),
            Text(
           nameServices,
              style: TextStyle(color: themColor),
            )
          ],
        ),
      ),
    );
  }
}
