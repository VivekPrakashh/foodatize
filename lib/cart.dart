import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';
import 'package:foodatize/Shimmer/shimmer.dart';

import 'API/homeapi.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.getToCart();
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
              // Cart_shimmer(),
              SizedBox(
                height: 10,
              ),
              Text(
                'Cart',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              StreamBuilder<GetcartModel>(
                  stream: homebloc.getTooCart.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Cart_shimmer();
                    return Column(
                        children: List.generate(
                      snapshot.data!.newlist.length,
                      (index) => Products(
                        id: snapshot.data!.newlist[index].id,
                        name: snapshot.data!.newlist[index].name,
                        image: snapshot.data!.newlist[index].image,
                        pieces: snapshot.data!.newlist[index].pieces,
                        user_id: snapshot.data!.newlist[index].user_id,
                        product_id: snapshot.data!.newlist[index].product_id,
                        price: snapshot.data!.newlist[index].price,
                        quantity: snapshot.data!.newlist[index].quantity,
                        status: snapshot.data!.newlist[index].status,
                      ),
                    ));
                  }),

              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '+ Add more items',
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
        bottomNavigationBar: StreamBuilder<GetcartModel>(
            stream: homebloc.getTooCart.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Container(
                  height: 0,
                );
              return Container(
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
                          '${snapshot.data!.newlist.length} Item | Rs. ${snapshot.data!.amount}',
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
                        if (snapshot.data!.newlist.length == 0) {
                          Fluttertoast.showToast(msg: "Cart is Empty");
                          return;
                        }
                        Navigator.pushNamed(context, '/address');
                      },
                      child: Text(
                        'Proceed to\nCheckout',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

class Products extends StatefulWidget {
  Products(
      {super.key,
      this.id,
      this.user_id,
      this.product_id,
      this.name,
      this.image,
      this.pieces,
      this.price,
      this.quantity,
      this.status,
      this.created_at,
      this.updated_at});
  int? id;
  String? name;
  String? pieces;
  String? image;
  int? user_id;
  int? product_id;
  int? price;
  int? quantity;
  dynamic status;
  String? created_at;
  String? updated_at;

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  bool isLoading = false;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.name}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff4D4D4D),
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () async {
                      HomeApi callapi = HomeApi();

                      Map data = await callapi.deleteToCart(
                        widget.id,
                      );

                      if (data['status'] == 200) {
                        setState(() {
                          isLoading = false;
                        });
                        homebloc.getToCart();
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
                    child: Image(
                      height: 18,
                      width: 14,
                      image: AssetImage(
                        'assets/delete 1.png',
                      ),
                    ),
                  )
                ],
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
              SizedBox(
                height: 2,
              ),
              Text(
                'Quantity - ${widget.quantity}',
                style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff2E2E2E),
                    fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
