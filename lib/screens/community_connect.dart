
import 'package:alphac19/screens/donation_comm.dart';
import 'package:alphac19/screens/Requirements_comm.dart';
import 'package:alphac19/screens/home.dart';
import 'package:alphac19/screens/Volunteer_comm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Community_Connect extends StatelessWidget {
 final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Community_Connect({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null),
        super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    print(pincode);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        
        title:Text(
          'COMMUNITY CONNECT',
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

 body:SingleChildScrollView(
      child:Container(
            height:MediaQuery.of(context).size.height,
            width:MediaQuery.of(context).size.width ,
            child: new Stack(
            children: <Widget>[
               Positioned(
                   child:Container(
                   color: Colors.green[100],
                   height: MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                   padding: const EdgeInsets.only(bottom: 60.0), 
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                             Text(
                                    "3. VOLUNTEER FOR\n     DISTRIBUTION",
                                    style:TextStyle(
                                      color:Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                     spacing:0.0,
                                     runSpacing:5.0,
                                     children: <Widget>[
                                       Container(
                                            child:Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                         RaisedButton(
                                           color:Colors.blue,
                                           child:Text(
                                             'VIEW VOLUNTEERS',
                                              style:TextStyle(
                                                color: Colors.white,
                                              )
                                            ),
                                            onPressed: (){
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Volunteer(key:key,pincode: pincode,user: user,),
            ),
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
                                                  title:Text("VOLUNTEER FOR DISTRIBUTION",
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.blue,
                                                  ),
                                                  ),
                                                  content:Text("# Be A Hero...Ensure Resources Reach the Needy On Time\n\n# VIEW DETAILS OF HEROES TO ASK FOR AID"),
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
                              color:Colors.green[200],
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
                                    "2.REQUIREMENTS",
                                    style:TextStyle(
                                      color:Colors.green,
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
                                             'VIEW NOW',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Requirement(pincode: pincode,user: user,),
            ),
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
              title:Text("POST A REQUIREMENT",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue
              ),
              ),
              content:Text("# View The Essentials Needed by People and Help. \n\n# Post Your Requirements too...IF ANY."),
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
                            height: 300.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: new BoxDecoration(
                              color:Colors.green[300],
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
                                    '1.DONATIONS ',
                                    style:TextStyle(
                                      color:Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                 Icon(
                                   Icons.lightbulb_outline,
                                   color:Colors.green,
                                                                 
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
                                             'VIEW NOW',
                                             style:TextStyle(
                                               color: Colors.white,
                                             )
                                           ),
                                           onPressed: (){
                                                         
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>Donate(pincode: pincode,user: user,),
            ),
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
              title:Text("DONATIONS",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
              ),
              ),
              content:Text("# VIEW WHAT ALL RESOURCES ARE UP FOR DONATION IN YOUR AREA.\n\n# DONATE RESOURCES  "),
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
                                    'PINCODE $pincode',
                                    style:TextStyle(
                                      color:Colors.black,
                                      fontSize: 25.0,
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