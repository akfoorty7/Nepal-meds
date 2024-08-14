import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUp(String email, String password, String fullName, String mobileNumber) async {
    try {
      // Create user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      // Get the user id
      String uid = userCredential.user!.uid;

      // Create a new document for the user in the users collection
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
  Future<String> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
  Future<Map<String, String>> getUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
        return {
          'fullname': doc['fullname'],
          'email': doc['email'],
          'mobilenumber': doc['mobilenumber']
        };
      }
      return {};
    } catch (e) {
      return {};
    }
  }


}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   var isLoading = false.obs;
//
//   Future<String> signUp(String email, String password, String fullname) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(email: email, password: password);
//       return "Success";
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
//   Future<String> signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return "Success";
//     } catch (e) {
//       return e.toString();
//     }
//   }
//
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }
