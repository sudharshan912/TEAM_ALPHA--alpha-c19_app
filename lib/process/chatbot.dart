
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:watson_assistant_v2/watson_assistant_v2.dart';
 
 
 
 class Chatbot extends StatefulWidget {
  final String pincode;  
 final FirebaseUser user;
  
  @override
 
   Chatbot({Key key, @required this.pincode, @required this.user})
      : assert(pincode != null),
      assert(user!=null),
        super(key: key);
 
   @override
   _ChatbotState createState() => _ChatbotState();
 }
 
 class _ChatbotState extends State<Chatbot> {
   String _text;
   WatsonAssistantV2Credential credential = WatsonAssistantV2Credential(
     version: '2020-05-17',
     username: 'apikey',
     apikey: '********************************************',//api key
     assistantID: '*************************************',//assistant id
     url: 'https://www.this is dummy url for safety purpose.com',//assistant url with a /v2 read the readme for any clarifications.
   );
 
   WatsonAssistantApiV2 watsonAssistant;
   WatsonAssistantResponse watsonAssistantResponse;
   WatsonAssistantContext watsonAssistantContext =
       WatsonAssistantContext(context: {});
 
   final myController = TextEditingController();
 
   void _callWatsonAssistant() async {
     watsonAssistantResponse = await watsonAssistant.sendMessage(
         myController.text, watsonAssistantContext);
     setState(() {
       _text = watsonAssistantResponse.resultText;
     });
     watsonAssistantContext = watsonAssistantResponse.context;
     myController.clear();
   }
 
   @override
   void initState() {
     super.initState();
     watsonAssistant =
         WatsonAssistantApiV2(watsonAssistantCredential: credential);
     _callWatsonAssistant();
   }
 
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('WATSON'),
         centerTitle: true,
         actions: <Widget>[
           IconButton(
             icon: Icon(
               Icons.restore,
             ),
             onPressed: () {
               watsonAssistantContext.resetContext();
               setState(() {
                 _text = null;
               });
             },
           )
         ],
       ),
       body: Scaffold(
         backgroundColor: Colors.white,
         body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 24.0),
           child:SingleChildScrollView(
           child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
               TextField(
                 controller: myController,
                 decoration: InputDecoration(
                   hintText: 'YOUR MESSAGE....',
                   contentPadding:
                       EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
                   ),
                   enabledBorder: OutlineInputBorder(
                     borderSide:
                         BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide:
                         BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                     borderRadius: BorderRadius.all(Radius.circular(32.0)),
                   ),
                 ),
               ),
               SizedBox(
                 height: 8.0,
               ),
               Text(
                 _text != null ? '$_text' : 'HI! I am Watson.How can I Help You Today...',
                 style: Theme.of(context).textTheme.headline3,
               ),
               SizedBox(
                 height: 24.0,
               ),
             ],
           ),
           ),
         ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: _callWatsonAssistant,
         child: Icon(Icons.send),
       ),
     );
   }
 
   @override
   void dispose() {
     myController.dispose();
     super.dispose();
   }
 }
