import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:alphac19/screens/Resources.dart';


class DatabaseServiceVolunteer{
  final String uid;
  
 
  DatabaseServiceVolunteer({this.uid});
//collection reference
final CollectionReference resource_Data=Firestore.instance.collection('RESOURCE_DATA_CONTRIBUTION');

void updateUsersData(String link,String about)async{
  return await resource_Data.document().setData
  ({'About': about,
    'Link':link,
    

  });
} 


}
class Resource_Register extends StatelessWidget {
  

String link;
String about;


 

final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Resource_Register({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null),
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
          'CONTRIBUTE RESOURCES',
          style:TextStyle(
            fontSize:10.0,
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
                                                            builder: (context) =>Resources(key: key,pincode:pincode,user: user,),
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
                    this.about=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'ABOUT THE RESOURCE',
                  border: OutlineInputBorder(),
                  ), 

                ),
                TextField(
                  
                  onChanged:(value){
                    this.link=value;
                  },
                  decoration: InputDecoration(
                  hintText: 'ENTER URL',
                  border: OutlineInputBorder(),
                  ), 

                ),
                RaisedButton(
                  child:Text(
                    'SUBMIT'
                  ),
                  onPressed: (){
                     DatabaseServiceVolunteer().updateUsersData(link,about);
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
              builder: (context) =>Resources(user:user,pincode:pincode),
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

