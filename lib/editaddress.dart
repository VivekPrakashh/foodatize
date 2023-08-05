import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/util/userCred.dart';

class Editaddress extends StatefulWidget {
  const Editaddress({super.key});

  @override
  State<Editaddress> createState() => _EditaddressState();
}

class _EditaddressState extends State<Editaddress> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController latitude = TextEditingController();

  getData() {
    print("object");
    Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    Future.delayed(Duration(milliseconds: 100), () {
      if (address.text == "") {
        address.text = rcvdData["address"];
        phone.text = rcvdData["recieving_person_mobile_number"];
        landmark.text = rcvdData["landmark"];
        pin.text = rcvdData["pincode"].toString();
        longitude.text = rcvdData["longitude"].toString();
        latitude.text = rcvdData["latitude"].toString();
        name.text = rcvdData["recieving_person"];
        id = rcvdData["id"].toString();
        setState(() {});
      }
    });
  }

  String id = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getData();
    super.didChangeDependencies();
  }

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
                    height: 170,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(29),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Add New Address',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Longitude',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 10),
                                    height: 36,
                                    width: 164,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: TextField(
                                      controller: longitude,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Latitude',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xff848484),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 10),
                                    height: 36,
                                    width: 164,
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: TextField(
                                      controller: latitude,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Enter Full Address',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff848484),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
                                  controller: address,
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Landmark',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff848484),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
                                height: 36,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
                                  controller: landmark,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pincode',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff848484),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
                                height: 36,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
                                  controller: pin,
                                  maxLength: 6,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recieving Person’s Name',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff848484),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
                                height: 36,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
                                  controller: name,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recieving Person’s Mobile Number',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff848484),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 10),
                                height: 36,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
                                  controller: phone,
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          InkWell(
                            onTap: () async {
                              if (address.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the address",
                                );
                                return;
                              } else if (landmark.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the longitude",
                                );
                                 return;
                              } else if (longitude.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the longitude",
                                );
                                 return;
                              } else if (latitude.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the latitude",
                                );
                                 return;
                              } else if (pin.text.length != 6 ||
                                  pin.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the correct pin",
                                );
                                 return;
                              } else if (name.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the name",
                                );
                                 return;
                              } else if (phone.text.length != 10 ||
                                  phone.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the phone number",
                                );
                                return;
                              }
                              HomeApi api = HomeApi();
                              try {
                                Map data = await api.updateAddress(
                                    id: int.parse(id),
                                    longitude: longitude.text,
                                    latitude: latitude.text,
                                    full_address: address.text,
                                    landmark: landmark.text,
                                    recieving_person: name.text,
                                    pincode: int.parse(pin.text),
                                    recieving_person_mobile_number: phone.text);
                                if (data['status'] == 200) {
                                  // userCred.addUserId('${data['userId']}');
                                  //  userCred.ad('${data['userId']}');
                                  Future.delayed(const Duration(seconds: 0),
                                      () {
                                    homebloc.getaddress();
                                    Navigator.pop(context);
                                  });

                                  Fluttertoast.showToast(msg: data['message']);
                                } else {
                                  Fluttertoast.showToast(msg: data['error']);
                                }
                              } catch (e) {
                                log(e.toString());
                              }
                            },
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff23AF00)),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Update',
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
