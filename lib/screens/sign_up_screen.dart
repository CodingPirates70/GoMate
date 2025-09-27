import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gomate/screens/home_screen.dart';
import 'package:gomate/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool get isUsernameValid => _usernameController.text.trim().isNotEmpty;

  bool get isEmailValid {
    final email = _emailController.text;
    return RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
  }

  bool get isPasswordValid {
    final password = _passwordController.text;
    // At least 6 chars, one letter, one number, one special char
    return password.length >= 6 &&
        RegExp(r'[A-Za-z]').hasMatch(password) &&
        RegExp(r'[0-9]').hasMatch(password) &&
        RegExp(r'[!@#\$&*~_.,%^()-]').hasMatch(password);
  }

  bool get isConfirmPasswordValid {
    return _confirmPasswordController.text.isNotEmpty &&
        _confirmPasswordController.text == _passwordController.text &&
        isPasswordValid;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            top: -width * 0.22,
            right: -width * 0.25,
            child: Image.asset(
              'assets/images/ion_earth_top_dark.png',
              height: height / 2,
            ),
          ),
          Positioned(
            bottom: -width / 8,
            left: -width * 0.04,
            child: Image.asset(
              'assets/images/ion_earth_dark.png',
              height: height / 2,
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: EdgeInsets.only(left: 32.0, right: 32.0, bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lets start our',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.08,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Journey together!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.08,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32.0),
                              child: Center(
                                child: SizedBox(
                                  height: height / 8,
                                  child: Image.asset('assets/images/logo_blue.png', fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Username",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFormField(
                              controller: _usernameController,
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Color(0xFF48CAE4),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: isUsernameValid
                                    ? Icon(Icons.check_circle, color: Color(0xFF48CAE4))
                                    : null,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {});
                              },
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a username';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFormField(
                              controller: _emailController,
                              cursorColor: Color(0xFF48CAE4),
                              style: const TextStyle(color: Colors.black),
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: isEmailValid
                                    ? Icon(Icons.check_circle, color: Color(0xFF48CAE4))
                                    : null,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
                                  return 'Enter a valid email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              cursorColor: Color(0xFF48CAE4),
                              style: const TextStyle(color: Colors.black),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: isPasswordValid
                                    ? Icon(Icons.check_circle, color: Color(0xFF48CAE4))
                                    : null,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                if (!RegExp(r'[A-Za-z]').hasMatch(value) || !RegExp(r'[0-9]').hasMatch(value) || !RegExp(r'[!@#\$&*~_.,%^()-]').hasMatch(value)) {
                                  return 'Password must contain letter, number and special character';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Confirm Password",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              cursorColor: Color(0xFF48CAE4),
                              style: const TextStyle(color: Colors.black),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                suffixIcon: isConfirmPasswordValid
                                    ? Icon(Icons.check_circle, color: Color(0xFF48CAE4))
                                    : null,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF48CAE4), width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                if (!isPasswordValid) {
                                  return 'Password is not valid';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF48CAE4),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    // Handle sign up
                                  }
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an Account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                                  },
                                  child: const Text('Sign in here', style: TextStyle(color: Colors.black),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}