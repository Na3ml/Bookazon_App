import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../resources/constants/colors.dart';

class DetailesScreen extends StatelessWidget {
  const DetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
        actions:const [Padding(
          padding:  EdgeInsets.only(right: 20),
          child: Icon(Icons.more_horiz),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 10),
        child: Column(
          children: [
            Image.asset(
              "assets/image/Hotel Card.png",
              // width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const FaIcon(FontAwesomeIcons.heart, color: themColor),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFF8D23),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFF8D23),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFF8D23),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFF8D23),
                    ),
                    Icon(
                      Icons.star,
                      color: const Color(0xFF979797).withOpacity(0.4),
                    ),
                    const Text(
                      "(81) reviews",
                      style: TextStyle(color: Color(0xFF979797)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wifi,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Free Wifi",
                      style: TextStyle(
                          color: Color(0xFF101010), fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    FaIcon(FontAwesomeIcons.mugHot),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Free Breakfast",
                      style: TextStyle(
                          color: Color(0xFF101010), fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                FaIcon(FontAwesomeIcons.chevronDown),
              ],
            ),
            SizedBox(height: 20,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                "The Aston Vill Hotel",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
                Text.rich(TextSpan(children: <InlineSpan>[
                TextSpan(
                  text: '\$200,7',
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                      color: themColor),
                ),
                TextSpan(
                  text: '/night',
                  style: TextStyle(fontSize: 15.sp, color: Color(0xFF878787)),
                )
              ])),
             
              ],
            ),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.locationDot,
                color: Color(0xFF1200E3),
              ),
              SizedBox(width: 10.w,),
              Text(
                "Alice Springs NT 0870, Australia",
                style: TextStyle(fontSize: 15.sp, color: Color(0xFF878787)),
              ),
            ],
          ),
             
            Row(
              children: [
                Text("Description", style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color:Colors.black),),
              ],
            ),
            Text.rich(TextSpan(children: <InlineSpan>[
              TextSpan(
                text:
                    'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming ',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF878787)),
              ),
              TextSpan(
                text: 'Read More. . .',
                style: TextStyle(fontSize: 15.sp, color: themColor),
              )
            ])),
              Row(
              children: [
                Text("Preview",
                 style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color:Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/image/Image.png"),
                Image.asset("assets/image/Image (1).png"),
                Image.asset("assets/image/Image (2).png"),
              ],
            ),
              SizedBox(height: 10,),
            Container(
              height: 55.h,
              width: 330.w,
              child: Center(child: Text("Booking Now")),
              decoration: BoxDecoration(
              color: Color(0xFFFF9200),
                borderRadius: BorderRadius.circular(8)
              ),
            )
          ],
        ),
      ),
    );
  }
}
