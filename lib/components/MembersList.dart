import 'package:do_it_church/components/customUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ScreenDivider.dart';


class MembersList extends StatelessWidget {
  // const MembersList(this._customUser);
  // final CustomUser _customUser;
  Map<String, dynamic> data =
  {
      "image": "images/pro.jpg",
      "name": "고은미",
      "categories": "교사",
    };




  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: EdgeInsets.symmetric(horizontal: 20),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
            data["image"]), //always add images in directory
        radius: 20,
      ),
      title: Text(
          data["name"],style: TextStyle(fontWeight: FontWeight.bold),),
      //title: Text(_customUser.name),
      //subtitle: Text("${_customUser.birthdate}"),
      subtitle:Text(
          data["categories"]),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
    );

  }
}