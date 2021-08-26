import 'package:flutter/material.dart';
import 'package:todoist_clone/colours.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String email;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColour,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ColoredBox(
          color: kDarkColour,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Using ',
                        style: TextStyle(
                          color: Color(0xFFb3b3b3),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.email,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' to sign up.'),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: kRedColour,
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: kRedColour),
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kRedColour, width: 2),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: TextFormField(
                    onChanged: (_) {
                      setState(() {});
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: kRedColour,
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: kRedColour),
                      suffixIcon: IconButton(
                        icon: Icon(
                          !_isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kRedColour, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: _passwordController.text.length == 0 ||
                                _nameController.text.length == 0
                            ? kDarkRedColour
                            : kRedColour),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 12,
                          color: _passwordController.text.length == 0 ||
                                  _nameController.text.length == 0
                              ? Colors.white60
                              : Colors.white,
                        ),
                      ),
                    ),
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
