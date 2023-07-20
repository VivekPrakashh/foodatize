import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/api.dart';
import 'package:foodatize/util/userCred.dart';
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
  TextEditingController otp = TextEditingController();

  bool isLoading = false;
  bool isOtpLoading = false;
  String phone = "";
  @override
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
              controller: otp,
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
              onTap: () async {
                if (otp.text.length != 5 || otp.text.contains(" ")) {
                  Fluttertoast.showToast(
                    msg: "Please enter 5 digit OTP",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                  return;
                }

                setState(() {
                  isOtpLoading = true;
                });
                Callapi api = Callapi();
                Map data = await api.checkLoginOtp(
                    otp: otp.text, phone: rcvdData["phone_number"]);
                if (data['status'] == 200) {
                  userCred.addUserId(data["data"][0]["id"].toString());

                  Future.delayed(const Duration(seconds: 0), () {
                    if (rcvdData["user_type"] == "old") {
                      Navigator.pushReplacementNamed(context, "/home");
                    } else {
                      Navigator.pushReplacementNamed(context, "/signup");
                    }
                  });

                  Fluttertoast.showToast(msg: data['massage']);
                } else {
                  Fluttertoast.showToast(msg: data['error']);

                  setState(() {
                    isOtpLoading = false;
                  });
                }
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
