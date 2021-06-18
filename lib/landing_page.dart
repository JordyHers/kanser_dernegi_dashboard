import 'package:flutter/material.dart';

import 'HomePage.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  String password;
  String userName;

  Future <void> submit(BuildContext context) async {
    if (passwordController.text == '1234' && userNameController.text == 'Sertan'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }
    else{
       AlertDialog(content: Text('Yanlis parola'),actions: [
        FlatButton(child: Text('Tamam'), onPressed: () => Navigator.of(context).pop(),)
      ],);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(),
                SizedBox(
                  height: 40,
                ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40),
                     child: Container(
                       height: 60,
                       decoration: BoxDecoration(
                           border: Border.all(width: 1, color: Colors.white),
                           borderRadius: BorderRadius.circular(10)),
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(45,15,65,15),
                       child: TextFormField(
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white.withOpacity(0.3),
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: "kullanıcı Adı ",
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.6)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          controller: userNameController,
                          validator: (input) => input.length == null
                              ? "Lütfen adınızı giriniz"
                              : null,
                          onChanged: (value) {
                            userName = userNameController.text;
                            print(userName);
                          }),
                     ),
                   )),
                SizedBox(height: 20,),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(45,15,65,15),
                        child: TextFormField(
                            textInputAction: TextInputAction.done,
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white.withOpacity(0.3),
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: " Parola ",
                              hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            controller: passwordController,
                            validator: (input) => input.length == null
                                ? "Lütfen bir parola giriniz"
                                : null,
                            onChanged: (value) {
                              password = passwordController.text;
                              print(password);
                            }),
                      ),
                    )),
                SizedBox(height: 20,),

                ElevatedButton(onPressed: () => submit(context), child: Text('Girin')),

              ],
            ),
          ),
        )));
  }
}



/// Widget for App logo--------------------------------///
class AppLogo extends StatelessWidget {
  const AppLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 55,
        backgroundImage: AssetImage('assets/images/social-support.jpg'));
  }
}
