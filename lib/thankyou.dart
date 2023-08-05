import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodatize/Shimmer/shimmer.dart';

class Thankyou extends StatelessWidget {
  const Thankyou({super.key});

  @override
  Widget build(BuildContext context) {
    Thankyou_Shimmer();
    return Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
            titleSpacing: -5,
            automaticallyImplyLeading: false,
            leading: Image(
              image: AssetImage(
                'assets/splash3.png',
              ),
              fit: BoxFit.cover,
            ),
            title: Column(
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
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(children: [
                    SizedBox(
                      height: 40,
                    ),
                    Image(
                      image: AssetImage(
                        'assets/healthy.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Thank you',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3F3F3F),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Your order has been placed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 1.0,
                            width: 100,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'We will confirm your order soon, till then',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
                            ),
                          ),
                          Text(
                            'stay hungry stay foolish!',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
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
                      height: 86,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking ID',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff515151),
                            ),
                          ),
                          Text(
                            '#FDT00198989',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff010101),
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
                      height: 86,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Have something to say?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff515151),
                                ),
                              ),
                              Text(
                                'Call the Restaurant now',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2196F3),
                                ),
                              ),
                            ],
                          ),
                          Image(
                            image: AssetImage(
                              'assets/phone.png',
                            ),
                            height: 55,
                            width: 55,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', ModalRoute.withName('/login'));
                      },
                      child: Column(
                        children: [
                          Text(
                            'Back to home',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 1.0,
                            width: 110,
                            decoration: BoxDecoration(color: Color(0xff000000)),
                          )
                        ],
                      ),
                    ),
                  ])),
            ),
          ],
        ));
  }
}
