import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lgd/home_screen.dart';
import 'package:lgd/sign_up.dart';

class Login extends StatefulWidget{
  const Login({super.key});


  @override
  State<Login> createState()=>_Login();
}


class _Login extends State<Login>{

  TextEditingController emailcontoller=TextEditingController();
  TextEditingController passwordcontoller=TextEditingController();

String email="",password="";

userLogin() async{
  setState(() {
      email=emailcontoller.text;
      password=passwordcontoller.text;
    });

  if (password!="" && email!="") {
    
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      
    } on FirebaseAuthException catch (e){
      print("FirebaseAuthException code: ${e.code}");

      if (e.code=='user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is not registered")));
        
      }
      else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong password")));
      }
      else if(e.code=='invalid-credential'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid-credential")));
      }
    }
    
  }




}


@override
  Widget build(BuildContext context) {
    return Scaffold(



        appBar: AppBar(
            title: Text("LGD Login"),backgroundColor: Colors.red,
        ),
        body: 
            Column(
              children: [
                Row(
                  children: [
                    Text("Email:")
                    ,
                    SizedBox(
                      width: 10,
                    ),
                  Expanded(child: TextField(
                    decoration: InputDecoration(hintText: "Enter your Email address here "),
                    controller: emailcontoller,
                  ))
                  ],
                
                ),
                Row(
                  children: [
                    Text("Password:"),
                    SizedBox(width: 10,),
                    Expanded(child: TextField(
                      decoration: InputDecoration(hintText: "Enter Password"),
                      controller: passwordcontoller,
                    ))
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed:(){
                      userLogin();
                      print("login button");
                    }, child: Text("Login"))
                  ],
                  
                ),
                Row(
                  children: [
                    Flexible(child: Text("Not a member?")),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text("Sign Up",style: TextStyle(color: Colors.blue),),
                    )
                  ],
                )
                
              ],
            )
          
        
    );
  
}
}