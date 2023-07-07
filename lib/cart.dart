import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

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
              'Cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Products(),
            Products(),
            SizedBox(
              height: 10,
            ),
            Container(
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
        ));
  }
}

class Products extends StatefulWidget {
  const Products({
    super.key,
  });

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chicken Chilli - Boneless',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff4D4D4D),
                        fontWeight: FontWeight.bold),
                  ),
                  Image(
                    height: 18,
                    width: 14,
                    image: AssetImage(
                      'assets/delete 1.png',
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
