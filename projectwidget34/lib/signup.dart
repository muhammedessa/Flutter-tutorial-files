import 'package:flutter/material.dart';
import 'package:projectwidget34/authentication_helper.dart';

import 'home.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
            const SizedBox(height: 80,),
          const Text('Welcome', style: TextStyle(fontSize: 30),),
          const Padding(padding: const EdgeInsets.all(8.0),
            child: SignupForm(),
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
                          Navigator.pop(context);
                        },
                        child: const  Text('Login',
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

class SignupForm extends StatefulWidget{

  const SignupForm({Key? key}):super(key:key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;
  bool _obscureText = false;

  final pass = TextEditingController();

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
            controller: pass,
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
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon((Icons.lock_outline),
              ),
              labelText: 'Confirm Password',
              border: border,
            ),
            validator: (value){
              if(value != pass.text){
                return 'Password not match';
              }
              return null;
            },
          ),
          spacer,
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon((Icons.account_circle),
              ),
              labelText: 'Full name',
              border: border,
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please this field is required';
              }
              return null;
            },
            onSaved: (val){
              name = val;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          spacer,
          ElevatedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  AuthenticationHelper()
                      .signUp(email: email!, password: password!)
                  .then((result){
                    if(result == null){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(
                              builder: (context)=>Home()));
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
              child: const Text('SignUp'))
        ],
      ),
    );
  }
}