import 'package:do_it_church/components/MemberCategory.dart';
import 'package:do_it_church/components/MembersList.dart';
import 'package:do_it_church/components/MembersListDetail.dart';
import 'package:do_it_church/components/MembersListDetailS.dart';
import 'package:do_it_church/components/NoticeSnackBar.dart';
import 'package:do_it_church/components/ScreenDivider.dart';
import 'package:do_it_church/components/customUser.dart';
import 'package:do_it_church/screens/notice_detail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../constants.dart';
import 'landing_route.dart';

class MemberInfoDetailSRoute extends StatefulWidget {
  const MemberInfoDetailSRoute({Key? key}) : super(key: key);
  @override
  _MemberInfoDetailSRouteState createState() => _MemberInfoDetailSRouteState();
}

class _MemberInfoDetailSRouteState extends State<MemberInfoDetailSRoute> {
  int selectedIndex = 0;
  final List<String> categories = ['전체보기', '교사', '학생'];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('교적관리정보', style: kAppBarTitleTextStyle),
      ),

      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: Color(0xFFF6F8FE),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MembersListDetailS(),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xFFD7D7D7)
                    )
                ),
                height: 40,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Color(0xFFF6F8FE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text('생년월일')),
                        ],
                      ),
                    ),
                    Text(' 2012.12.24', style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xFFD7D7D7)
                    )
                ),
                height: 40,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Color(0xFFF6F8FE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text('등록일')),
                        ],
                      ),
                    ),
                    Text(' 2019.09.13', style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xFFD7D7D7)
                    )
                ),
                height: 40,
                width: 350,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 100,
                      color: Color(0xFFF6F8FE),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text('담당반')),
                        ],
                      ),
                    ),
                    Text(' 사랑반', style: TextStyle(color: Colors.black),)
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
              ScreenDivider(color: Color(0xFFD7D7D7), thickness: 1),
              Container(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    color: Color(0xFFF6F8FE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('주소')),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFD7D7D7)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(' 경기도 수원시 팔달구', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    color: Color(0xFFF6F8FE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('가족관계')),
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFD7D7D7)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(' 부: 강시온 집사 / 모: 박하윤 집사 / 형제관계: 외동', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    color: Color(0xFFF6F8FE),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text('특이사항')),
                      ],
                    ),
                  ),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFFD7D7D7)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(' 천식을 앓고 있음', style: TextStyle(
                            color: Colors.black
                        ),),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}