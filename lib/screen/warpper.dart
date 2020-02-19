import 'package:tripme/models/user.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'Home.dart';
import 'onbor.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return MyHomePage();
    } else {
    //   return HomePage();
    }
    
  }
}