import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/pages/get_started.dart';
import 'package:quickshop/provider/auth_provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width * 0.7;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Container(
              padding: const EdgeInsets.only(top: 25),
              height: 50,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ap.userModeldb.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            accountEmail: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ap.userModeldb.email),
              ],
            ),
            currentAccountPictureSize: Size(width, 80),
            currentAccountPicture: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(ap.userModeldb.profilePic),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            onTap: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetStarted(),
                      ),
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
