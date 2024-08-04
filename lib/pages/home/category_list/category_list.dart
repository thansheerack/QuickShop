import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quickshop/pages/category_main_page/vegetables/category_vegetables.dart';
import 'package:quickshop/pages/home/getdata.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('categories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Loading...');
        }
        return SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    hoverColor: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CategoryVegetables(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 34, 97, 37),
                              width: 2,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                snapshot.data!.docs[0]['categoryImage'],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width: 100,
                        ),
                        Text(
                          snapshot.data!.docs[0]['name'],
                          style: const TextStyle(
                            height: 2,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CategoryFruits(),
                      //   ),
                      // );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 34, 97, 37),
                              width: 2,
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                snapshot.data!.docs[1]['categoryImage'],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width: 100,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Getdata(),
                              ),
                            );
                          },
                          child: Text(
                            snapshot.data!.docs[1]['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 34, 97, 37),
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                              snapshot.data!.docs[2]['categoryImage'],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Getdata(),
                            ),
                          );
                        },
                        child: Text(
                          snapshot.data!.docs[2]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 34, 97, 37),
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              snapshot.data!.docs[3]['categoryImage'],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Getdata(),
                            ),
                          );
                        },
                        child: Text(
                          snapshot.data!.docs[3]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 34, 97, 37),
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              snapshot.data!.docs[4]['categoryImage'],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Getdata(),
                            ),
                          );
                        },
                        child: Text(
                          snapshot.data!.docs[4]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 34, 97, 37),
                            width: 2,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              snapshot.data!.docs[5]['categoryImage'],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Getdata(),
                            ),
                          );
                        },
                        child: Text(
                          snapshot.data!.docs[5]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
