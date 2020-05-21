import 'package:alphac19/screens/remote_edu_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alphac19/screens/wikipedia.dart';
import 'package:alphac19/screens/digital_library.dart';
import 'package:flutter/material.dart';
import 'package:alphac19/screens/gbooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alphac19/screens/home.dart';
import 'package:alphac19/process/resource_register.dart';

_launchurl(url) async{

if(await canLaunch(url)){
  await launch(url);
}
else{
  throw 'Could Not Launch $url';
}
}

class Resources extends StatefulWidget {
  final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Resources({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null),
        super(key: key);
  _ResourcesState createState() => _ResourcesState(key:key,pincode:pincode,user:user);
}

class _ResourcesState extends State<Resources> {
 final FirebaseUser user;
 final String pincode; 
  @override
 
   _ResourcesState({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null);
        

  Widget build(BuildContext context) {
    
       return Scaffold(
      appBar: AppBar(
        title: Text(
          'RESOURCES'
        ),
         actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('BACK'),
               onPressed: () {
             Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>Remote_edu_home(pincode: pincode,user: user,),
                                                          ),
                                                          );
             },
          ),

       ],
       backgroundColor: Colors.amber,
      ),
 
body: new StreamBuilder(
        
        stream: Firestore.instance.collection("RESOURCES_DATA").orderBy("about").snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return new Text('LOADING...');

          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context,index){
              DocumentSnapshot ds=snapshot.data.documents[index];
              return Container(
                decoration: BoxDecoration(
       
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.50), BlendMode.dstATop),
          image: AssetImage('assets/images/scroll.jpg'),
          fit: BoxFit.cover,
        ),
      ),
        
                height: MediaQuery.of(context).size.height-200.0,
                child:Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
          Container(
        
         child:RaisedButton(
           color:Colors.amber,
           child:Text(ds["about"],
           style:TextStyle(
             color:Colors.white,
            fontWeight: FontWeight.bold,             
           ) ,
            ),
           onPressed: (){
             _launchurl(ds["url"]);
           },
         ),

          ),

         
                  ],
                  )
              );
            }
          );
        }
      ),

 
 floatingActionButton:  RaisedButton(
           child:Text('+ CONTRIBUTE RESOURCES',
           
           style:TextStyle(
             color:Colors.white,
             fontWeight: FontWeight.bold
           )
                
           ),
           color:Colors.blue,
           onPressed: (){
                  Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Resource_Register (pincode:pincode,user: user,),
            ),
            );
           },
            shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
           
           
           
 
           ),
         // floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:BottomAppBar(
            
           // shape: CircularNotchedRectangle(),
            color:Colors.amber,
            child:Container(
            width:MediaQuery.of(context).size.width,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child:Text("G-BOOKS"),
                  onPressed: (){
                  _launchurl("https://books.google.co.in/");
                  }
                  ),
                RaisedButton(
                  child:Text("Wikipedia"),
                  onPressed: (){
                             _launchurl("https://www.wikipedia.org/");
                  }
                  ),
                RaisedButton(
                  child:Text("DIGITAL LIBRARY"),
                  onPressed: (){
                            _launchurl("https://ndl.iitkgp.ac.in/");
                  }
                  ),  
              ],
            ),
          ),
          ),
          );
            }
        }