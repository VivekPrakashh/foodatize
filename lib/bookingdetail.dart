import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';

class Bookingdetails extends StatefulWidget {
  const Bookingdetails({super.key});

  @override
  State<Bookingdetails> createState() => _BookingdetailsState();
}

class _BookingdetailsState extends State<Bookingdetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData);
    homebloc.getOrderDetail(rcvdData['id']);
  }

  Widget build(BuildContext context) {
    Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
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
              child: StreamBuilder<OrderDetailModal>(
                  stream: homebloc.getDetail.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking Details',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
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
                                rcvdData['order_number'],
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
                          Column(
                              children: List.generate(
                            snapshot.data!.newlist.length,
                            (index) => Items(
                              name: snapshot.data!.newlist[index].name,
                              image: snapshot.data!.newlist[index].image,
                              pieces: snapshot.data!.newlist[index].pieces,
                              price: snapshot.data!.newlist[index].price,
                            ),
                          )),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data!.order_detail!.total_item_price}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xff4A4A4A),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'Rs.${snapshot.data!.order_detail!.km_price}',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color(0xff4A4A4A),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(
                                          'Rs. ${snapshot.data!.order_detail!.gst}',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'To Pay',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Rs. ${snapshot.data!.order_detail!.to_pay}',
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
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Cash / PhonePe / Gpay / UPI',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xff848484)),
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
                        ]);
                  }),
            )));
  }
}

class Items extends StatefulWidget {
  Items({super.key, this.image, this.name, this.pieces, this.price});
  String? name;
  String? pieces;
  String? image;
  dynamic price;

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
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
            child: Image.network(
              '${widget.image}',
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
                '${widget.name}',
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
                    'Rs. ${widget.price} /',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2E2E2E),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.pieces} Pieces',
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
