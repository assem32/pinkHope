import 'package:breastcancer1/modules/admin.dart';
import 'package:breastcancer1/modules/image.dart';
import 'package:breastcancer1/modules/login/cubit/cubit.dart';
import 'package:breastcancer1/modules/login/cubit/state.dart';
import 'package:breastcancer1/modules/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        // if(state is LoginSuccessState && emailController.text=='assemmob@hotmail.com')
        if(state is LoginDoctorSuccessState)
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Admin()),(route) => false,);
        else if(state is LoginSuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ImagePickerPage()));
        }

      },
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: Text('Login Page'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Text('Don\'t have an account register now'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()),
                          );
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                  Material(
                    color: Color(0xffce0058),
                    borderRadius: BorderRadius.circular(26),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(email: emailController.text,password: passwordController.text,context: context);
                        }
                      },
                      child: Text('Login',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
