import 'package:alphac19/process/Donation_register.dart';

import 'package:alphac19/screens/community_connect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
final String pincode;  
final FirebaseUser user;


 Donate({@required this.pincode, @required this.user})
      : assert(user != null);
        





  @override
  _DonateState createState() => _DonateState(pincode: pincode,user:user);
}

class _DonateState extends State<Donate> {
  final String pincode;  
final FirebaseUser user;

bool is_register=false;
 _DonateState({@required this.pincode, @required this.user})
      : assert(user != null);
        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DONATIONS'
        ),
        actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('BACK'),
               onPressed: () {
                       
                     Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Community_Connect(pincode: pincode,user: user, ),
            ),
            );              
             },
          ),

       ],
       
      ),
      body: new StreamBuilder(
        
        stream: Firestore.instance.collection("DONATIONS_DATA").orderBy("Name").snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return new Text('LOADING');

          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot ds=snapshot.data.documents[index];
              if(ds["Pin Code"]==pincode)
              {
              return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height-200.0,
                child:Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
          Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("NAME: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )
          ),
          Text(ds["Name"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),
          Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("DOOR NUMBER: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Door Number"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          ],
          ),
          ),
            Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("STREET NAME: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Street Name"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),

          Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("CITY: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["City"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),
          Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("PHONE NUMBER: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Phone Number"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),
          Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("Pin Code: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Pin Code"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),
            Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("DONATION: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Donating Item"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          ],
          ),
          ),
           Container(
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 5.0),
          child:Row(
          children: <Widget>[
          Text("QUANTITY: ",
          style:TextStyle(
            fontWeight: FontWeight.bold
          )),
          Text(ds["Quantity"],
          style:TextStyle(
            fontWeight: FontWeight.bold
          ))
          ],
          ),
          ),
          Text("\n______________________")
                  ],)
              );
            }
            
             else{
                return Container(
                  color:Colors.red,
                  width:MediaQuery.of(context).size.width
                );
              }
            }
          );
        }
      ),
          floatingActionButton:  RaisedButton(
           child:Text('+ DONATE NOW',
           
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.bold
           )
                
           ),
           color:Colors.amber,
           onPressed: (){
                 Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Donation_Register(pincode: pincode,user: user,),
            ),
            );
           },
            shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
           
           
           
 
           ),
         
         

        );
  }
      
    
  }
