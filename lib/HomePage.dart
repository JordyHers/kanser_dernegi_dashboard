
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kanser_dernegi_dashboard/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream sikayet;

  getSikayet() async {
    return Firestore.instance
        .collection("Sikayetler")
        .orderBy('username', descending: false)
        .snapshots();
  }


  @override
  void initState() {
   getSikayet().then((val) {
      setState(() {
        sikayet = val;
      });
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text('Sikayet Listesi'),
          centerTitle: true,
        ),
        body:StreamBuilder(
          stream: sikayet,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                itemCount: snapshot.data.documents.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SikayetTile(
                    phoneNumber:snapshot.data.documents[index].data()['phoneNumber'],
                    userName: snapshot.data.documents[index].data()['username'],
                    message: snapshot.data.documents[index].data()["message"],
                  );
                })
                :Center(child: CircularProgressIndicator.adaptive(),);

          },
        ));


  }
}
