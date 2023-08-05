import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
    print(rcvdData);
    homebloc.checkOut(rcvdData["address_id"]);
  }

  @override
  int id = 0;
  bool isLoading = false;
  Widget build(BuildContext context) {
    final Map rcvdData = ModalRoute.of(context)!.settings.arguments as Map;
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
                'Checkout',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
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
              StreamBuilder<CheckoutModal>(
                  stream: homebloc.getcheckout.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    return Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        'Delivery Fee (${rcvdData['km']} Km)',
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
                                    'GST (${snapshot.data!.data!.gst}%)',
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
                                    'Rs. ${snapshot.data!.data!.item_total}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4A4A4A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Rs. ${snapshot.data!.data!.km_price}',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xff4A4A4A),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Rs. ${snapshot.data!.data!.gst_price}',
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
                                'Rs. ${snapshot.data!.data!.to_pay}',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff4A4A4A),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              SizedBox(
                height: 25,
              ),
              Text(
                'Select Payment Method',
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff666666),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<CheckoutModal>(
                  stream: homebloc.getcheckout.stream,
                  builder: (context, snapshot) {
                    return InkWell(
                      onTap: () async {
                        HomeApi callapi = HomeApi();

                        Map data = await callapi
                            .selectPayment(snapshot.data!.data!.order_id);

                        if (data['status'] == 200) {
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pushNamed(context, '/thankyou',
                              arguments: {});
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
                      child: Container(
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
                                      fontSize: 12, color: Color(0xff848484)),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
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
                          'Pay now',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Online Payment via Card / UPI / Gpay / PhonePe',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff848484)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
            ])));
  }
}
