import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';

class Accountdetail extends StatefulWidget {
  const Accountdetail({super.key});

  @override
  State<Accountdetail> createState() => _AccountdetailState();
}

class _AccountdetailState extends State<Accountdetail> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  bool changed = false;
  bool _isEnable = false;
  FocusNode focusNode1 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    homebloc.userDetail();
    getdata();
  }

  getdata() {
    homebloc.getUserDetail.listen((value) {
      name.text = value.newlist[0].name!;
      phone.text = value.newlist[0].phone_number!;
      old_phone = value.newlist[0].phone_number!;
      email.text = value.newlist[0].email!;
      setState(() {});
    });
  }

  String old_phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
            titleSpacing: -10,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios)),
            iconTheme: IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Image(
                  image: AssetImage(
                    'assets/XYZ.png',
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Food',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'atize',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'by EP Group',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff4A4A4A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            backgroundColor: Colors.white,
            actions: []),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 80,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage(
                      'assets/spoon.png',
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Account Details',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    changed = true;
                                    _isEnable = true;
                                  });
                                  Future.delayed(Duration(milliseconds: 200),
                                      () {
                                    FocusScope.of(context)
                                        .requestFocus(focusNode1);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: Color(0xff5C5C5C),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 1.0,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Color(0xff5C5C5C),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff616C71),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    focusNode: focusNode1,
                                    controller: name,
                                    enabled: _isEnable,
                                    style: TextStyle(
                                        color: Color(0xffE9923E),
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Name',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 89,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff616C71),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: phone,
                                    enabled: _isEnable,
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Color(0xffE9923E),
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Phone No.',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: 89,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff616C71),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: TextField(
                                    controller: email,
                                    enabled: _isEnable,
                                    style: TextStyle(
                                        color: Color(0xffE9923E),
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              if (name.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the name",
                                );
                                return;
                              } else if (phone.text.length != 10 ||
                                  phone.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter valid phone number",
                                );
                                return;
                              } else if (email.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the email",
                                );
                              } else if (changed == true) {
                                HomeApi api = HomeApi();
                                try {
                                  Map data = await api.updateDetail(
                                      name: name.text,
                                      email: email.text,
                                      phone_number: phone.text,
                                      phone_number_old: old_phone);

                                  if (data['status'] == 200) {
                                    // userCred.addUserId('${data['userId']}');
                                    //  userCred.ad('${data['userId']}');
                                    Future.delayed(const Duration(seconds: 0),
                                        () {
                                      // homebloc.getaddress();
                                      Navigator.pushNamed(context, '/home');
                                    });

                                    Fluttertoast.showToast(
                                        msg: data['message']);
                                  } else if (data['status'] == 202) {
                                    Navigator.pushNamed(context, '/otp2',
                                        arguments: {
                                          "phone_number_old": phone.text,
                                          "user_type": "old"
                                        });
                                  } else {
                                    Fluttertoast.showToast(msg: data['error']);
                                  }
                                } catch (e) {
                                  log(e.toString());
                                }
                              }
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: changed == true
                                    ? Color(0xff23AF00)
                                    : Color.fromARGB(255, 164, 184, 159),
                              ),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Update Details',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ])),
              ],
            ),
          ),
        ));
  }
}
