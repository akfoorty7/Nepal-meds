import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For formatting date

class HealthTracker extends StatefulWidget {
  const HealthTracker({super.key});

  @override
  State<HealthTracker> createState() => _HealthTrackerState();
}

class _HealthTrackerState extends State<HealthTracker> {
  TextEditingController bpController = TextEditingController();
  TextEditingController sugarController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Tracker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('BP:', style: TextStyle(fontSize: 18)),
            TextField(
              controller: bpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Sugar:', style: TextStyle(fontSize: 18)),
            TextField(
              controller: sugarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submitData(),
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Expanded(child: _buildHealthDataList()), // Display health data below the button
          ],
        ),
      ),
    );
  }

  // Method to submit data to Firestore
  void _submitData() async {
    String bp = bpController.text.trim();
    String sugar = sugarController.text.trim();

    if (bp.isNotEmpty && sugar.isNotEmpty) {
      try {
        // Save the data to Firestore with the current timestamp
        await _firestore.collection('health').add({
          'bp': bp,
          'sugar': sugar,
          'date': DateTime.now(),
        });

        // Clear the input fields after submitting
        bpController.clear();
        sugarController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data submitted successfully!')),
        );
      } catch (e) {
        print('Error submitting data: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting data')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both fields')),
      );
    }
  }

  // Widget to build the health data list from Firestore
  Widget _buildHealthDataList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('health').orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No health data found.'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            var healthData = snapshot.data!.docs[index];
            var date = (healthData['date'] as Timestamp).toDate();
            var formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(date);

            return Card(
              child: ListTile(
                title: Text('BP: ${healthData['bp']} | Sugar: ${healthData['sugar']}'),
                subtitle: Text('Date: $formattedDate'),
              ),
            );
          },
        );
      },
    );
  }
}
