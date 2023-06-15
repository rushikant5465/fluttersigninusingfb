import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttersigninusingfb/utils/themes/theme_mode.dart';
import 'package:fluttersigninusingfb/views/profile/profile.dart';
import 'package:provider/provider.dart';

import '../../utils/authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final provider = Provider.of<SelectedThemeChangeNotifier>(context,
                listen: false);
            provider.changeTheme();
          },
          child: const Icon(Icons.light_mode)),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              color: Colors.orange,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'Login',
                style: const TextTheme().bodyLarge,
              ),
              subtitle: const Text('Hello, you are welcome with us'),
              // titleTextStyle: TextStyle(
              //   fontWeight: FontWeight.bold,
              //   fontSize: 22,
              //   color: Colors.black
              // ),
              // subtitleTextStyle: TextStyle(
              //   fontSize:16,
              //   color: Colors.black
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        print("value $value");
                        if (!RegExp(
                                r'/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/')
                            .hasMatch(value.toString())) {
                          return "enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text('Login')),
                    FutureBuilder(
                        future:
                            Authentication.initializeFirebase(context: context),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print('Error initializing Firebase $snapshot');
                            return Text(
                                'Error initializing Firebase $snapshot');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ElevatedButton(
                                onPressed: () async {
                                  User? user =
                                      await Authentication.signInWithGoogle(
                                          context: context);

                                  if (user != null) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile(
                                              name:
                                                  user.displayName ?? 'No Name',
                                              email: user.email ?? 'No Email',
                                              profileImageLink:
                                                  user.photoURL ?? '')),
                                    );
                                    print(' login done $user');
                                  } else {
                                    print('login fail');
                                  }
                                },
                                child: const Text('google'));
                          }
                          return const CircularProgressIndicator();
                        })
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
