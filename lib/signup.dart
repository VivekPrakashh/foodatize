import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodatize/API/api.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoading = false;
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
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Just a few details',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Since you’re new we need to know',
              style: TextStyle(
                color: Color(0xff4A4A4A),
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your full name',
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff23AF00), width: 0.9),
                color: Colors.white,
              ),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Your Email Address',
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff23AF00), width: 0.9),
                color: Colors.white,
              ),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (name.text == "") {
                  Fluttertoast.showToast(
                    msg: "Please enter the name",
                  );
                  return;
                } else if (email.text == "") {
                  Fluttertoast.showToast(
                    msg: "Please enter the email",
                  );
                  return;
                }
                setState(() {
                  bool isLoading = true;
                });
                Callapi api = Callapi();
                Map data =
                    await api.saveinfo(name: name.text, email: email.text);
                if (data['status'] == 200) {
                  setState(() {
                    isLoading = false;
                  });
                  // userCred.addUserId('${data['userId']}');
                  //  userCred.ad('${data['userId']}');

                  Future.delayed(const Duration(seconds: 0), () {
                    Navigator.pushReplacementNamed(context, "/home");
                  });

                  Fluttertoast.showToast(msg: data['massage']);
                } else {
                  setState(() {
                    isLoading = false;
                  });
                  Fluttertoast.showToast(msg: data['error']);
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
                      'Signup',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            isLoading == true
                ? Align(
                    alignment: Alignment.center,
                    child: const SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: Color(0xff23AF00),
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
