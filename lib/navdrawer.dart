import 'package:flutter/material.dart';

import 'controller/login_controller.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 102, 51, 6),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('/assets/bg3.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Bem vindo'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Usuario'),
            onTap: (){
              Navigator.pushNamed(
                      context,
                      'usuario',
                    );
            },
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Sobre'),
            onTap: (){
              Navigator.pushNamed(
                      context,
                      'sobre',
                    );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){
              LoginController().logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}
