import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lgd/login.dart';
import 'package:lgd/profile_login.dart';

class SignUp extends StatefulWidget{

  @override
  State<SignUp> createState() =>_SignUp();
  
}

class  _SignUp extends State<SignUp>{
      
String whatsapp="",squad="",email="",password="";
TextEditingController whatsappcontoller=TextEditingController();
TextEditingController squadcontoller=TextEditingController();
TextEditingController emailcontoller=TextEditingController();
TextEditingController passwordcontoller=TextEditingController();

signup() async{
  email = emailcontoller.text.trim();
  password = passwordcontoller.text.trim();
  squad = squadcontoller.text.trim();
  whatsapp = whatsappcontoller.text.trim();
  
  if(email!="" && password!="" && squad!="" && whatsapp !="")
  {
    setState(() {
                      email=emailcontoller.text;
                      password=passwordcontoller.text;
                      whatsapp=whatsappcontoller.text;
                      squad=squadcontoller.text;
    });
    try{
      UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registered Successfully")),
        

      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileLogin()));

    } on FirebaseAuthException catch(e){
      if (e.code=='week-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is too weak")));
        
      }
      else if(e.code=='email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already registered")));

      }
    }
  }
}

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("WhatsApp Number:"),
                SizedBox(width: 10,),
                
                Expanded(child: TextField(
                  controller: whatsappcontoller,
                  decoration: InputDecoration(
                    hintText: "Enter WhatsApp Number"
                  ),
                ))
        
              ],
            ),
            Row(
              children: [
                Text("Squad Name: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your Squad Name"
                  ),
                  controller: squadcontoller,
                ))
              ],
            ),
             Row(
              children: [
                Text("Email: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email"
                  ),
                  controller: emailcontoller,
                ))
              ],
            ),
            Row(
              children: [
                Text("Password: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password"
                  ),
                  controller: passwordcontoller,
                ))
              ],
            ),
            Row(
              children: [
                Text("Confirm Password: "),
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your password again"
                  ),
                ))
              ],
            ),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  signup();
                }, child: Text("SingUp"))
              ],
            ),
            Row(
              children: [
                Flexible(child: Text("Already a member? ")),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Text("Login", style: TextStyle(color: Colors.blue),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  
}