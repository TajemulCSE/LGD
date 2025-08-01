import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgd/login.dart';
import 'package:lgd/profile_login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String whatsapp = "",
      squad = "",
      email = "",
      password = "",
      confrimpass = "",
      squadleadername = "";
  TextEditingController whatsappcontoller = TextEditingController();
  TextEditingController squadcontoller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();
  TextEditingController confrimpasscontroller = TextEditingController();
  TextEditingController squadleadernamecontroller = TextEditingController();

  //custom snakebar method
  showSnakebar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  //singnup method
  signup() async {
    email = emailcontoller.text.trim();
    password = passwordcontoller.text.trim();
    squad = squadcontoller.text.trim();
    whatsapp = whatsappcontoller.text.trim();
    confrimpass = confrimpasscontroller.text.trim();
    squadleadername = squadleadernamecontroller.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        squad.isEmpty ||
        whatsapp.isEmpty ||
        confrimpass.isEmpty ||
        squadleadername.isEmpty) {
      showSnakebar("Some field is empty");
      return;
    }
    if (password != confrimpass) {
      showSnakebar("Password do not match");
    }

    if (email != "" &&
        password != "" &&
        squad != "" &&
        whatsapp != "" &&
        confrimpass != "" &&
        squadleadername != "") {
      try {
        //create user in firebase auth
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        showSnakebar("Registered Successfully");

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileLogin()),
        );

        String uid = userCredential.user!.uid;

        // add singup data to firebase store
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "email": email,
          "squadname": squad,
          "whatsapp": whatsapp,
          "squadleadername": squadleadername,
          "role": "user",
          "createdAt": FieldValue.serverTimestamp(),
        });
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'email-already-in-use':
            showSnakebar("Email is already registered.");
            break;
          case 'invalid-email':
            showSnakebar("Please enter a valid email address.");
            break;
          case 'weak-password':
            showSnakebar("Password should be at least 6 characters.");
            break;
          case 'operation-not-allowed':
            showSnakebar("Signup is currently disabled. Try again later.");
            break;
          case 'network-request-failed':
            showSnakebar("Check your internet connection.");
            break;
          default:
            showSnakebar("Signup failed: ${e.message}");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"), backgroundColor: Colors.amber),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 62, 139, 11),
              const Color.fromARGB(255, 163, 238, 77),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),

        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "WhatsApp Number:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      controller: whatsappcontoller,
                      decoration: InputDecoration(
                        hintText: "Enter WhatsApp Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Squad Name: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Squad Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: squadcontoller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Squad Leader Name: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Real Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: squadleadernamecontroller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Email: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: emailcontoller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Password: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: passwordcontoller,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Confirm Password: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter password again",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      obscureText: true,
                      controller: confrimpasscontroller,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      signup();
                    },
                    child: Text("SingUp"),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Flexible(child: Text("Already a member? ")),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text("Login", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
