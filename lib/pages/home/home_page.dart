import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickshop/model/product_modeldb.dart';
import 'package:quickshop/pages/home/appbar/appbar_home.dart';
import 'package:quickshop/pages/home/category_list/category_list.dart';
import 'package:quickshop/pages/home/drawer_home.dart';
import 'package:quickshop/pages/shopping_cart/addto_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

FirebaseFirestore db = FirebaseFirestore.instance;

class _HomePageState extends State<HomePage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/grocery1.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            child: AppbarHome(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/grocery1.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.7,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "What's on your\nshopping list today?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: SearchBar(
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        trailing: [
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ],
                        hintText: 'Search',
                        hintStyle: WidgetStateProperty.all(
                          const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const CategoryList(),
            ],
          ),
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
