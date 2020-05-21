import 'package:alphac19/process/chatbot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alphac19/screens/Resources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alphac19/screens/home.dart';

_launchurl(url) async{

if(await canLaunch(url)){
  await launch(url);
}
else{
  throw 'Could Not Launch $url';
}
}

class Remote_edu_home extends StatelessWidget {
 final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Remote_edu_home({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null),
        super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: Icon(
          Icons.library_books ,
          color: Colors.white,
        ),
        title: Text(
          'RESOURCES',
          
        ),
        centerTitle: true,
         actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('BACK'),
               onPressed: () {
             Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  user:user,
                ),
              ),
              (Route<dynamic> route) => false);

             },
          ),

       ],
       
      ),
  body: SingleChildScrollView(

child:Container(
  height:MediaQuery.of(context).size.height+10.0,
  width:MediaQuery.of(context).size.width,
  child: new Stack(
    children: <Widget>[
                     
                      Positioned(
                          child:Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height+10.0,
                            width:MediaQuery.of(context).size.width,
                             child:Column(
                             mainAxisAlignment: MainAxisAlignment.start,

                             children: <Widget>[
                            SizedBox(height: 30.0,),
                               Text("CATEGORIES",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 20.0,
                                       )
                                      ),
                            SizedBox(height: 50.0,),
                             
                               SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             '    SCHOOLS    ',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/school");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),
 
                               SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'ENGINEERING',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/engineering");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),

                               SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             '  LITERATURE  ',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/literature");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),                                    
                                         
                               SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             '      SCIENCE      ',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/science");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ), 
                                         SizedBox(height: 25.0,),
                                          RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'MANAGEMENT ',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/management");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),
                                          SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             '          L A W          ',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            _launchurl("https://ndl.iitkgp.ac.in/homestudy/law");                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),
                              SizedBox(height: 30.0,),
                               Text("  FOR ADMIN/USER SUGGESTED\n                 RESOURCES: ",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 20.0,
                                       )
                                      ),
                                             RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'CLICK HERE',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                                 Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>Resources(key: key,pincode:pincode,user: user,),
                                                          ),
                                                          );                                                         
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),

                                                           ],
                             
                             ),
                            )
                      ),
    ],                         
  ),
),


  ),







  
 
 
    );
  }
}