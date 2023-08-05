import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/homeapi.dart';
import 'package:foodatize/Bloc/homebloc.dart';
import 'package:foodatize/Modal/homemodal.dart';
import 'package:foodatize/util/userCred.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';

import 'Shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homebloc.fetchproduct();
    getlocation();
    homebloc.getToCart();

  }

  getlocation() async {
    Position location = await _determinePosition();
    print(location);
    userCred.addLatLng(lat: location.latitude, lng: location.longitude);
  }

  bool isSearch = false;
  @override
  bool _enabled = true;

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
            actions: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          'assets/user2.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Support',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff4A4A4A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/myaccount');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(
                            'assets/user1.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Account',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff4A4A4A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Home_shimmer(),
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      if (value.length > 1) {
                        homebloc.searchProduct(value);
                        setState(() {
                          isSearch = true;
                        });
                      } else {
                        setState(() {
                          isSearch = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search Menu & dishes from the restaurant...',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                isSearch == true
                    ? StreamBuilder<SearchModal>(
                        stream: homebloc.getSearchProduct.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Home_shimmer();
                          return Column(
                              children: List.generate(
                            snapshot.data!.newlist.length,
                            (index) => Fooditem(
                              id: snapshot.data!.newlist[index].id,
                              name: snapshot.data!.newlist[index].name,
                              image: snapshot.data!.newlist[index].image,
                              pieces: snapshot.data!.newlist[index].pieces,
                              price: snapshot.data!.newlist[index].price,
                              quantity: snapshot.data!.newlist[index].quantity,
                              description:
                                  snapshot.data!.newlist[index].description,
                              status: snapshot.data!.newlist[index].status,
                            ),
                          ));
                        })
                    : StreamBuilder<Product>(
                        stream: homebloc.getProduct.stream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return Home_shimmer();
                          return Column(
                              children: List.generate(
                            snapshot.data!.newlist.length,
                            (index) => Fooditem(
                              id: snapshot.data!.newlist[index].id,
                              name: snapshot.data!.newlist[index].name,
                              image: snapshot.data!.newlist[index].image,
                              pieces: snapshot.data!.newlist[index].pieces,
                              price: snapshot.data!.newlist[index].price,
                              quantity: snapshot.data!.newlist[index].quantity,
                              description:
                                  snapshot.data!.newlist[index].description,
                              status: snapshot.data!.newlist[index].status,
                            ),
                          ));
                        }),
              ],
            ),
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
                        'Extra charges may apply',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    child: Text(
                      'View Cart',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }
        ));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}

class Fooditem extends StatefulWidget {
  Fooditem(
      {super.key,
      this.id,
      this.name,
      this.image,
      this.pieces,
      this.price,
      this.quantity,
      this.description,
      this.status,
      this.created_at,
      this.updated_at});
  int? id;
  String? name;
  String? image;
  String? pieces;
  int? price;
  int? quantity;
  String? description;
  dynamic? status;
  String? created_at;
  String? updated_at;

  @override
  State<Fooditem> createState() => _FooditemState();
}

class _FooditemState extends State<Fooditem> {
  bool isadded = false;
  int count = 1;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    homebloc.getToCart();

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
        child: Row(
          children: [
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.name}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff4D4D4D),
                      fontWeight: FontWeight.bold),
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
                Row(
                  children: [
                    isadded == true
                        ? Container(
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Color(0xff24FF00), width: 1.0),
                                color: Color(0xff24FF00)),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    if (count == 1) {
                                      isadded = false;
                                      setState(() {});
                                    } else {
                                      setState(() {
                                        count = count - 1;
                                      });
                                    }
                                    HomeApi callapi = HomeApi();

                                    Map data = await callapi.substractToCart(
                                        product_id: widget.id.toString(),
                                        mode: "subtract");

                                    if (data['status'] == 200) {
                                      setState(() {
                                        isLoading = false;
                                      });
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
                                      height: 25,
                                      width: 31,
                                      decoration: BoxDecoration(
                                          color: Color(0xff24FF00)),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Icon(
                                            Icons.remove,
                                            size: 15,
                                            color: Colors.black,
                                          ))),
                                ),
                                Container(
                                  height: 25,
                                  width: 26,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text("$count")),
                                ),
                                InkWell(
                                  onTap: () async {
                                    setState(() {
                                      count = count + 1;
                                    });
                                    HomeApi callapi = HomeApi();

                                    Map data = await callapi.addtoCart(
                                        product_id: widget.id.toString());

                                    if (data['status'] == 200) {
                                      setState(() {
                                        isLoading = false;
                                      });
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
                                    height: 25,
                                    width: 31,
                                    decoration:
                                        BoxDecoration(color: Color(0xff24FF00)),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              setState(() {
                                isadded = true;
                              });
                              HomeApi callapi = HomeApi();

                              Map data = await callapi.addtoCart(
                                  product_id: widget.id.toString());

                              if (data['status'] == 200) {
                                setState(() {
                                  isLoading = false;
                                });
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
                              height: 25,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff24FF00), width: 1.0),
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xff24FF00)),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff3F3F3F),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            )),
                            builder: (BuildContext bc) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * .58,
                                padding: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0),
                                  topLeft: Radius.circular(40.0),
                                )),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${widget.name}',
                                          style: TextStyle(
                                            color: Color(0xff4D4D4D),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Image(
                                            image: AssetImage(
                                              'assets/xmark.png',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${widget.description}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                        ),
                                        maxLines: 3,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Column(
                        children: [
                          Text(
                            'View details',
                            style: TextStyle(
                              color: Color(0xff4E4E4E),
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            height: 1.0,
                            width: 62,
                            decoration: BoxDecoration(
                              color: Color(0xff4E4E4E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
