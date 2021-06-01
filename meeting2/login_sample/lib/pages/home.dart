import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_sample/pages/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData)
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${snapshot.data?.email ?? '고객'}님 환영합니다.'),
                  TextButton(
                      onPressed: FirebaseAuth.instance.signOut,
                      child: Text('로그 아웃'))
                ],
              ),
            );
          else
            return LoginWidget();
        },
      ),
    );
  }
}
