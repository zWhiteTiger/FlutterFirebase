import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/pages/product_page.dart';
import 'package:get/get.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  int _selectedIndex = 0; // Keep track of the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About me",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  'https://scontent.fbkk6-2.fna.fbcdn.net/v/t39.30808-6/333590393_742889523873200_6015065149518566569_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeFQ9ZsEVEzoC-NyXhiiRd3h4RVfP18VyrPhFV8_XxXKs1kxf8Rdac7477ihLtTonhONS9nWAR0XTmdFto5PGlmP&_nc_ohc=0DfilP4D2x4AX_6BQt3&_nc_ht=scontent.fbkk6-2.fna&cb_e2o_trans=q&oh=00_AfBeXkxzNGx5kJLQFVO_rte6laWoSlSF2Yrn0L9VCZ4g0w&oe=65F4C17B',
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mr.Nattawut Sarika",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.all(16),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Infomation',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Phone: iPhone 12',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email: nattawut.sa@ksu.ac.th',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Field of study: Computer Engineering',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Faculty: Engineer',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'University: Kalasin University',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _selectedIndex == 1 ? Colors.black : Colors.grey),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page,
                color: _selectedIndex == 0 ? Colors.black : Colors.grey),
            label: "About Me",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          // Update the selected index when a tab is tapped
          setState(() {
            _selectedIndex = index;
          });

          // Use Get.to to navigate to different pages based on the index
          switch (index) {
            case 0:
              Get.to(() => ProductPage());
              break;
            case 1:
              Get.to(() => AboutMePage()); // Navigate to the AboutMePage
              break;
          }
        },
      ),
    );
  }
}
