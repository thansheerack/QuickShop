import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 102, 17),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 2),
              color: Colors.white,
              icon: Icon(
                Icons.remove,
                size: 30,
              ),
              onPressed: () {
                // Implement decrement quantity
              },
            ),
          ),
          Container(
            width: 30,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 30, 102, 17),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              padding: EdgeInsets.only(bottom: 2),
              color: Colors.white,
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                // Implement increment quantity
              },
            ),
          ),
        ],
      ),
    );
  }
}
