import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lgd/login.dart';
import 'package:lgd/profile_login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String whatsapp = "", squad = "", email = "", password = "";
  TextEditingController whatsappcontoller = TextEditingController();
  TextEditingController squadcontoller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();

  signup() async {
    email = emailcontoller.text.trim();
    password = passwordcontoller.text.trim();
    squad = squadcontoller.text.trim();
    whatsapp = whatsappcontoller.text.trim();

    if (email != "" && password != "" && squad != "" && whatsapp != "") {
      setState(() {
        email = emailcontoller.text;
        password = passwordcontoller.text;
        whatsapp = whatsappcontoller.text;
        squad = squadcontoller.text;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Registered Successfully")));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileLogin()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'week-password') {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Password is too weak")));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Email already registered")));
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
                  Text("WhatsApp Number:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      controller: whatsappcontoller,
                      decoration: InputDecoration(
                        hintText: "Enter WhatsApp Number",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Squad Name: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Squad Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      controller: squadcontoller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,)
              ,
              Row(
                children: [
                  Text("Squad Leader Name: ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Real Name",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,)
              ,
              Row(
                children: [
                  Text("Email: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      controller: emailcontoller,
                      
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Password: ",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      controller: passwordcontoller,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Confirm Password: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter password again",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      obscureText: true,
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
              SizedBox(height: 40,),
              Row(
                children: [
                  Flexible(child: Text("Already a member? ")),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
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
