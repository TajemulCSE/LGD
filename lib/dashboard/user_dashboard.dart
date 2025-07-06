import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboard();
}

class _UserDashboard extends State<UserDashboard> {

  //custom snakebar method
  showSnakebar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  String whatsapp = "",
      squad = "",
      email = "",
      squadleadername = "";
  bool loading = true;

  @override
  void initState() {
    super.initState();
    userDataFetch();
  }


  Future<void> userDataFetch() async {
    User? currentUser=FirebaseAuth.instance.currentUser;
    if (currentUser!=null) {
      String uid=currentUser.uid;

      DocumentSnapshot userDoc= await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (userDoc.exists) {
        setState(() {
          email=userDoc["email"] ?? "";
          whatsapp=userDoc["whatsapp"] ??"";
          squad=userDoc["squadname"] ??"";
          squadleadername=userDoc["squadleadername"] ?? "";
          loading=false;

        });
      }
      else{
        setState(() {
          loading=false;
          
        });
        showSnakebar("User Data not found");
        

      }
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("User Dashboard")),
    body: loading? Center(child: CircularProgressIndicator(),)
    :
    SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            Text("Email:"), Text("$email")
          ],
          ),
          Row(children: [
            Text("Squad Name:"), Text("$squad")
          ],
          ),
          Row(children: [
            Text("Whatsapp Number:"), Text("$whatsapp")
          ],
          ),
          Row(children: [
            Text("Squad Leader Name:"), Text("$squadleadername")
          ],
          ),
        ],
      ),
    )
    
    
    
    );
  }
}
