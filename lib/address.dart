import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';
import 'package:foodatize/Shimmer/shimmer.dart';
import 'package:rxdart/rxdart.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  int address_id = 0;
  int activeindex = 0;
  String totalDistance = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.getaddress();
  }

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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Select Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<GetAddressModal>(
                  stream: homebloc.getsAddress.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Select_Address_Shimmer());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          snapshot.data!.newlist.length,
                          (index) => InkWell(
                                onTap: () {
                                  address_id =
                                      snapshot.data!.newlist[index].id!;
                                  log("Address id: " + address_id.toString());
                                  totalDistance = snapshot
                                      .data!.newlist[index].km
                                      .toString();
                                  setState(() {});
                                },
                                child: Add(
                                  currentindex: address_id ==
                                          snapshot.data!.newlist[index].id!
                                      ? 1
                                      : 0,
                                  id: snapshot.data!.newlist[index].id,
                                  user_id:
                                      snapshot.data!.newlist[index].user_id,
                                  longitude:
                                      snapshot.data!.newlist[index].longitude,
                                  latitude:
                                      snapshot.data!.newlist[index].latitude,
                                  km: snapshot.data!.newlist[index].km,
                                  full_address: snapshot
                                      .data!.newlist[index].full_address,
                                  pincode:
                                      snapshot.data!.newlist[index].pincode,
                                  landmark:
                                      snapshot.data!.newlist[index].landmark,
                                  recieving_person: snapshot
                                      .data!.newlist[index].recieving_person,
                                  recieving_person_mobile_number: snapshot
                                      .data!
                                      .newlist[index]
                                      .recieving_person_mobile_number,
                                  created_at:
                                      snapshot.data!.newlist[index].created_at,
                                  updated_at:
                                      snapshot.data!.newlist[index].updated_at,
                                ),
                              )),
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/addaddress');
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '+ Add New Address',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff666666),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(15),
          height: 71,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xff23AF00)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2 Item | Rs. 340',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Delivery charges may apply',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  if (address_id == 0) {
                    Fluttertoast.showToast(msg: "Please Select Address");
                    return;
                  }
                  Navigator.pushNamed(context, '/checkout', arguments: {
                    "address_id": address_id,
                    "km": totalDistance
                  });
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}

class Add extends StatefulWidget {
  Add({
    super.key,
    this.id,
    this.user_id,
    this.longitude,
    this.latitude,
    this.km,
    this.full_address,
    this.landmark,
    this.pincode,
    this.recieving_person,
    this.recieving_person_mobile_number,
    this.created_at,
    this.updated_at,
    this.currentindex = 0,
  });

  int? id;
  int? user_id;
  String? longitude;
  String? latitude;
  dynamic? km;
  String? full_address;
  String? landmark;
  int? pincode;
  String? recieving_person;
  String? recieving_person_mobile_number;
  String? created_at;
  String? updated_at;

  @override
  int currentindex = 0;

  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  bool isLoading = false;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(12),
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: [
              Image(
                  image: AssetImage(
                    'assets/home2.png',
                  ),
                  width: 64,
                  height: 49),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.full_address}',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff4D4D4D),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.landmark}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff565656),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/editaddress",
                                arguments: {
                                  "id": widget.id,
                                  "longitude": widget.longitude,
                                  "latitude": widget.latitude,
                                  "address": widget.full_address,
                                  "landmark": widget.landmark,
                                  "pincode": widget.pincode,
                                  "recieving_person": widget.recieving_person,
                                  "recieving_person_mobile_number":
                                      widget.recieving_person_mobile_number,
                                });
                          },
                          child: Text(
                            'Edit address',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff414341),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            HomeApi callapi = HomeApi();

                            Map data = await callapi.deleteAddress(
                              widget.id,
                            );

                            if (data['status'] == 200) {
                              setState(() {
                                isLoading = false;
                              });
                              homebloc.getaddress();
                              Fluttertoast.showToast(
                                msg: "${data['message']}",
                              );
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              Fluttertoast.showToast(
                                  msg: "${data['error']}",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          child: Text(
                            'Delete Address',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xffFF0000),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 20,
              width: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.currentindex == 0
                    ? Color(0xffE1E1E1)
                    : Color(0xff00C767),
              ),
            ))
      ]),
    );
  }
}
