
import 'package:drawer_menu/models/user_model.dart';
import 'package:drawer_menu/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fishprincipal.dart';

//Wrapper with auth states
class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {    
    final user = Provider.of<User>(context);  

  


    // Return home or login        
    return user == null ? LoginPage() : FishPrincipal();
  }
}