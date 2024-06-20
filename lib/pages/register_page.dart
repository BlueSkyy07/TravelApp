import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _enterPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _enterPasswordFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  bool _obscurePassword = true;
  bool _obscureEnterPassword = true;
  String? _selectedGender;
  List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _enterPasswordController.dispose();
    _phoneNumberController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _enterPasswordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
    _passwordController.addListener(() => setState(() {}));
    _enterPasswordController.addListener(() => setState(() {}));
    _phoneNumberController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Create account",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: _emailFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: _emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () {
                                    _emailController.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: _passwordFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _passwordFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscurePassword,
                        controller: _passwordController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _enterPasswordFocusNode,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Enter the password',
                          labelText: 'Enter the password',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: _enterPasswordFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureEnterPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: _enterPasswordFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureEnterPassword = !_obscureEnterPassword;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscureEnterPassword,
                        controller: _enterPasswordController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        focusNode: _phoneNumberFocusNode,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: _phoneNumberFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                          suffixIcon: _phoneNumberController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  onPressed: () {
                                    _phoneNumberController.clear();
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ),
                        ),
                        controller: _phoneNumberController,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        value: _selectedGender,
                        items: _genders.map((String gender) {
                          return DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Gender',
                          labelText: 'Gender',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          floatingLabelStyle: TextStyle(color: Colors.blue),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusColor: Colors.blue,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.transgender,
                            color: _phoneNumberFocusNode.hasFocus
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.yellow,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "Đăng ký",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I\'m a member',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          ' Login now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
