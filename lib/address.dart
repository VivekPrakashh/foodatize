import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  List data = [
    {
      "name": "Shayam Kunj, 3rd floor,\nJain Road, Near Pani Tanki",
      "subname": "Landmark: Opp. Verma Jewellers...",
    },
    {
      "name": "Shayam Kunj, 3rd floor,\nJain Road, Near Pani Tanki",
      "subname": "Landmark: Opp. Verma Jewellers...",
    },
  ];

  int activeindex = 0;
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
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Select Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, (index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        activeindex = index;
                      });
                    },
                    child: Add(
                      name: data[index]["name"],
                      subname: data[index]["subname"],
                      currentindex: activeindex == index ? 1 : 0,
                    ));
              }),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/addaddress');
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '+ Add New Address',
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
                    '2 Item | Rs. 340',
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
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Text(
                  'Checkout',
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

class Add extends StatelessWidget {
  Add({
    super.key,
    required this.name,
    required this.subname,
    this.currentindex = 0,
  });
  int currentindex = 0;
  String name;
  String subname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(12),
          height: 115,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: [
              Image(
                  image: AssetImage(
                    'assets/home2.png',
                  ),
                  width: 64,
                  height: 49),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff4D4D4D),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$subname',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff565656),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Edit address',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff414341),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Delete Address',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xffFF0000),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 10,
            right: 10,
            child: Container(
              height: 20,
              width: 21,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    currentindex == 0 ? Color(0xffE1E1E1) : Color(0xff00C767),
              ),
            ))
      ]),
    );
  }
}
