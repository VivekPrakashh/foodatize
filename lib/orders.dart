import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

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
        body: Padding(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Active Orders',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                height: 119,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0, color: Color(0xff000000))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Id',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '#FDT199649303',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5 Items',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. 536',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/bookingdetail');
                      },
                      child: Column(
                        children: [
                          Text(
                            'View Details',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Container(
                            height: 1.0,
                            width: 90,
                            decoration: BoxDecoration(color: Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Completed Orders',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                height: 119,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Id',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '#FDT199649303',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5 Items',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. 536',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          height: 1.0,
                          width: 90,
                          decoration: BoxDecoration(color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                height: 119,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Id',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '#FDT199649303',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5 Items',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. 536',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          height: 1.0,
                          width: 90,
                          decoration: BoxDecoration(color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                height: 119,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booking Id',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '#FDT199649303',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Items',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '5 Items',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: 1.0,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Amount',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs. 536',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4E4E4E),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'View Details',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Container(
                          height: 1.0,
                          width: 90,
                          decoration: BoxDecoration(color: Color(0xff000000)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ])));
  }
}
