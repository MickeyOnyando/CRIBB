import 'package:cribb/models/user.dart';
import 'package:cribb/pages/authenticate.dart';
import 'package:cribb/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper ({super.key});

  @override
  Widget build(BuildContext context) {

    final  appUserOne = Provider.of<AppUser?>(context);
    
    if(appUserOne == null){
      return const Authenticate();
    }else{
      return const HomePage();

    }
  }
}