import 'package:alphac19/screens/Requirements_comm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseServiceVolunteer{
  final String uid;
  final String pincode;
 
  DatabaseServiceVolunteer({this.uid,this.pincode});
//collection reference
final CollectionReference requirement_Data=Firestore.instance.collection('REQUIREMENTS_DATA');

void updateUsersData(String name,String doornumber,String streetname,String city,String phone,String pincode,String requirement)async{
  return await requirement_Data.document(uid).setData
  ({
    'Name':name,
    'Door Number':doornumber,
    'Street Name':streetname,
    'City':city,
    'Phone Number':phone,
    'Pin Code':pincode,
    'User ID':uid,
    'Requirement':requirement,
    

  });
} 


}
class Requirement_Register extends StatelessWidget {
   final FirebaseUser user;
   final String pincode;

String require_name,require_door_number,require_street_name,require_city,require_phone,require_requirement;


 

  
  @override
 Requirement_Register({Key key,@required this.pincode, @required this.user})
      : assert(user != null),
        super(key: key);


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        title:Text(
          'REQUIREMENTS',
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
              builder: (context) =>Requirement(pincode: pincode,user: user,),
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
                    this.require_name=value;
                  },
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ENTER YOUR NAME'
                  ),
                ),
               
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.require_door_number=value;
                  },            
                  decoration: InputDecoration(
                  hintText: 'DOOR NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.require_street_name=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'STREET NAME / AREA NAME',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  onChanged:(value){
                    this.require_city=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'CITY',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.require_phone=value;
                  },
                  decoration: InputDecoration(
                  hintText: '(+91) YOUR PHONE NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.require_requirement=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'ENTER YOUR REQUIREMENT',
                  border: OutlineInputBorder(),
                  ), 

                ),
                     
                
                RaisedButton(
                  child:Text(
                    'POST REQUIREMENT'
                  ),
                  onPressed: (){
                     DatabaseServiceVolunteer(uid:user.uid).updateUsersData(require_name,require_door_number, require_street_name, require_city, require_phone,pincode,require_requirement);
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
              builder: (context) =>Requirement(pincode: pincode,user: user,),
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

