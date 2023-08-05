import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foodatize/API/api.dart';
import 'package:pinput/pinput.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phone = TextEditingController();
  bool isLoading = false;
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff23AF00), width: 0.9),
                color: Colors.white,
              ),
              child: TextField(
                controller: phone,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (phone.text.length != 10 || phone.text.contains(" ")) {
                  Fluttertoast.showToast(
                    msg: "Please enter 10 digit mobile number",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                  return;
                }
                setState(() {
                  isLoading = true;
                });
                Callapi callapi = Callapi();

                Map data = await callapi.doLogin(
                  phone: phone.text,
                );

                if (data['status'] == 200) {
                  setState(() {
                    isLoading = false;
                  });
                  Fluttertoast.showToast(
                    msg: "${data['massage']}",
                  );
                  Navigator.pushNamed(context, '/otp', arguments: {
                    "phone_number": phone.text,
                    "user_type": data['user_type']
                  });
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
            ),
            SizedBox(height: 20,),
             isLoading == true
                          ? Align(
                            alignment: Alignment.center,
                            child: const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  color:  Color(0xff23AF00),
                                  strokeWidth: 3,
                                ),
                              ),
                          )
                          : Container()
          ],
        ),
      ),
    );
  }
}

String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
  if (value.length != 10)
    return 'Mobile Number must be of 10 digit';
  else
    return 'null';
}
