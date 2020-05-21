import 'package:alphac19/process/chatbot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alphac19/screens/home.dart';


class Crisis_home extends StatelessWidget {
 final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Crisis_home({Key key, @required this.pincode, @required this.user})
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
          'CRISIS_INFO',
          
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
  height:MediaQuery.of(context).size.height+300.0,
  width:MediaQuery.of(context).size.width,
  child: new Stack(
    children: <Widget>[
                     
                      Positioned(
                          child:Container(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height+300.0,
                            width:MediaQuery.of(context).size.width,
                             child:Column(
                             mainAxisAlignment: MainAxisAlignment.start,

                             children: <Widget>[
                            SizedBox(height: 30.0,),
                               Text("CURRENT CRISIS - COVID-19",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 20.0,
                                       )
                                      ),
                            SizedBox(height: 50.0,),
                             Container(
                            color:Colors.white70, 
                             child:Text("ABOUT THE DISEASE",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                             ),
                             SizedBox(height: 20.0,),
                             
                             Text(" Covid-19 is a disease caused by the new\n Corona Virus that emerged in china in\n December 2019,and is spread all over the World. ",
                                 style:TextStyle(
                                       color:Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                          SizedBox(height: 10.0,),
                             Container(
                            color:Colors.white70, 
                             child:Text("SYMPTOMS",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                             ),
                             SizedBox(height: 5.0,),
                             
                             Text("\n The most Common Symptoms are:\n\n     # FEVER.\n     # DRY COUGH.\n     # TIREDNESS.\n     # BODY ACHES. ",
                                 style:TextStyle(
                                       color:Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                             Text("\n\n The Serious Symptoms are:\n\n     # DIFFICULTY IN BREATHING.\n     # CHEST PAIN/PRESSURE.\n     # LOSS OF SPEECH/MOVEMENT.",
                                 style:TextStyle(
                                       color:Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),

                                      SizedBox(height: 20.0,),
                             Container(
                            color:Colors.white70, 
                             child:Text("PRE-CAUTIONS",
                                 style:TextStyle(
                                       color:Colors.red,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                             ),
                             SizedBox(height: 5.0,),
                             
                             Text("\n  SINCE THE DIEASE IS EASILY \n  COMMUNICABLE:\n\n     # STAY AT HOME.\n     # MAINTAIN SAFE DISTANCE WITH\n         PEOPLE.\n     # WASH HANDS OFTEN.\n     # COVER YOUR COUGH.\n     # WEAR FACE MASKS.\n     # ENSURE YOU WEAR\n                  PERSONNEL \n        PROTECTION EQUIPMENTS. ",
                                 style:TextStyle(
                                       color:Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
                                       )
                                      ),
                               SizedBox(height: 25.0,),
                             RaisedButton(
                                           color:Colors.amber,
                                           child:Text(
                                             'CHAT NOW',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                                           Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>Chatbot(key: key,pincode:pincode,user: user,),
                                                          ),
                                                          );
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),
 
                             Text("   INTERACT WITH OUR CHATBOT FOR\n                MORE INFORMATION ",
                                 style:TextStyle(
                                       color:Colors.black,
                                       fontWeight: FontWeight.bold,
                                       fontSize: 18.0,
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