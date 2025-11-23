import 'dart:ui';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/features/product/presentation/widget/form_field.dart';
import 'package:ecommerce/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:ecommerce/features/profile/presentation/bloc/profile_event.dart';
import 'package:ecommerce/features/profile/presentation/bloc/profile_state.dart'; // ✅ added
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isSignUp = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _toggleSignUp() {
    setState(() {
      _isSignUp = !_isSignUp;
    });
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final authEntity = AuthEntity(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (_isSignUp) {
        BlocProvider.of<AuthBloc>(context)
            .add(SignUpWithEmailEvent(authEntity));
      } else {
        BlocProvider.of<AuthBloc>(context)
            .add(SignInWithEmailEvent(authEntity));
      }

      final user = getCurrentUser();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: Text(
            _isSignUp ? 'Create an Account' : 'Welcome Back',
            key: ValueKey(_isSignUp),
            style: theme.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),

      body: MultiBlocListener(
        listeners: [
          // ---------------- Auth Listener ----------------
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                if (_isSignUp) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please verify your account and sign in"),
                    ),
                  );
                  _toggleSignUp();
                } else {
                  // ✅ Signed in → load profile BEFORE navigation
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    context.read<ProfileBloc>().add(GetProfileEvent(user.uid));
                  }
                }
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
          ),

          // ---------------- Profile Listener ----------------
          BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              // ✅ If your state names differ, rename these two blocks
              if (state is ProfileLoaded) {
                final profile = state.profile;

                final isIncomplete =
                    // ignore: unnecessary_null_comparison
                    (profile.username == null ||
                        profile.username.toString().trim().isEmpty) ||
                    // ignore: unnecessary_null_comparison
                    (profile.phoneNumber == null ||
                        profile.phoneNumber.toString().trim().isEmpty) ||
                    // ignore: unnecessary_null_comparison
                    (profile.address == null ||
                        profile.address.toString().trim().isEmpty);

                if (isIncomplete) {
                  Navigator.pushReplacementNamed(context, '/profileSetup');
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              }

              // If profile not found / empty in DB
              // if (state is ProfileEmpty) {
              //   Navigator.pushReplacementNamed(context, '/profileSetup');
              // }

              // Optional: on error also go setup (so user can fix)
              if (state is ProfileError) {
                Navigator.pushReplacementNamed(context, '/profileSetup');
              }
            },
          ),
        ],
        child: BlocConsumer<AuthBloc, AuthState>(
          // listener handled by MultiBlocListener
          listener: (context, state) {},
          builder: (context, state) {
            // ✅ YOUR UI IS EXACTLY SAME AS BEFORE
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.orange.shade100, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 400),
                          child: Text(
                            _isSignUp
                                ? "Join Our Community!"
                                : "Let's Sign You In!",
                            key: ValueKey(_isSignUp),
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Constant.colorOrg,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              width: size.width,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    ReusableFormField(
                                      labelText: 'Email',
                                      controller: _emailController,
                                      prefixIcon: Icons.email_outlined,
                                      validator: (value) {
                                        final emailRegex = RegExp(
                                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                        if (value == null || value.isEmpty) {
                                          return 'Email is required';
                                        } else if (!emailRegex.hasMatch(value)) {
                                          return 'Enter a valid email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 15),
                                    ReusableFormField(
                                      labelText: 'Password',
                                      controller: _passwordController,
                                      prefixIcon: Icons.lock_outline,
                                      obscureText: true,
                                      isPasswordField: true,
                                      isVisible: _isPasswordVisible,
                                      toggleVisibility: () => setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      }),
                                      validator: (value) =>
                                          value == null || value.length < 6
                                              ? 'Password must be at least 6 characters'
                                              : null,
                                    ),
                                    if (_isSignUp) ...[
                                      SizedBox(height: 15),
                                      ReusableFormField(
                                        labelText: 'Confirm Password',
                                        controller: _confirmPasswordController,
                                        prefixIcon: Icons.lock_outline,
                                        obscureText: true,
                                        isPasswordField: true,
                                        isVisible: _isConfirmPasswordVisible,
                                        toggleVisibility: () => setState(() {
                                          _isConfirmPasswordVisible =
                                              !_isConfirmPasswordVisible;
                                        }),
                                        validator: (value) =>
                                            value != _passwordController.text
                                                ? 'Passwords do not match'
                                                : null,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 56,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _isSignUp
                                ? Colors.orange.shade500
                                : Colors.blue.shade500,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onTap: () => _handleSubmit(context),
                            borderRadius: BorderRadius.circular(15),
                            child: Center(
                              child: Text(
                                _isSignUp ? 'Sign Up' : 'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (!_isSignUp) ...[
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              final email = _emailController.text.trim();
                              if (email.isNotEmpty) {
                                BlocProvider.of<AuthBloc>(context)
                                    .add(PasswrodResetEvent(email));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Password reset email sent!")),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Please enter a valid email address")),
                                );
                              }
                            },
                            child: Text("Reset Password"),
                          ),
                        ],
                        SizedBox(height: 10),
                        TextButton(
                          onPressed: _toggleSignUp,
                          child: Text(
                            _isSignUp
                                ? 'Already have an account? Sign In'
                                : 'Don’t have an account? Sign Up',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: Divider(
                                    thickness: 1.2,
                                    color: Colors.grey.shade400)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("OR",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey)),
                            ),
                            Expanded(
                                child: Divider(
                                    thickness: 1.2,
                                    color: Colors.grey.shade400)),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(ContinueWithGoogleEvent());
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 4,
                          ),
                          child: Image.asset(
                            "assets/images/google_logo.png",
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is AuthLoading)
                  AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(color: Constant.colorOrg),
                            SizedBox(height: 12),
                            Text("Please wait...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
