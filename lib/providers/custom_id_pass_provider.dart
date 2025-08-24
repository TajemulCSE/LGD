// providers/tournament_provider.dart
import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomIdPassProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String roomID = "", roomPass = "";


  bool isRegistered = false;

  int registeredNumber = 0;
  bool loading = true;

  Future<void> fetchCustomRoomID() async {
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance
            .collection("roomDetails")
            .doc("lgd10pmRoomDetails")
            .get();

    if (userDoc.exists) {
      roomID = userDoc["RoomID"] ?? "";
      roomPass = userDoc["RoomPassword"] ?? "";
      
    }
    loading = false;
    notifyListeners();
  }

 
}
