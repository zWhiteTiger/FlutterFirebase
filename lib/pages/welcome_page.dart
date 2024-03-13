import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/pages/login_page.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://th.bing.com/th/id/OIP.6fnNtKpSy1xXyRTP-E5_jAHaD4?rs=1&pid=ImgDetMain"),
            SizedBox(height: 30),
            Text(
              'Mediumn format Camera',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Sign out the current user (if any)
                await FirebaseAuth.instance.signOut();

                // Navigate to the LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0), // กำหนดระยะขอบของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7), // กำหนดขอบเขตของปุ่ม
                ),
                primary: Colors.black, // สีพื้นหลังของปุ่ม (สีดำ)
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Explore our Product',
                  style: TextStyle(
                    color: Colors.white, // สีของตัวหนังสือ (สีขาว)
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
