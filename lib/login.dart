import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lgd/home_screen.dart';
import 'package:lgd/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController emailcontoller = TextEditingController();
  TextEditingController passwordcontoller = TextEditingController();

  String email = "", password = "";

  showSnakebar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  userLogin() async {
    setState(() {
      email = emailcontoller.text;
      password = passwordcontoller.text;
    });
    if(password.isEmpty || email.isEmpty){
      showSnakebar("Email or Password is missing");
    }

    if (password != "" && email != "") {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()), 
        );
        showSnakebar("Login Successful");
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'user-not-found':
            showSnakebar("No user found with this email.");
            break;
          case 'wrong-password':
            showSnakebar("Incorrect password.");
            break;
          case 'invalid-email':
            showSnakebar("Invalid email address format.");
            break;
          case 'invalid-credential':
            showSnakebar("Invalid email or password.");
            break;
          case 'user-disabled':
            showSnakebar("This account has been disabled.");
            break;
          default:
            showSnakebar("Login failed: ${e.message}");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LGD User Login"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 252, 144, 3),
              const Color.fromARGB(255, 255, 199, 95),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      "assets/photos/LGD_NEW_LOGO_BG_Removed.png",
                    ),
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Email:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your Email address here ",
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      controller: emailcontoller,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "Password:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: Icon(Icons.password),
                      ),
                      controller: passwordcontoller,
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
                      userLogin();
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Flexible(child: Text("Not a member?")),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue),
                    ),
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
