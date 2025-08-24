import 'package:flutter/material.dart';
import 'package:lgd/providers/custom_id_pass_provider.dart';
import 'package:provider/provider.dart';

class CustomRoomIdPass extends StatelessWidget {
  const CustomRoomIdPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Room ID Password"),),

      body: Consumer<CustomIdPassProvider>( builder: (context, custom, child) {
        return SingleChildScrollView(
          child: Column(children: [
            
            Text("ID: ${custom.roomID}"),
            Text("Password: ${custom.roomPass}"),

            ElevatedButton(onPressed: () async{
              await custom.fetchCustomRoomID();
            }, child: Text("Show ID Pass"))
          ],),
        );
      }
        
      ),
    );
  }
}