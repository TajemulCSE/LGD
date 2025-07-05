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
  String whatsapp = "", squad = "", email = "", password = "", confrimpass="";
  TextEditingController whatsappcontoller = TextEditingController();
  TextEditingController squadcontoller = TextEditingController();
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();
  TextEditingController confrimpasscontroller=TextEditingController();

   showSnakebar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }


  signup() async {
    email = emailcontoller.text.trim();
    password = passwordcontoller.text.trim();
    squad = squadcontoller.text.trim();
    whatsapp = whatsappcontoller.text.trim();
    confrimpass=confrimpasscontroller.text.trim();

    if(email.isEmpty || password.isEmpty ||squad.isEmpty || whatsapp.isEmpty ||confrimpass.isEmpty){
      showSnakebar("Some field is empty");
      return;
    }
    if(password!=confrimpass){
      showSnakebar("Password do not match");
    }

    if (email != "" && password != "" && squad != "" && whatsapp != "" && confrimpass!="") {

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
