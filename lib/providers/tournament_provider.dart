// providers/tournament_provider.dart
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TournamentProvider with ChangeNotifier {
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String name = "", subtitle = "", squad = "";
  List<String> registeredSquadsName = [];

  int registeredNumber = 0;
  bool loading = true;

  Future<void> fetch10pmTour() async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance
            .collection("tournaments")
            .doc("lgd10pm")
            .get();

    if (userDoc.exists) {
      name = userDoc["name"] ?? "";
      subtitle = userDoc["subtitle"] ?? "";
      registeredNumber = userDoc["registeredNumber"] ?? "";
    }
    loading = false;
    notifyListeners();
  }

  Future<void> registerUser() async{
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String uid = currentUser.uid;

      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .get();

      if (userDoc.exists) {
        squad = userDoc["squadname"] ?? "";
        
      }

      final docRef = _firestore.collection("tournaments").doc("lgd10pm");

       await _firestore.runTransaction((transaction) async {

        final snapshot = await transaction.get(docRef);

      if (!snapshot.exists) {
        throw Exception("Tournament does not exist!");
      }
      int currentRegisteredNumber = snapshot["registeredNumber"] ?? 0;
      List<dynamic> CurrentRegisteredSquadsName = snapshot["registeredSquadsName"] ?? [];
      
    
      CurrentRegisteredSquadsName.add(squad);

      transaction.update(docRef, {
        "registeredSquadsName":CurrentRegisteredSquadsName,
        "registeredNumber":currentRegisteredNumber+1
      });



       });

      

      loading = false;
    notifyListeners();
    }
  }


}
