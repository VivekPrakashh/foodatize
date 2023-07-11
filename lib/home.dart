import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                Container(
                  height: 50,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.shade400,
                    //     offset: const Offset(
                    //       5.0,
                    //       5.0,
                    //     ),
                    //     blurRadius: 10.0,
                    //     spreadRadius: 2.0,
                    //   ),
                    // ],
                    color: Colors.white,
                  ),
                  child: TextField(
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
                Fooditem(),
                Fooditem(),
                Fooditem(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
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
                    '1 Item | Rs. 340',
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
        ));
  }
}

class Fooditem extends StatefulWidget {
  const Fooditem({
    super.key,
  });

  @override
  State<Fooditem> createState() => _FooditemState();
}

class _FooditemState extends State<Fooditem> {
  bool isadded = false;
  int count = 1;

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
        child: Row(
          children: [
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chicken Chilli - Boneless',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff4D4D4D),
                      fontWeight: FontWeight.bold),
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
                                  onTap: () {
                                    if (count == 1) {
                                      isadded = false;
                                      setState(() {});
                                    } else {
                                      setState(() {
                                        count = count - 1;
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
                                  onTap: () {
                                    setState(() {
                                      count = count + 1;
                                    });
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
                            onTap: () {
                              setState(() {
                                isadded = true;
                              });
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
                                          'Chicken Chilli - Boneless',
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
                                        'One plate Chicken Chilli Boneless\nwith 12 pcs of chicken hot fried.\nFrshly brewed and Serverd',
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
