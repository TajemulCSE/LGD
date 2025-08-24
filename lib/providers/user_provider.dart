import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String whatsapp = "",
      squad = "",
      email = "",
      squadLeaderName = "",
      role = "";
  bool loading = true;

  Future<void> fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String uid = currentUser.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();

      if (userDoc.exists) {
        email = userDoc["email"] ?? "";
        whatsapp = userDoc["whatsapp"] ?? "";
        squad = userDoc["squadname"] ?? "";
        squadLeaderName = userDoc["squadleadername"] ?? "";
        role = userDoc["role"] ?? "";
      }
    }
    loading = false;
    notifyListeners();
  }

  Future<void> clearUser() async{
      whatsapp = "";
      squad = "";
      email = "";
      squadLeaderName = "";
      role = "";
      notifyListeners();

  }

}
