import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _key = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_key,
        child: Column(
          children: [
            TextFormField(
              controller: nameCtrl,
              validator : (v){
                if(v== null || v.isEmpty){
                  return "name is empty";
                }
              },
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
            TextFormField(
              controller: ageCtrl,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v){
                if(v== null || v.isEmpty){
                  return "age is empty";
                }
                else if (v.length>3){
                  return "Invalid Input";
                }
              },
              decoration: InputDecoration(
                hintText: "Age",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if(_key.currentState!.validate()){
                showDialog(context: context, builder: (_)
                =>AlertDialog(
                  title: Text("user Info"),
                  content: Column(
                    children: [
                      Text("${nameCtrl.text}"),
                      Text("${ageCtrl.text}"),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    },
                        child: Text("ok")),
                  ],
                ));
                // debugPrint("user name:${nameCtrl.
                // text}age:${ageCtrl.text}");
              }
            }, child: Text("Submit"))
          ],
        ),

      ),
    );
  }
}
