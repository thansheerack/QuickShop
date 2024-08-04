import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickshop/buttons/custom_button.dart';
import 'package:quickshop/pages/home/bottomnavbar/home_bottomnavbar.dart';
import 'package:quickshop/pages/sign_in/sign_up/sign_up.dart';
import 'package:quickshop/provider/auth_provider.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 175, 231, 142),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: 380,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  image: DecorationImage(
                    image: AssetImage('images/getstart.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 40,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Bring  the  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Store\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 102, 17),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'to  your  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Door',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 102, 17),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const SizedBox(
                width: 290,
                child: Text(
                  'Get your groceries delivered in \nless than 1 hour.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 200,
                child: CutomButton(
                  text: 'Get Started',
                  onPressed: () async {
                    if (ap.isSignedIn == true) {
                      await ap.getDataFromSP().whenComplete(
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeBottomnavbar(),
                              ),
                            ),
                          );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
