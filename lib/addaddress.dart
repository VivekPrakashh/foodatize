import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/util/userCred.dart';
import 'package:geolocator/geolocator.dart';

class Addaddress extends StatefulWidget {
  const Addaddress({super.key});

  @override
  State<Addaddress> createState() => _AddaddressState();
}

class _AddaddressState extends State<Addaddress> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController longitude = TextEditingController();
  TextEditingController latitude = TextEditingController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  getlocation() async {
    longitude.text = userCred.getLng();
    latitude.text = userCred.getLat();

    double td = await calculateDistance(
      lat1: double.parse("23.368038"),
      lon1: double.parse("85.2678378"),
      lat2: double.parse(userCred.getLat()),
      lon2: double.parse(userCred.getLng()),
    );
    totalDistance = td.toStringAsFixed(2);
    print(totalDistance);
    setState(() {});
  }

  String totalDistance = "";

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
                              } else if (longitude.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the longitude",
                                );
                              } else if (latitude.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the latitude",
                                );
                              } else if (pin.text.length != 6 ||
                                  pin.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the correct pin",
                                );
                              } else if (name.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the name",
                                );
                              } else if (phone.text.length != 10 ||
                                  phone.text == "") {
                                Fluttertoast.showToast(
                                  msg: "Please enter the phone number",
                                );
                                return;
                              }
                              setState(() {
                                bool isLoading = true;
                              });
                              HomeApi api = HomeApi();
                              Map data = await api.addAddress(
                                  longitude: longitude.text,
                                  latitude: latitude.text,
                                  full_address: address.text,
                                  landmark: landmark.text,
                                  km: totalDistance,
                                  recieving_person: name.text,
                                  pincode: int.parse(pin.text),
                                  recieving_person_mobile_number: phone.text);
                              if (data['status'] == 200) {
                                setState(() {
                                  bool isLoading = false;
                                });
                                // userCred.addUserId('${data['userId']}');
                                //  userCred.ad('${data['userId']}');
                                Future.delayed(const Duration(seconds: 0), () {
                                  homebloc.getaddress();
                                  Navigator.pop(context);
                                });

                                Fluttertoast.showToast(msg: data['message']);
                              } else {
                                setState(() {
                                  bool isLoading = false;
                                });
                                Fluttertoast.showToast(msg: data['error']);
                                setState(() {
                                  bool isLoading = false;
                                });
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
                                    'Save Address',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          isLoading == true
                              ? Align(
                                  alignment: Alignment.center,
                                  child: const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: Color(0xff23AF00),
                                      strokeWidth: 3,
                                    ),
                                  ),
                                )
                              : Container()
                        ])),
              ],
            ),
          ),
        ));
  }
}

double calculateDistance({lat1, lon1, lat2, lon2}) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
