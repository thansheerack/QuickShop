import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Getdata extends StatelessWidget {
  const Getdata({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('categories1').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Text('Loading...');
            }
            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 120,
                      color: Colors.yellowAccent,
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[0]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            snapshot.data!.docs[0]['description'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 80,
                      width: 120,
                      color: const Color.fromARGB(255, 104, 246, 43),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[1]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            snapshot.data!.docs[1]['description'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: 120,
                      color: Colors.yellowAccent,
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[2]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            snapshot.data!.docs[2]['description'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 80,
                      width: 120,
                      color: const Color.fromARGB(255, 104, 246, 43),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.docs[3]['name'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            snapshot.data!.docs[3]['description'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
