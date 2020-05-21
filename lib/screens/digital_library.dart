import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alphac19/screens/Resources.dart';
import 'package:webview_flutter/webview_flutter.dart';

  class Digital_Library extends StatefulWidget {
   final FirebaseUser user;
   final String pincode; 
  @override
 
   Digital_Library({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null);
    _Digital_LibraryState createState() => _Digital_LibraryState(key:key,pincode:pincode,user:user);
  }
  
  class _Digital_LibraryState extends State<Digital_Library> {
    final FirebaseUser user;
   final String pincode; 
  
  final Completer<WebViewController>_controller= Completer<WebViewController>();
  @override
 
   _Digital_LibraryState({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null);

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
        title: Text(
          'Digital Library'
        ),
         actions: <Widget>[
          FlatButton(
              textColor: Colors.white,
              child: Text('BACK'),
               onPressed: () {
               Navigator.push(
             context,
             MaterialPageRoute(
             builder: (context) =>Resources(pincode:pincode,user: user,),
             ),
             );
                  
             },
          ),

       ],
       
      ),
      body:WebView(
        initialUrl: "https://ndl.iitkgp.ac.in/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },

      ),




      );
    }
  }