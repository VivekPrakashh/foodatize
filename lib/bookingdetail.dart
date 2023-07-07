import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Bookingdetails extends StatelessWidget {
  const Bookingdetails({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Details',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Booking ID: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '#FDT199649303 ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff808080),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Items in this order',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff808080),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Items(),
                    Items(),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Bill Details',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff666666),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 211,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Item Total',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Delivery Fee (3.2 Km)',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        height: 1.0,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            color: Color(0xff000000)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'GST (18%)',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rs. 439',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4A4A4A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Rs. 40',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4A4A4A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Rs. 37.94',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4A4A4A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 1.5,
                            color: Color(0xffB4B4B4),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'To Pay',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Rs. 517',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff4A4A4A),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Payment Method Used',
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff666666),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 87,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pay on Delivery',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Cash / PhonePe / Gpay / UPI',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff848484)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image(
                            image: AssetImage(
                              'assets/check.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Container(
            height: 78,
            width: 98,
            child: Image(
              image: AssetImage(
                'assets/home.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Chicken Chilli - Boneless',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff4D4D4D),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    'Rs. 210 /',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2E2E2E),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '12 Pieces',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff616161),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
