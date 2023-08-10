import 'package:flutter/material.dart';



import '../../widgets/custom_containe_sections_services.dart';
import '../../widgets/public_text_form_field.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Scaffold(
          
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    
                    child: Image.asset("assets/image/Group 138.png")),
                  const SizedBox(
                    height: 32,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Where do you want to \ngo ?",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                 PublicTextFormField(
                  hint: "hint",
                   validator: (value) {
                     
                   },),
             const     SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          color: Color(0xFFF2F2F2),
                          width: 180,
                          child: const Row(
                            children: [
                              Icon(Icons.date_range),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Mon 25 Nov"),
                              SizedBox(
                                width: 25,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                          color: Color(0xFFF2F2F2),
                          width: 180,
                          child: const Row(
                            children: [
                              Icon(Icons.date_range),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Mon 25 Nov"),
                              SizedBox(
                                width: 25,
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 40,
                              ),
                            ],
                          )),
                    ],
                  ),
                const  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 320,
                        child: PublicTextFormField(
                         
                           hint: '',
                            validator: (String? value) {  },
                         
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF1200E3),
                        ),
                      )
                    ],
                  ),
                  const ListTile(
                    leading: Text(
                      "Sections",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    trailing: Text(
                      "See More",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w200,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 102,
                    width: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // assets/images/Rectangle 743.png
                        ContainerServices(
                          nameAsset: "assets/image/Rectangle 743.png",
                          nameServices: "Hotel",
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ContainerServices(
                          nameAsset: "assets/image/Rectangle 744.png",
                          nameServices: "Apartment",
                        ),
                        SizedBox(
                          width: 8,
                        ),
    
                        ContainerServices(
                          nameAsset: "assets/image/Rectangle 745.png",
                          nameServices: "Glamping",
                        ),
                        SizedBox(
                          width: 8,
                        ),
    
                        ContainerServices(
                          nameAsset: "assets/image/Rectangle 746.png",
                          nameServices: "Villa",
                        ),
                      ],
                    ),
                  ),
                  const ListTile(
                    leading: Text(
                      "Offfers",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    trailing: Text(
                      "See More",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w200,
                          fontSize: 16),
                    ),
                  ),
                  // SizedBox(
                  //   // height: 150,
                  //   // width: 340,
                  //   child: Card(
                  //     elevation: 8,
                  //     shadowColor: Colors.white,
                  //     child: Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Material(
                  //         elevation: 0,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: [
                  //          const   Center(
                  //               child:  Column(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.start,
                  //                 children: [
                  //                   Row(
                  //                     // mainAxisAlignment: MainAxisAlignment.end,
                  //                     children: [
                  //                       Text(
                  //                         "Plan your trip",
                  //                         style: TextStyle(
                  //                             color: Colors.black,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 17),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   SizedBox(
                  //                     height: 10,
                  //                   ),
                  //                   Text(
                  //                       "Choose your favourate destination \n     and plan your next excape"),
                  //                   SizedBox(
                  //                     height: 15,
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.only(left: 70.0),
                  //                     child: Text(
                  //                       "Book Now!",
                  //                       style: TextStyle(color: themColor),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Image.asset(
                  //               "assets/image/Rectangle 716 (1).png",
                  //               height: 150,
                  //               width: 115,
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
               
                // const  ListTile(
                //     leading: Text(
                //       "Popular Hotels",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: "Roboto",
                //           fontWeight: FontWeight.bold,
                //           fontSize: 16),
                //     ),
                //     trailing: Text(
                //       "See More",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontFamily: "Roboto",
                //           fontWeight: FontWeight.w200,
                //           fontSize: 16),
                //     ),
                //   ),
    
              // SizedBox(
              //   height: 100,
              //   width: 150,
              //   child: GridView.builder(
                
              //     shrinkWrap: true,
              //     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2
              //   ) , itemBuilder: (context, index) {
              //     return Container(
              //      child: Column(
              //       children: [
              //         Text("Gasteresidenz pelikanviertel"),
              //         FaIcon(FontAwesomeIcons.star)
              //       ],
              //      ),
              //     );
              //   },),
              // )
                ],
              ),
            )),
      ),
    );
  }
}
