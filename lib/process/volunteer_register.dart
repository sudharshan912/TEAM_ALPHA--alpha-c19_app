import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alphac19/screens/Volunteer_comm.dart';


class DatabaseServiceVolunteer{
  final String uid;
  final String pincode;
 
  DatabaseServiceVolunteer({this.uid,this.pincode});
//collection reference
final CollectionReference volunteer_Data=Firestore.instance.collection('VOLUNTEER_DATA');

void updateUsersData(String name,String age,String doornumber,String streetname,String city,String phone,String pincode)async{
  return await volunteer_Data.document(uid).setData
  ({
    'Name':name,
    'Age':age,
    'Door Number':doornumber,
    'Street Name':streetname,
    'City':city,
    'Phone Number':phone,
    'Pin Code':pincode,
    'User ID':uid

  });
} 


}
class Volunteer_Register extends StatelessWidget {
   final FirebaseUser user;
   final String pincode;

String volun_name,volun_age,volun_door_number,volun_street_name,volun_city,volun_phone;


 

  
  @override
 Volunteer_Register({Key key,@required this.pincode, @required this.user})
      : assert(user != null),
        super(key: key);

  Widget build(BuildContext context) {
final bool autovalidate=false;

    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        title:Text(
          'VOLUNTEER REGISTER',
          style:TextStyle(
            fontSize:15.0,
            fontWeight:FontWeight.bold,

          ),
          ),
          
        centerTitle: true,
       actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('BACK'),
               onPressed: () {
                   
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Volunteer(pincode: pincode,user: user,),
            ),
            );                  
             },
          ),

       ],
      ), 
      
    body:  SingleChildScrollView(     
         child: Column(
              children: <Widget>[
                TextField(
                  onChanged:(value){
                    this.volun_name=value;
                  },
                   
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ENTER YOUR NAME'
                  ),
                ),
                TextField(
                 
                  onChanged:(value){
                    this.volun_age=value;
                  },                  decoration: InputDecoration(
                  hintText: 'YOUR AGE',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.volun_door_number=value;
                  },                  decoration: InputDecoration(
                  hintText: 'DOOR NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.volun_street_name=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'STREET NAME',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  onChanged:(value){
                    this.volun_city=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'CITY',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.volun_phone=value;
                  },
                  decoration: InputDecoration(
                  hintText: '(+91) YOUR PHONE NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                RaisedButton(
                  child:Text(
                    'Register'
                  ),
                  onPressed: (){
                     DatabaseServiceVolunteer(uid:user.uid).updateUsersData(volun_name, volun_age, volun_door_number, volun_street_name, volun_city, volun_phone,pincode);
                    showDialog(context: context,builder:(context){
            return AlertDialog(
              backgroundColor: Colors.white,
              title:Text("DATA SUBMITTED SUCCESSFULLY...",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),
              ),
              actions: <Widget>[
                new RaisedButton(
                  child:Text('GET BACK TO THE LIST'),
                  onPressed: (){
                    
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Volunteer(pincode: pincode,user: user,),
            ),
            );
                  },
                ),
              ],
            );
          }
                   
          );



                  },
                ),
              ],
          )
          )
    );
  }
}

