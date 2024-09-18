import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../login/signin.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String fullname = '';
  String email = '';
  String mobilenumber = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  void fetchUserDetails() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Fetch the user's data from Firestore
        DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(currentUser.uid).get();

        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          setState(() {
            fullname = userData['fullName'] ?? 'N/A';
            email = userData['email'] ?? 'N/A';
            mobilenumber = userData['mobileNumber'] ?? 'N/A';
            isLoading = false; // Data fetched successfully
          });
        }
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://www.wallsnapy.com/img_gallery/cute-murugan-png-images-transparent-background-1740348.png'),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: $fullname',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Email: $email',
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey[700]),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Mobile: $mobilenumber',
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                  Get.offAll(() => SignInPage());
                },
                child: Text('Log Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
