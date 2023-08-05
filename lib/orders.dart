import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';
import 'package:foodatize/Shimmer/shimmer.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.orderHistory();
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
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Orders',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    StreamBuilder<OrderHistoryModal>(
                        stream: homebloc.getOrderHistory.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: Order_Shimmer());
                          return Column(
                              children: List.generate(
                            snapshot.data!.newlist.length,
                            (index) => Order(
                              id: snapshot.data!.newlist[index].id,
                              status: snapshot.data!.newlist[index].status,
                              order_number:
                                  snapshot.data!.newlist[index].order_number,
                              item_count:
                                  snapshot.data!.newlist[index].item_count,
                              final_amount:
                                  snapshot.data!.newlist[index].final_amount,
                            ),
                          ));
                        }),
                    // SizedBox(
                    //   height: 50,
                    // ),
                    // Text(
                    //   'Completed Orders',
                    //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 6,
                    // ),
                    // Container(
                    //   padding:
                    //       EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                    //   height: 119,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Booking Id',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '#FDT199649303',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Items',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '5 Items',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Amount',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             'Rs. 536',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Text(
                    //             'View Details',
                    //             style: TextStyle(
                    //                 color: Color(0xff000000),
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 1,
                    //           ),
                    //           Container(
                    //             height: 1.0,
                    //             width: 90,
                    //             decoration: BoxDecoration(color: Color(0xff000000)),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    // Container(
                    //   padding:
                    //       EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                    //   height: 119,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Booking Id',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '#FDT199649303',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Items',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '5 Items',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Amount',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             'Rs. 536',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Text(
                    //             'View Details',
                    //             style: TextStyle(
                    //                 color: Color(0xff000000),
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 1,
                    //           ),
                    //           Container(
                    //             height: 1.0,
                    //             width: 90,
                    //             decoration: BoxDecoration(color: Color(0xff000000)),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    // Container(
                    //   padding:
                    //       EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
                    //   height: 119,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Booking Id',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '#FDT199649303',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Items',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             '5 Items',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Container(
                    //         height: 1.0,
                    //         width: double.infinity,
                    //         decoration: BoxDecoration(color: Color(0xffF5F5F5)),
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text(
                    //             'Amount',
                    //             style: TextStyle(
                    //                 fontSize: 15, fontWeight: FontWeight.bold),
                    //           ),
                    //           Text(
                    //             'Rs. 536',
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: Color(0xff4E4E4E),
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //         ],
                    //       ),
                    //       Column(
                    //         children: [
                    //           Text(
                    //             'View Details',
                    //             style: TextStyle(
                    //                 color: Color(0xff000000),
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold),
                    //           ),
                    //           SizedBox(
                    //             height: 1,
                    //           ),
                    //           Container(
                    //             height: 1.0,
                    //             width: 90,
                    //             decoration: BoxDecoration(color: Color(0xff000000)),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ]),
            )));
  }
}

class Order extends StatefulWidget {
  Order({
    super.key,
    this.id,
    this.order_number,
    this.item_count,
    this.user_id,
    this.status,
    this.address_id,
    this.gst,
    this.payment_status,
    this.payment_method,
    this.order_time,
    this.transaction_number,
    this.final_amount,
  });
  int? id;
  dynamic order_number;
  dynamic item_count;
  int? user_id;
  String? status;
  int? address_id;
  dynamic gst;
  int? payment_status;
  dynamic payment_method;
  String? created_at;
  String? updated_at;
  dynamic order_time;
  dynamic transaction_number;
  dynamic final_amount;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 10, right: 10),
          height: 139,
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
                    'Status',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.status}',
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
                    'Booking Id',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.order_number}',
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.item_count}',
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
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.final_amount}',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff4E4E4E),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/bookingdetail', arguments: {
                    "id": widget.id,
                    "order_number": widget.order_number,
                  });
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
          height: 20,
        ),
      ],
    );
  }
}
