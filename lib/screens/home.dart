import 'package:alphac19/screens/remote_edu_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alphac19/process/chatbot.dart';
import 'package:alphac19/screens/app.dart';
import 'package:alphac19/screens/Resources.dart';
import 'package:alphac19/screens/crisis_comm_home.dart';
import 'package:flutter/material.dart';
import 'package:alphac19/screens/community_connect.dart';


class HomePage extends StatelessWidget {
  final FirebaseUser user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController pincon=TextEditingController();
  int pincode;

  HomePage({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.home,
        ),
        title:Text(
          'HOME PAGE',
          style:TextStyle(
            fontSize:25.0,
            fontWeight:FontWeight.bold,

          ),
          

        ),
        centerTitle: true,
       actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('LOGOUT'),
               onPressed: () {
              _firebaseAuth.signOut();
              
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => App()));
            },
          ),

       ],
      ),
        body:SingleChildScrollView(
          child:Container(
                //color: Colors.red,
                height:MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.width ,
                child: new Stack(
                  children: <Widget>[
                      Positioned(
                          child:Container(
                            color: Colors.green,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(bottom: 40.0), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    
                                    children: <Widget>[
                                    
                                      Text(
                                    "3. COMMUNITY CO-OPERATION",
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 SizedBox(width:5.0),
                                 Icon(
                                   Icons.favorite ,
                                   color:Colors.red[300],
                                 )
                                   
                                    ],
                                    ),
                                ),
                              Padding(
                                padding:const EdgeInsets.only(left:16.0,top:8.0) ,
                                child: Container(
                                  width:MediaQuery.of(context).size.width,
                                  child:Wrap(
                                     direction: Axis.horizontal,
                                     spacing:10.0,
                                     runSpacing:5.0,
                                     children: <Widget>[
                                       Container(
                                            child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                         RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'CONNECT NOW',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){

           showDialog(context: context,builder:(context){
            return AlertDialog(
              backgroundColor: Colors.white,
              title:Text("ENTER YOUR PINCODE",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),
              ),
              content:TextField(
                  controller: pincon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  hintText: 'ENTER PINCODE HERE'
                  ),

                ),
              actions: <Widget>[
                new RaisedButton(
                  child:Text('ENTER'),
                  onPressed: (){
                    
                     Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Community_Connect(key: key,pincode: pincon.text,user: user, ),
            ),
            );
                  },
                ),
              ],
            );
          }
                   
          );


                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         ),
                                         RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'ABOUT',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
         showDialog(context: context,builder:(context){
            return AlertDialog(
              backgroundColor: Colors.white,
              title:Text("CONNECT WITH COMMUNITY",
              style: TextStyle(
                fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),
              ),
              content:Text("Enter Your PinCode and Connect with your Community...\n\nCo-Ordinate and ensure Resources reach the Needy."),
              actions: <Widget>[

              ],
            );
          }
                   
          );


                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         )
                                         ],
                                         ),

                                         ),
                                     ],

                                  ),



                                ),
                              ),
                                                        
                              
                              ],
                            ),   

                          ),

                      ),  


                  Positioned(
                          child:Container(
                            height: 500.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(
                              color:Colors.white,
                              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(75.0),bottomRight:Radius.circular(75.0)),
                            ),
                            padding: const EdgeInsets.only(bottom:34.0), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                    
                                      Text(
                                    "2. REMOTE EDUCATION  ",
                                    style:TextStyle(
                                      color:Colors.indigo,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 Icon(
                                   Icons.library_books,
                                   color:Colors.red[300],
                                 )
                                   
                                    ],
                                    ),
                                  
                                ),
                               

                               
                              Padding(
                                padding:const EdgeInsets.only(left:16.0,top:8.0) ,
                                child: Container(
                                  width:MediaQuery.of(context).size.width,
                                  child:Wrap(
                                     direction: Axis.horizontal,
                                     spacing:10.0,
                                     runSpacing:5.0,
                                     children: <Widget>[
                                       Container(
                                 
                                 child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                        
                                         RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'VIEW RESOURCES',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                             Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>Remote_edu_home(key: key,pincode: pincon.text,user: user,),
                                                          ),
                                                          );
                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         )
                                         ],
                                         ),

                                         ),
                                     ],

                                  ),



                                ),
                              ),
                                                        
                              
                              ],
                            ),   

                          ),

                      ),  

                    


                     Positioned(
                          child:Container(
                            height: 300.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(
                              color:Colors.orangeAccent ,
                              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(75.0),bottomRight:Radius.circular(75.0)),
                            ),
                            padding: const EdgeInsets.only(bottom:34.0), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                 child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                    
                                      Text(
                                    '1.CRISIS COMMUNICATION',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 Icon(
                                   Icons.lightbulb_outline,
                                   color:Colors.white,
                                                                 
                                 )
                                   
                                    ],
                                    ),
                                  
                                ),
                           

                              Padding(
                                padding:const EdgeInsets.only(left:16.0,top:8.0) ,
                                child: Container(
                                  width:MediaQuery.of(context).size.width,
                                  child:Wrap(
                                     direction: Axis.horizontal,
                                     spacing:10.0,
                                     runSpacing:5.0,
                                     children: <Widget>[
                                       Container(
                                        
                                         child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                        
                                         RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'VIEW DETAILS',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                                          Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>Crisis_home(key: key,pincode: pincon.text,user: user,),
                                                          ),
                                                          );

                                           },
                                           shape: RoundedRectangleBorder(
                                             borderRadius:BorderRadius.circular((30.0)),
                                           )
                                         )
                                         ],
                                         ),
                                         ),
                                     ],

                                  ),



                                ),
                              ),
                                                        
                              
                              ],
                            ),   

                          ),

                      ),  



                   Positioned(
                          child:Container(
                            height: 120.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(
                              color:Colors.white,
                              borderRadius:BorderRadius.only(bottomLeft: Radius.circular(75.0),bottomRight:Radius.circular(75.0)),
                            ),
                            padding: const EdgeInsets.only(bottom:34.0), 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child:Text(
                                    'MAIN MENU',
                                    style:TextStyle(
                                      color:Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                
                                                        
                              
                              ],
                            ),   

                          ),

                      ),  

                  ],
                ),
              ),


                        


          ),

    );
      

    
  }
}
