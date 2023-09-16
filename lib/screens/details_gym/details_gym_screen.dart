import 'dart:io';

import 'package:fitplus/firebase/fb_auth_controller.dart';
import 'package:fitplus/firebase/fb_firestore.dart';
import 'package:fitplus/src/controller/splash_screens_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DetailsGymScreen extends StatefulWidget {
  DetailsGymScreen({required this.data});

  int select = 1;
  late var data;

  @override
  State<DetailsGymScreen> createState() => _DetailsGymScreenState();
}

class _DetailsGymScreenState extends State<DetailsGymScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Color.fromARGB(255, 210, 199, 226),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 210, 199, 226))),
                      child:     widget.data['logo2'].isEmpty
                          ? Center(child: Image.asset('assets/white.png'))
                          : Center(
                        child: Image.network(
                          widget.data['logo2'],
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Container(
                          height: 100,
                          width: 100,
                          clipBehavior: Clip.antiAlias,
                          margin: EdgeInsetsDirectional.only(start: 15),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                              color: Colors.black),
                          child: Container(
                            height: 95,
                            width: 95,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 210, 199, 226)),
                            child: Image.network(
                              widget.data['logo'],
                              height: 100,
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Color(0xff48358e),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(widget.data['locationGym'])
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Color(0xff48358e),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Discription'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 210, 199, 226)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(widget.data['descriptionGym']),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.select = 1;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                      fontWeight: widget.select == 1
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: widget.select == 1
                                          ? Color(0xff48358e)
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.select = 2;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'offers',
                                  style: TextStyle(
                                      fontWeight: widget.select == 2
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: widget.select == 2
                                          ? Color(0xff48358e)
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.select = 3;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  'Review',
                                  style: TextStyle(
                                      fontWeight: widget.select == 3
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: widget.select == 3
                                          ? Color(0xff48358e)
                                          : Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: widget.select == 1,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Photo GYM'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: widget.data['images'].isEmpty
                                ? Container(
                                    height: 120,
                                    width: 120,
                                    child: Text('Not Any Image For GYM'),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget.data['images'].length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 120,
                                        width: 120,
                                        margin:
                                            EdgeInsetsDirectional.only(end: 10),
                                        child: Image.network(
                                          widget.data['images'][index],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Availabilities'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: widget.data['availableWifi']
                                            ? Colors.green
                                            : Colors.red)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text('Wifi'),
                                    ),
                                    widget.data['availableWifi']
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.dangerous,
                                            color: Colors.red,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        color: widget.data['availableBarking']
                                            ? Colors.green
                                            : Colors.red)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: Text('Barking'),
                                    ),
                                    widget.data['availableBarking']
                                        ? Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.dangerous,
                                            color: Colors.red,
                                          ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text('Working Hours'),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 40,
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.data['workingHours'].length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff48358e)),
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsetsDirectional.only(end: 10),
                                  child: Center(
                                      child: Text(
                                          '${widget.data['workingHours'][index]['name']} ${widget.data['workingHours'][index]['Time']}')),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: widget.select == 2,
                      child: widget.data['offers'].isEmpty
                          ? Container(
                              height: 150,
                          child: Center(child: Text('No offers')),

                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.data['offers'].length,
                              itemBuilder: (context, index) {
                                return Container();
                              },
                            ),
                    ),
                    Visibility(
                      visible: widget.select == 3,
                      child: widget.data['reviews'].isEmpty
                          ? Container(
                              height: 150,
                              child: Center(child: Text('No Review')),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: widget.data['reviews'].length,
                              itemBuilder: (context, index) {
                                return Container();
                              },
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
