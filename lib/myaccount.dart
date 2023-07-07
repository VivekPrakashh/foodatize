import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Myaccount extends StatelessWidget {
  const Myaccount({super.key});

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
        body: Stack(
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
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/orders');
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 89,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My Orders',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff616C71),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Current & Completed Orders',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffE9923E),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Image(
                                image: AssetImage(
                                  'assets/cut2.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/accountdetail');
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          height: 89,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Account Details',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff616C71),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Name, Email etc',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff00C1FF),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Image(
                                image: AssetImage(
                                  'assets/cut1.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
          ],
        ));
  }
}
