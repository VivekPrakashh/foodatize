import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
          titleSpacing: -5,
          automaticallyImplyLeading: false,
          leading: Image(
            image: AssetImage(
              'assets/XYZ.png',
            ),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Login / Signup',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Continue with Mobile Number',
              style: TextStyle(
                color: Color(0xff4A4A4A),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Enter 10 digit mobile number',
              style: TextStyle(
                color: Color(0xff4A4A4A),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 40,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff23AF00), width: 0.9),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/otp');
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xff23AF00)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
