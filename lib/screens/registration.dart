import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:spectrum_kids/screens/home_screen.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/utility/text_style.dart';
import 'package:spectrum_kids/widgets/my_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  var _phoneController = new MaskedTextController(mask: '000-0000-0000');
  var _accessCodeController =
      new MaskedTextController(mask: '@@@@-@@@@-@@@@-@@@@');

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController _scrollController = ScrollController();

  late AnimationController _controller;
  late Animation _animation;

  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    bool animatevalue = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // _controller.dispose();
    _focusNode.dispose();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _accessCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Enter Your Details',
                      style: TextStyles.h3style,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'First Name',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'First Name is required!';
                          }
                          return null;
                        },
                        controller: _firstNameController,
                        input: TextInputType.text,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Last Name',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Last Name is required!';
                          }
                          return null;
                        },
                        input: TextInputType.text,
                        controller: _lastNameController,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Email',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Email is required!';
                          } else if (!input.contains('@')) {
                            return 'Email is invalid!';
                          }
                          return null;
                        },
                        input: TextInputType.text,
                        controller: _emailController,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Phone',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Phone Number is required!';
                          }
                          return null;
                        },
                        controller: _phoneController,
                        input: TextInputType.phone,
                      ),
                      TextFieldWidget(
                        // focusNode: _focusNode,
                        hint: 'Access Code',
                        validator: (input) {
                          if (input.isEmpty) {
                            return 'Access Code is required!';
                          }
                          return null;
                        },
                        controller: _accessCodeController,
                        input: TextInputType.text,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 20.0),
                        child: Builder(
                          builder: (context) => MyButton(
                            label: 'Register',
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                                print("okay");
                                Get.to(()=>HomeScreen());
                              // }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final TextInputType? input;
  final FocusNode? focusNode;

  TextFieldWidget(
      {this.hint, this.controller, this.validator, this.input, this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: TextFormField(
        focusNode: focusNode,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorBox.primaryColor, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          labelText: hint,
          labelStyle: TextStyle(color: ColorBox.primaryColor),
          hintText: hint,
        ),
        autofocus: false,
        keyboardType: input,
        controller: controller,
        validator: validator,
      ),
    );
  }
}
