import 'package:flutter/material.dart';

class SikayetTile extends StatelessWidget {
  final String userName;
  final String message;
  final String phoneNumber;

  SikayetTile({this.userName, @required this.message,@required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {}, child: _SikayetCardFocus(userName, message, phoneNumber,context));
  }

  Widget _SikayetCardFocus(
      String title, String subtitle,String phone, BuildContext context) {
    return Container(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 2, 8, 0),
          child: Stack(
            children: <Widget>[
              Column(
                children: [
                  Text('Akciğer Kanseri Grubu',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
              Divider(thickness: 2,color: Colors.grey.shade300,),
                  Container(
                    child: Text(
                      'Şikayet ettiğiniz kişi:  $title',
                      style: TextStyle(color: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  ListTile(
                    title: Text('Mesaji',textAlign: TextAlign.left,style: TextStyle(
                        color: Colors.black26, fontWeight: FontWeight.w400,fontSize: 13)),
                    subtitle: Text(message,style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold,fontSize: 16)),
                    trailing: Text(phone),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
