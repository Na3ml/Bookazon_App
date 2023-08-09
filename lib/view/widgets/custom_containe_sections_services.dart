import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';



// ignore: must_be_immutable
class ContainerServices extends StatefulWidget {
   ContainerServices({super.key ,required this.nameAsset,required this.nameServices});
  String nameAsset;
  String nameServices;

  @override
  State<ContainerServices> createState() => _ContainerServicesState();
}

class _ContainerServicesState extends State<ContainerServices> {
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
            Image.asset(widget.nameAsset),
            Text(
           widget.nameServices,
              style: TextStyle(color: themColor),
            )
          ],
        ),
      ),
    );
  }
}
