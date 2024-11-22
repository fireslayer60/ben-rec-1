import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:hack/pages/btmnbr.dart';
import 'package:hack/pages/loginpage.dart';
import 'package:hack/pages/mainpage.dart';



class RegisterPage extends StatelessWidget {
  final TextEditingController emailcont  = TextEditingController();
  final TextEditingController passcont  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        
        body: Stack(
          
          
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/image3.jpg"),fit: BoxFit.fill)),),
            Container(
              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(47),topRight: Radius.circular(47))),
              margin: EdgeInsets.only(top: 300),
              width: MediaQuery.of(context).size.width,
              height: 521,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 60,
                        width: 265,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF435B66),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: emailcont,
                            style: TextStyle(color: Colors.white),
                            
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '   Email',
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(Icons.check, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 15),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 60,
                        width: 265,
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF435B66),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: passcont,
                            style: TextStyle(color: Colors.white),
                            
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '   Password',
                              hintStyle: TextStyle(color: Colors.white),
                              suffixIcon: Icon(Icons.check, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  SizedBox(height: 20),
                  Container(
                      height: 60.0,
                      width: 265,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF4BE0A)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextButton(
                          onPressed: ()  async{
                            await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcont.text, password: passcont.text);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>navbar()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                      height: 20,
                    ),
                    
                    Container(
                      color: Color(0xFF2D4356),
                      child: SizedBox(
                        height: 2,
                        width: 300,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: ()  {
                        
                      },
                      child: Image(
                        image: AssetImage("images/google.png"),
                        height: 40,
                        width: 40,
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}