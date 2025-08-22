import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isLoading => _isLoading;
  String? get error => _error;

  AuthenticationProvider() {
    _auth.authStateChanges().listen((firebaseUser) {
      _user = firebaseUser;
      notifyListeners();
    });
  }

  Future<String?> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    if (email.isEmpty || password.isEmpty) {
      _isLoading = false;
      _error = "Email or Password is missing";
      notifyListeners();
      return _error;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = userCredential.user;

      // Fetch role from Firestore
      if (_user != null) {
        DocumentSnapshot doc =
            await _firestore.collection("users").doc(_user!.uid).get();
        String userRole = doc["role"];

        _isLoading = false;
        notifyListeners();
        return userRole; // return role to navigate accordingly
      }
    } on FirebaseAuthException catch (e) {
      _isLoading = false;

      switch (e.code) {
        case 'user-not-found':
          _error = "No user found with this email.";
          break;
        case 'wrong-password':
          _error = "Incorrect password.";
          break;
        case 'invalid-email':
          _error = "Invalid email address format.";
          break;
        case 'user-disabled':
          _error = "This account has been disabled.";
          break;
        default:
          _error = "Login failed: ${e.message}";
      }

      notifyListeners();
      return _error;
    }
    return null;
  }

  Future<void> logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
