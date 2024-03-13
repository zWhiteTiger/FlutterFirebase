import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/controller/firebase_controller.dart';
import 'package:flutter_database/pages/aboutme_page.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  final FireBaseController fireBaseController = Get.put(FireBaseController());
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Set this to false
        title: Text(
          "Product",
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
            icon: Icon(Icons.logout,color: Colors.white,),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hasselblade Store",
                  style: TextStyle(fontSize: 16.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Add new Product",
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: productNameController,
                              decoration: InputDecoration(
                                labelText: "Product Name",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                labelText: "Description",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              controller: priceController,
                              decoration: InputDecoration(
                                labelText: "Price",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              fireBaseController.addProduct(
                                productNameController.text,
                                descriptionController.text,
                                double.parse(priceController.text),
                              );
                              productNameController.clear();
                              descriptionController.clear();
                              priceController.clear();
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black, // Change button color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    5.0), // Adjust border radius
                              ),
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: Colors.white, // Change text color
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // Change button color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Adjust border radius
                    ),
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: Colors.white, // Change text color
                    ),
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: fireBaseController.GetProductList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List productlist = snapshot.data!.docs;
                return Expanded(
                  child: ListView.builder(
                    itemCount: productlist.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = productlist[index];
                      String docID = document.id;
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      return Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ListTile(
                          title: Text(
                            "${data['productname']} \nPrice: ${data['price']} bath",
                          ),
                          subtitle: Text("Description: ${data['description']}"),
                          trailing: IconButton(
                            onPressed: () {
                              productNameController.text = data['productname'];
                              descriptionController.text = data['description'];
                              priceController.text = data['price'].toString();
                              Get.defaultDialog(
                                title: "Edit data",
                                content: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        controller: productNameController,
                                        decoration: InputDecoration(
                                            labelText: "Product name",
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        controller: descriptionController,
                                        decoration: InputDecoration(
                                            labelText: "Description",
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        controller: priceController,
                                        decoration: InputDecoration(
                                            labelText: "Price",
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 500,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              fireBaseController.updateProduct(
                                                docID,
                                                productNameController.text,
                                                descriptionController.text,
                                                double.parse(priceController.text),
                                              );
                                              productNameController.clear();
                                              descriptionController.clear();
                                              priceController.clear();
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black, // สีพื้นหลังของปุ่ม (สีดำ)
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7), // กำหนดขอบเขตของปุ่ม
                                              ),
                                            ),
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: Colors.white, // สีของตัวหนังสือ (สีขาว)
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              fireBaseController.deleteProduct(docID);
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7),
                                              ),
                                            ),
                                            child: Text(
                                              "Delete",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7),
                                              ),
                                            ),
                                            child: Text(
                                              "Close",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.edit,color: Colors.black,),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Text("No data available in firebase");
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _selectedIndex == 0 ? Colors.black : Colors.grey),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page,
                color: _selectedIndex == 1 ? Colors.black : Colors.grey),
            label: "About Me",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          Get.to(() => index == 0 ? ProductPage() : AboutMePage());
        },
      ),
    );
  }
}
