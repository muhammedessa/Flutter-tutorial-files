import 'package:flutter/material.dart';
import 'package:projectwidget34/authentication_helper.dart';
import 'package:projectwidget34/signup.dart';

import 'home.dart';
class Login extends StatelessWidget {
  const Login({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
            const SizedBox(height: 80,),
          const Text('Welcome', style: TextStyle(fontSize: 30),),
          const Padding(padding: const EdgeInsets.all(8.0),
            child: LoginForm(),
          ),
          const SizedBox(height: 18.0,),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const  Text('You have an account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: 12 ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=>const SignUp()));
                        },
                        child: const  Text('Register',
                            style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12
                        ),),
                      ),
                    ],
                  )
                ],
              ),
          ),
        ],
      )
    );
  }
}

class LoginForm extends StatefulWidget{

  const LoginForm({Key? key}):super(key:key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {

    var border = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(9.0))
    );
    var spacer = const SizedBox(height: 20,);

    return Form(
       key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon((Icons.email_outlined),
              ),
              labelText: 'Email',
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please this field is required';
              }
              return null;
            },
            onSaved: (val){
              email = val;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          spacer,
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon((Icons.lock_outline),
              ),
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child:  Icon(
                    _obscureText?Icons.visibility_off:Icons.visibility

                )
              ),
              labelText: 'Password',
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please this field is required';
              }
              return null;
            },
            obscureText: !_obscureText,
            onSaved: (val){
              password = val;
            },
          ),
          spacer,

          ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                  .then((result){
                    if(result == null){
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                              builder: (context)=>const Home()));
                    }else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                          content: Text(result
                            ,style:const  TextStyle(fontSize: 16),)));
                    }
                  } );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9.0))
                ),
              ),
              child: const Text('Login'))
        ],
      ),
    );
  }
}