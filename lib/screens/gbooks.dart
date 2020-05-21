import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alphac19/screens/Resources.dart';
import 'package:webview_flutter/webview_flutter.dart';

  class G_books extends StatefulWidget {
   final FirebaseUser user;
   final String pincode; 
  @override
 
   G_books({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null);
    _G_booksState createState() => _G_booksState(key:key,pincode:pincode,user:user);
  }
  
  class _G_booksState extends State<G_books> {
    final FirebaseUser user;
   final String pincode; 
  
  final Completer<WebViewController>_controller= Completer<WebViewController>();
  @override
 
   _G_booksState({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null);

    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
        title: Text(
          'G-BOOKS'
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
        initialUrl: "https://books.google.co.in/",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },

      ),




      );
    }
  }