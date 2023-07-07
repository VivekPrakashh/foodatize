import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final defaultPinTheme = PinTheme(
    width: 43,
    height: 42,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      border: Border.all(color: Color(0xff23AF00), width: 0.9),
    ),
  );
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'OTP',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Enter the OTP we’ve sent',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff4A4A4A),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Pinput(
              length: 5,
              defaultPinTheme: defaultPinTheme,
              autofocus: true,
              validator: (s) {
                return null;
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: Color(0xff535353),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Container(
                  height: 1.0,
                  width: 65,
                  decoration: BoxDecoration(color: Color(0xff535353)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/signup');
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
