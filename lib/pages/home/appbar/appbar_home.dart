import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/provider/auth_provider.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return ClipPath(
      clipper: WaveClipperTwo(),
      child: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 30, 102, 17),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 35,
              ),
              Text(
                'Choose your current location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 70,
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(ap.userModeldb.profilePic),
              ),
            ),
          );
        }),
      ),
    );
  }
}
