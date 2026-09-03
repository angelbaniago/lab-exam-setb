import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up Screen',
      home: const SignUpScreen(),
    );
  }
}

// StatefulWidget
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Validation variables
  bool nameError = false;
  bool emailError = false;
  bool passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      // SafeArea
      body: SafeArea(
        // ListView
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.purple,
                    Colors.purpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Column(
                children: [
                  // Icon
                  Icon(Icons.person_add_alt_1, color: Colors.white, size: 60),

                  SizedBox(height: 10),

                  // Text
                  Text(
                    'Join Us Today!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    'Create your account to get started.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Full Name TextField
                    TextField(
                      controller: nameController,

                      onChanged: (value) {
                        setState(() {
                          nameError = false;
                        });
                      },

                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.deepPurple,
                        ),

                        border: const OutlineInputBorder(),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: nameError
                                ? Colors.red
                                : Colors.deepPurple.shade200,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: nameError ? Colors.red : Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Email TextField
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                      onChanged: (value) {
                        setState(() {
                          emailError = false;
                        });
                      },

                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.deepPurple,
                        ),

                        border: const OutlineInputBorder(),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: emailError
                                ? Colors.red
                                : Colors.deepPurple.shade200,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: emailError ? Colors.red : Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Password TextField
                    TextField(
                      controller: passwordController,
                      obscureText: true,

                      onChanged: (value) {
                        setState(() {
                          passwordError = false;
                        });
                      },

                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.deepPurple,
                        ),

                        border: const OutlineInputBorder(),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: passwordError
                                ? Colors.red
                                : Colors.deepPurple.shade200,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: passwordError
                                ? Colors.red
                                : Colors.deepPurple,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,

                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Validate Full Name
                            nameError = nameController.text.trim().isEmpty;

                            // Validate Email
                            emailError =
                                emailController.text.trim().isEmpty ||
                                !emailController.text.contains('@');

                            // Validate Password
                            passwordError =
                                passwordController.text.trim().isEmpty ||
                                passwordController.text.length < 6;
                          });

                          // Only print if all fields are valid
                          if (!nameError && !emailError && !passwordError) {
                            print('--- SIGN UP INFORMATION ---');
                            print('Name: ${nameController.text}');
                            print('Email: ${emailController.text}');
                            print('Status: Account Created Successfully');
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                        ),

                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Center(
              child: Text(
                'Gesture Detector',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Gesture Detector
            GestureDetector(
              onTap: () {
                print('--- SINGLE TAP ---');
                print('Hello World!');
              },

              onDoubleTap: () {
                print('--- DOUBLE TAP ---');
                print('Course Code: ITP107');
                print(
                  'Description: To provide students with the skills and knowledge to build cross-platform mobile application using Flutter.',
                );
              },

              onLongPress: () {
                print('--- LONG PRESS ---');
                print('Full Name: Angel B. Baniago');
              },

              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: const Center(
                  child: Text(
                    'Click Me',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Center(
              child: Text(
                'Single Tap • Double Tap • Long Press',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
