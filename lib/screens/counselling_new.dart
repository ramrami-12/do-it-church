import 'package:do_it_church/components/NoticeSnackBar.dart';
import 'package:do_it_church/components/counselling.dart';
import 'package:do_it_church/screens/member_info_detail_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:do_it_church/constants.dart';

void _handleSubmitted(String titleText, String contentText) async {
  await firestore.collection('Counselling').add({
    'title': titleText,
    'contents': contentText,
    'writer': counselling.writer,
    //server
    'date': Timestamp.now(),
  });
}

Counselling counselling = Counselling();
final _auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

class CounsellingAddRoute extends StatefulWidget {
  @override
  _CounsellingAddRouteState createState() => _CounsellingAddRouteState();
}

class _CounsellingAddRouteState extends State<CounsellingAddRoute> {
  final contentTextController = TextEditingController();
  final titleTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void assignCurrentWriter() async {
    final user = _auth.currentUser;
    if (user != null) {
      User loggedInUser = user;
      print(
          'SUCCESS(notice_new_screen): Signed in As:${loggedInUser.phoneNumber}');
      counselling.writer = loggedInUser.phoneNumber;
      print('(counselling_new_screen): Signed User UID:${loggedInUser.uid}');
      QuerySnapshot userData = await FirebaseFirestore.instance
          .collection('Users')
          .where('uid', isEqualTo: loggedInUser.uid)
          .get();
      for (var doc in userData.docs) {
        if (doc.exists) {
          //print('Data:${doc.data()}');
          print('(counselling_new_screen): Signed User Name:${doc["name"]}');
          counselling.writer = doc["name"];
        } else {
          print('noData');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    assignCurrentWriter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('심방내용작성', style: kAppBarTitleTextStyle),
        leading: IconButton(
            icon: Icon(Icons.cancel_outlined),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          TextButton(
              child: Text('완료'),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  _handleSubmitted(
                      titleTextController.text, contentTextController.text);
                  NoticeSnackBar.show(context, '심방내용이 추가 되었습니다.');
                  Navigator.pop(context);
                }
              }),
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '제목은 필수입니다';
                    }
                    return null;
                  },
                  controller: titleTextController,
                  decoration: InputDecoration(
                      hintText: "제목",
                      hintStyle: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '내용은 필수입니다';
                    }
                    return null;
                  },
                  controller: contentTextController,
                  decoration: InputDecoration(hintText: "내용을 입력하세요"),
                  maxLines: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
