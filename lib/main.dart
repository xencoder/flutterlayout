import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "JoJo's Business Card",
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key}): super(key:key);
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: MyAppBar("YOYO's Business Card"),
        body:Column(
          children: <Widget>[
                          MyAvatar('assets/yoyo_monkey.png',"Sleeping Expert"),
                          Divider(thickness: 2,),
                          MyContactInfo(
                            contactType:"Phone",
                            contactInfoList:[
                              {"ContactInfo":"121-232-2121","Note":"Home"},
                              {"ContactInfo":"121-210-9999","Note":"Mobile"},
                              {"ContactInfo":"000-000-0000","Note":"Work"},
                            ],),
                          Divider(thickness: 2,),
                          MyContactInfo(
                              contactType:"Email",
                              contactInfoList:[
                                {"ContactInfo":"yoyo@gmail.com","Note":""},
                                {"ContactInfo":"cici@gmail.com","Note":""},
                              ],),

        ])
    );
  }

}

class MyAppBar extends StatelessWidget with PreferredSizeWidget{
  final String appBarTitle;
  MyAppBar(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar( 
        title:Center(child:Text(appBarTitle),
       ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}


class MyAvatar extends StatelessWidget{
  final String avatar;
  final String aName;
  MyAvatar(this.avatar,this.aName);
  @override 
  Widget build(BuildContext context){
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Image.asset(avatar),
          Text(aName,style:TextStyle(color: Colors.teal, fontSize:30,letterSpacing: 10,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}


class ContactInfo extends StatelessWidget{
  final String contactInfo;
  final String contactNote;

  ContactInfo(this.contactInfo, this.contactNote);

  @override
  Widget build(BuildContext context){
      return Expanded(
        child: ListTile(
          title: Text(contactInfo),
          subtitle: contactNote!=""?Text(contactNote):null,
          trailing: Icon(Icons.message, color:Theme.of(context).primaryColor),
          )
      );
  }
}

class MyContactInfo extends StatelessWidget{
  final List<Map<String,String>> contactInfoList;
  final String contactType;
  MyContactInfo({this.contactType,this.contactInfoList});

  @override 
  Widget build(BuildContext context){
    return IntrinsicHeight(
      child: ListTile(
        leading: contactType == "Phone"?Icon(Icons.phone, color:Theme.of(context).primaryColor): Icon(Icons.contact_mail, color:Theme.of(context).primaryColor),
        title:Column(children: contactInfoList.map(
            (p)=>ContactInfo(p['ContactInfo'],p['Note'])
            ).toList(),),
      ),
    );
  }
}


