import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nepalmeds/UI/home/Health_tracker/health_tracker.dart';
import 'package:nepalmeds/UI/home/News/news.dart';
import 'package:nepalmeds/UI/home/News/newsScreen.dart';
import 'package:nepalmeds/UI/home/medicine/medicine_prices.dart';
import 'package:nepalmeds/UI/login/signin.dart';
import 'package:provider/provider.dart';

import '../../API/registration/AuthService.dart';
import 'Profile/Profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NepalMeds'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildHeader(),
              const SizedBox(height: 20.0),
              SectionCard(
                icon: FontAwesomeIcons.heartbeat,
                title: 'Health Tracker',
                description: 'Easily track and manage your medical conditions and health history.',
                buttonText: 'View Health Tracker',
                onPressed: () {
                 Get.to(HealthTracker());
                },
              ),
              SectionCard(
                icon: FontAwesomeIcons.newspaper,
                title: 'Real-Time News',
                description: 'Stay updated with the latest real-time news.',
                buttonText: 'Read Latest News',
                onPressed: () {
                  Get.to(NewsScreen());
                },
              ),
              SectionCard(
                icon: FontAwesomeIcons.pills,
                title: 'Medication Prices',
                description: 'Compare medication prices and find the best deals.',
                buttonText: 'Compare Prices',
                onPressed: () {
                  Get.to(MedicineListScreen());
                },
              ),

              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlueAccent]),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Welcome to NepalMeds',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Your Comprehensive Health Management Platform',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/section');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: (){
              Get.to(ProfilePage());
            },
              child: Icon(Icons.person)),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.blueAccent,
      onTap: (index) {
        // Handle navigation based on index
      },
    );
  }
}

class SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onPressed;

  const SectionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, size: 40.0, color: Colors.blueAccent),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(description),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   String fullname = '';
//   String email = '';
//   String mobilenumber = '';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserDetails();
//   }
//
//   void fetchUserDetails() async {
//     final authService = Provider.of<AuthService>(context, listen: false);
//     final userDetails = await authService.getUserDetails();
//     setState(() {
//       fullname = userDetails['fullname'] ?? '';
//       email = userDetails['email'] ?? '';
//       mobilenumber = userDetails['mobilenumber'] ?? '';
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/ak47.jpg'),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                 elevation: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Name: $fullname',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Email: $email',
//                         style: TextStyle(fontSize: 18, color: Colors.grey[700]),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Mobile: $mobilenumber',
//                         style: TextStyle(fontSize: 18, color: Colors.grey[700]),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigate to update info page or show a dialog
//                 },
//                 child: Text('Update Info'),
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50), // Set the minimum size for full-width button
//                 ),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () async {
//                   final authService = Provider.of<AuthService>(context, listen: false);
//                   await authService.signOut();
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignInPage()),
//                         (route) => false,
//                   );
//                 },
//                 child: Text('Log Out'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   minimumSize: Size(double.infinity, 50), // Set the minimum size for full-width button
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
