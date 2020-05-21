import 'package:alphac19/screens/donation_comm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class DatabaseServiceVolunteer{
  final String uid;
  final String pincode;
 
  DatabaseServiceVolunteer({this.uid,this.pincode});
//collection reference
final CollectionReference volunteer_Data=Firestore.instance.collection('DONATIONS_DATA');

void updateUsersData(String name,String doornumber,String streetname,String city,String phone,String pincode,String donating_item,String quantity)async{
  return await volunteer_Data.document(uid).setData
  ({
    'Name':name,
    'Door Number':doornumber,
    'Street Name':streetname,
    'City':city,
    'Phone Number':phone,
    'Pin Code':pincode,
    'User ID':uid,
    'Donating Item':donating_item,
    'Quantity':quantity

  });
} 


}
class Donation_Register extends StatelessWidget {
   final FirebaseUser user;
   final String pincode;

String donate_name,donate_door_number,donate_street_name,donate_city,donate_phone,donate_donating_item,donate_quantity;


 

  
  @override
 Donation_Register({Key key,@required this.pincode, @required this.user})
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
          'DONATIONS',
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
              builder: (context) =>Donate(pincode: pincode,user: user,),
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
                    this.donate_name=value;
                  },
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ENTER YOUR NAME'
                  ),
                ),
               
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.donate_door_number=value;
                  },            
                  decoration: InputDecoration(
                  hintText: 'DOOR NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.donate_street_name=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'STREET NAME / AREA NAME',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  onChanged:(value){
                    this.donate_city=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'CITY',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  keyboardType:TextInputType.number,
                  onChanged:(value){
                    this.donate_phone=value;
                  },
                  decoration: InputDecoration(
                  hintText: '(+91) YOUR PHONE NUMBER',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.donate_donating_item=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'WHAT DO YOU WANT TO DONATE',
                  border: OutlineInputBorder(),
                  ), 

                ),
                  TextField(
                  
                  onChanged:(value){
                    this.donate_quantity=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'QUANTITY OF DONATION WITH PROPER UNITS',
                  border: OutlineInputBorder(),
                  ), 

                ),
                   
                
                RaisedButton(
                  child:Text(
                    'DONATE NOW'
                  ),
                  onPressed: (){
                     DatabaseServiceVolunteer(uid:user.uid.toString()).updateUsersData(donate_name,donate_door_number, donate_street_name, donate_city, donate_phone,pincode,donate_donating_item,donate_quantity);
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
              builder: (context) =>Donate(pincode: pincode,user: user,),
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

