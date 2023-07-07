import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Addaddress extends StatelessWidget {
  const Addaddress({super.key});

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
                                    vertical: 7, horizontal: 10),
                                height: 73,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.white),
                                child: TextField(
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
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
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
                        ])),
              ],
            ),
          ),
        ));
  }
}
