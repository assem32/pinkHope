import 'package:breastcancer1/modules/admin.dart';
import 'package:breastcancer1/modules/chats/chat.dart';
import 'package:breastcancer1/modules/image.dart';
import 'package:breastcancer1/modules/register/cubit/cubit.dart';
import 'package:breastcancer1/modules/register/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final doctorNameController = TextEditingController();
  String selectedOption='User';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context,state){
        if(state is RegisterUserSuccessState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ImagePickerPage()),(route) => false,);
        }else if (state is RegisterDoctorSuccessState) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Admin()),(route) => false,);
        }
      },
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: Text('Registration Page'),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter your name',
                            border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your mail',
                            border: OutlineInputBorder()
                        ),
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
                            hintText: 'Enter your password',
                            border: OutlineInputBorder()

                        ),

                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                            labelText: 'Phone',
                            hintText: 'Enter your phone',
                            border: OutlineInputBorder()

                        ),

                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Role',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        value: selectedOption,
                        items: [
                          DropdownMenuItem<String>(
                            value: 'User',
                            child: Text('User'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'Doctor',
                            child: Text('Doctor'),
                          ),
                        ],
                        onChanged: (value) {
                          selectedOption = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Role is required';
                          }
                          return null;
                        },
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: Color(0xffce0058),
                            borderRadius: BorderRadius.circular(26),
                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Process registration data here
                                  RegisterCubit.get(context).userRegister(name: nameController.text,email: emailController.text,password: passwordController.text,phone: phoneController.text,role:selectedOption );
                                }
                              },
                              child: Text('Register',style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}