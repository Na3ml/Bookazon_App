import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../resources/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  final imagePicker = ImagePicker();

  pickedImageFromGallery() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          //  FaIcon(FontAwesomeIcons.circleellipsis),
          IconButton(onPressed: () {}, icon: Icon(Icons.pause_circle))
        ],
      ),
      body: Center(
        child: Column(
          children: [
             Stack(
            clipBehavior: Clip.none,
            // fit: StackFit.expand,
            children: [
              image == null
                  ?const CircleAvatar(
                      radius: 80,
                      child: Text("No Image"),
                    )
                  : CircleAvatar(
                      radius: 80,
                      backgroundImage: Image.file(image!).image,
                    ),
              Positioned(
                bottom: 40,
                right: -10,
                child: GestureDetector(
                  onTap: pickedImageFromGallery,
                  child:const Icon(Icons.camera_alt),
                ),
              ),
             
            ],
          ),
       const   Text("Kezia Ajibastin"),
      const    Text("kezia_ajibastin@domain.com"),
        const  ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
          ),
         const  ListTile(
            leading: Icon(Icons.payment),
            title: Text("Payment"),
          ),const ListTile(
            leading: Icon(Icons.notifications),
            title: Text("notification"),
          ),const ListTile(
            leading: Icon(Icons.security),
            title: Text("security"),
          ),const ListTile(
            leading: Icon(Icons.help),
            title: Text("Help"),
          ), ListTile(
            leading: Icon(Icons.person),
            title: Text("Dark Theme"),
            trailing: CupertinoSwitch(
              onChanged: (value) {
                
              },
              value: false,
              activeColor: themColor,
              // thumbColor: Colors.amber,
              // trackColor: Colors.blue,
            )
          ),
        const  ListTile(
            leading: Icon(Icons.delete),
            title: Text("Delete Account"),
          ) ,const ListTile(
            leading: Icon(Icons.logout,color:  Color(0xFFF75555),),
            title: Text("Logout",style: TextStyle(color: Color(0xFFF75555)),),
          ),
       
          ],
          
          
        ),
      ),
    );
  }
}
