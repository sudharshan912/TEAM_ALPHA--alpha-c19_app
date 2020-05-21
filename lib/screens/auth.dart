import 'package:alphac19/screens/login.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => new _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.50), BlendMode.dstATop),
          image: AssetImage('assets/images/mountains.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0),
            width:MediaQuery.of(context).size.width,
            height:250.0,
            child: Center(
              child: ImageIcon(
                AssetImage("assets/images/1.png"),
                color: Colors.black,
                size: 250.0,
              ),
            ),
          ),
      
          Container(
            padding: EdgeInsets.only(top: 5.0),
            width:MediaQuery.of(context).size.width,
            height:80.0,
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ALPHA ",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "C-19",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            
      ),
          


new Container(
            width: MediaQuery.of(context).size.width,
            height:200.0,
                      
            
            
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                Container(
                  width:MediaQuery.of(context).size.width,
                  color:Colors.green,
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 30.0, 5.0),
                child:Text(
                    '\nALPHA C-19 IS A MULTI-PURPOSE APP',
                    style: TextStyle(
                       fontSize: 15.0,
                       color:Colors.black,
                       fontWeight: FontWeight.bold   
                    ),
                   ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color:Colors.yellow,
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 30.0, 5.0),
                child:Text(
                    '\nBUILT TO ASSIST PEOPLE DURING  ',
                     style: TextStyle(
                       fontSize: 14.0,
                       fontWeight: FontWeight.bold   
                    ),
                   ),  
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color:Colors.red,
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 30.0, 5.0),
                child:Text(
                    '\nTHE TIMES OF CRISIS...  ',
                     style: TextStyle(
                       fontSize: 14.0,
                       fontWeight: FontWeight.bold   
                    ),
                   ),  
                ),
              ],
              ),
        
            ),
                         
  
          new Container(
            
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              
              children: <Widget>[
                new Expanded(
                  
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.green,
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage())),
                    child: new Container(
                      
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "LOGIN",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
    
  }
}
