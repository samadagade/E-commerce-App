// // import 'package:ecommerce/core/constants/constants.dart';
// // import 'package:ecommerce/features/product/presentation/widget/form_field.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
// // import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
// // import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';
// // import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';
// // import 'package:sign_in_button/sign_in_button.dart';

// // class AuthScreen extends StatefulWidget {
// //   @override
// //   _AuthScreenState createState() => _AuthScreenState();
// // }

// // class _AuthScreenState extends State<AuthScreen>
// //     with SingleTickerProviderStateMixin {
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController =
// //       TextEditingController();

// //   final _formKey = GlobalKey<FormState>();
// //   bool _isSignUp = false;
// //   bool _isPasswordVisible = false;
// //   bool _isConfirmPasswordVisible = false;

// //   //function for toggle between sign up and sign in
// //   void _toggleSignUp() {
// //     setState(() {
// //       _isSignUp = !_isSignUp;
// //     });
// //   }

// //   //function to handle form submit and validate all field using validate()
// //   void _handleSubmit(BuildContext context) {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       final authEntity = AuthEntity(
// //         email: _emailController.text.trim(),
// //         password: _passwordController.text.trim(),
// //       );

// //       if (_isSignUp) {
// //         BlocProvider.of<AuthBloc>(context)
// //             .add(SignUpWithEmailEvent(authEntity));
// //       } else {
// //         BlocProvider.of<AuthBloc>(context)
// //             .add(SignInWithEmailEvent(authEntity));
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           _isSignUp ? 'Create an Account' : 'Welcome Back',
// //           style: theme.textTheme.headlineSmall
// //               ?.copyWith(fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //         automaticallyImplyLeading: false,
// //       ),
// //       body: BlocConsumer<AuthBloc, AuthState>(
// //         listener: (context, state) {
// //           if (state is AuthSuccess) {
// //             if (_isSignUp) {
// //               //Navigator.pushReplacementNamed(context, '/profileSetup');
// //               ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text("Please Verify your account and sign in")),
// //             );
// //             _toggleSignUp();
// //             } else {
// //               Navigator.pushReplacementNamed(context, '/profileSetup');
// //             }
// //           } else if (state is AuthFailure) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text(state.message)),
// //             );
// //           }
// //         },
// //         builder: (context, state) {
// //           return Stack(
// //             children: [
// //               SingleChildScrollView(
// //                 padding: EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.stretch,
// //                   children: [
// //                     Text(
// //                       _isSignUp ? "Join Our Community!" : "Let's Sign You In!",
// //                       style: theme.textTheme.headlineMedium?.copyWith(
// //                         fontWeight: FontWeight.bold,
// //                         color: Constant.colorOrg,
// //                       ),
// //                       textAlign: TextAlign.center,
// //                     ),
// //                     SizedBox(height: 30),
// //                     Card(
// //                       elevation: 12,
// //                       shadowColor: Colors.black.withOpacity(0.8),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(20.0),
// //                       ),
// //                       child: Padding(
// //                         padding: EdgeInsets.all(12.0),
// //                         child: Form(
// //                           key: _formKey,
// //                           child: Column(
// //                             children: [
// //                               ReusableFormField(
// //                                 labelText: 'Email',
// //                                 controller: _emailController,
// //                                 prefixIcon: Icons.email_outlined,
// //                                 validator: (value) {
// //                                   final emailRegex = RegExp(
// //                                       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
// //                                   if (value == null || value.isEmpty) {
// //                                     return 'Email is required';
// //                                   } else if (!emailRegex.hasMatch(value)) {
// //                                     return 'Enter a valid email address';
// //                                   }
// //                                   return null;
// //                                 },
// //                               ),
// //                               SizedBox(height: 15.0),
// //                               ReusableFormField(
// //                                 labelText: 'Password',
// //                                 controller: _passwordController,
// //                                 prefixIcon: Icons.lock_outline,
// //                                 obscureText: true,
// //                                 isPasswordField: true,
// //                                 isVisible: _isPasswordVisible,
// //                                 toggleVisibility: () => setState(() {
// //                                   _isPasswordVisible = !_isPasswordVisible;
// //                                 }),
// //                                 validator: (value) => value == null ||
// //                                         value.length < 6
// //                                     ? 'Password must be at least 6 characters'
// //                                     : null,
// //                               ),
// //                               if (_isSignUp)
// //                                 Column(
// //                                   children: [
// //                                     SizedBox(height: 15.0),
// //                                     ReusableFormField(
// //                                       labelText: 'Confirm Password',
// //                                       controller: _confirmPasswordController,
// //                                       prefixIcon: Icons.lock_outline,
// //                                       obscureText: true,
// //                                       isPasswordField: true,
// //                                       isVisible: _isConfirmPasswordVisible,
// //                                       toggleVisibility: () => setState(() {
// //                                         _isConfirmPasswordVisible =
// //                                             !_isConfirmPasswordVisible;
// //                                       }),
// //                                       validator: (value) =>
// //                                           value != _passwordController.text
// //                                               ? 'Passwords do not match'
// //                                               : null,
// //                                     ),
// //                                   ],
// //                                 ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     ElevatedButton(
// //                       onPressed: () => _handleSubmit(context),
// //                       style: ElevatedButton.styleFrom(
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(15.0),
// //                         ),
// //                         padding: EdgeInsets.symmetric(vertical: 16.0),
// //                       ),
// //                       child: Text(
// //                         _isSignUp ? 'Sign Up' : 'Sign In',
// //                         style: TextStyle(
// //                             fontSize: 18.0, fontWeight: FontWeight.bold),
// //                       ),
// //                     ),
// //                     SizedBox(height: 10),
// //                     _isSignUp == false
// //                         ? TextButton(
// //                             onPressed: () {
// //                               final email = _emailController.text.trim();

// //                               if (email.isNotEmpty) {
// //                                 BlocProvider.of<AuthBloc>(context)
// //                                     .add(PasswrodResetEvent(email));

// //                                 ScaffoldMessenger.of(context).showSnackBar(
// //                                   SnackBar(
// //                                       content:
// //                                           Text("Password reset email sent!")),
// //                                 );
// //                               } else {
// //                                 ScaffoldMessenger.of(context).showSnackBar(
// //                                   SnackBar(
// //                                       content: Text(
// //                                           "Please enter a valid email address")),
// //                                 );
// //                               }
// //                             },
// //                             child: Text("Reset Password"),
// //                           )
// //                         : SizedBox.shrink(),
// //                     SizedBox(height: 15.0),
// //                     TextButton(
// //                       onPressed: _toggleSignUp,
// //                       child: Text(
// //                         _isSignUp
// //                             ? 'Already have an account? Sign In'
// //                             : 'Don’t have an account? Sign Up',
// //                         style: TextStyle(color: Colors.black87, fontSize: 16.0),
// //                       ),
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     Row(
// //                       children: [
// //                         Expanded(child: Divider(color: Colors.grey.shade300)),
// //                         Padding(
// //                           padding: EdgeInsets.symmetric(horizontal: 8.0),
// //                           child: Text('OR',
// //                               style: TextStyle(color: Colors.grey.shade600)),
// //                         ),
// //                         Expanded(child: Divider(color: Colors.grey.shade300)),
// //                       ],
// //                     ),
// //                     SizedBox(height: 20.0),
// //                     SignInButton(
// //                       Buttons.google,
// //                       onPressed: () {
// //                         BlocProvider.of<AuthBloc>(context)
// //                             .add(ContinueWithGoogleEvent());
// //                       },
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(15.0)),
// //                       text: "Continue with Google",
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               if (state is AuthLoading)
// //                 Container(
// //                   color: Colors.black.withOpacity(0.5),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text("Loading Profile........"),
// //                       Center(child: CircularProgressIndicator()),
// //                     ],
// //                   ),
// //                 ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:ecommerce/core/constants/constants.dart';
// import 'package:ecommerce/features/product/presentation/widget/form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
// import 'package:ecommerce/features/auth/presentation/bloc/auth_state.dart';
// import 'package:ecommerce/features/auth/domain/entities/auth_entity.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   bool _isSignUp = false;
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   void _toggleSignUp() {
//     setState(() {
//       _isSignUp = !_isSignUp;
//     });
//   }

//   void _handleSubmit(BuildContext context) {
//     if (_formKey.currentState?.validate() ?? false) {
//       final authEntity = AuthEntity(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       if (_isSignUp) {
//         BlocProvider.of<AuthBloc>(context).add(SignUpWithEmailEvent(authEntity));
//       } else {
//         BlocProvider.of<AuthBloc>(context).add(SignInWithEmailEvent(authEntity));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           _isSignUp ? 'Create an Account' : 'Welcome Back',
//           style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//       ),
//       body: BlocConsumer<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthSuccess) {
//             if (_isSignUp) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text("Please verify your account and sign in")),
//               );
//               _toggleSignUp();
//             } else {
//               Navigator.pushReplacementNamed(context, '/profileSetup');
//             }
//           } else if (state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(state.message)),
//             );
//           }
//         },
//         builder: (context, state) {
//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     AnimatedSwitcher(
//                       duration: Duration(milliseconds: 300),
//                       child: Text(
//                         _isSignUp ? "Join Our Community!" : "Let's Sign You In!",
//                         key: ValueKey(_isSignUp),
//                         style: theme.textTheme.headlineMedium?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Constant.colorOrg,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Card(
//                       color: Colors.white.withOpacity(0.9),
//                       elevation: 8,
//                       shadowColor: Colors.black45,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             children: [
//                               ReusableFormField(
//                                 labelText: 'Email',
//                                 controller: _emailController,
//                                 prefixIcon: Icons.email_outlined,
//                                 validator: (value) {
//                                   final emailRegex = RegExp(
//                                       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
//                                   if (value == null || value.isEmpty) {
//                                     return 'Email is required';
//                                   } else if (!emailRegex.hasMatch(value)) {
//                                     return 'Enter a valid email address';
//                                   }
//                                   return null;
//                                 },
//                               ),
//                               SizedBox(height: 15.0),
//                               ReusableFormField(
//                                 labelText: 'Password',
//                                 controller: _passwordController,
//                                 prefixIcon: Icons.lock_outline,
//                                 obscureText: true,
//                                 isPasswordField: true,
//                                 isVisible: _isPasswordVisible,
//                                 toggleVisibility: () => setState(() {
//                                   _isPasswordVisible = !_isPasswordVisible;
//                                 }),
//                                 validator: (value) =>
//                                     value == null || value.length < 6
//                                         ? 'Password must be at least 6 characters'
//                                         : null,
//                               ),
//                               if (_isSignUp)
//                                 Column(
//                                   children: [
//                                     SizedBox(height: 15.0),
//                                     ReusableFormField(
//                                       labelText: 'Confirm Password',
//                                       controller: _confirmPasswordController,
//                                       prefixIcon: Icons.lock_outline,
//                                       obscureText: true,
//                                       isPasswordField: true,
//                                       isVisible: _isConfirmPasswordVisible,
//                                       toggleVisibility: () => setState(() {
//                                         _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                                       }),
//                                       validator: (value) =>
//                                           value != _passwordController.text
//                                               ? 'Passwords do not match'
//                                               : null,
//                                     ),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20.0),
//                     AnimatedContainer(
//                       duration: Duration(milliseconds: 300),
//                       height: 55,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: _isSignUp ? Colors.deepOrange : Colors.blueAccent,
//                       ),
//                       child: InkWell(
//                         onTap: () => _handleSubmit(context),
//                         child: Center(
//                           child: AnimatedSwitcher(
//                             duration: Duration(milliseconds: 300),
//                             child: Text(
//                               _isSignUp ? 'Sign Up' : 'Sign In',
//                               key: ValueKey(_isSignUp),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (!_isSignUp)
//                       TextButton(
//                         onPressed: () {
//                           final email = _emailController.text.trim();
//                           if (email.isNotEmpty) {
//                             BlocProvider.of<AuthBloc>(context).add(PasswrodResetEvent(email));
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Password reset email sent!")),
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("Please enter a valid email address")),
//                             );
//                           }
//                         },
//                         child: Text("Reset Password"),
//                       ),
//                     SizedBox(height: 10),
//                     TextButton(
//                       onPressed: _toggleSignUp,
//                       child: Text(
//                         _isSignUp
//                             ? 'Already have an account? Sign In'
//                             : 'Don’t have an account? Sign Up',
//                         style: TextStyle(color: Colors.black87, fontSize: 16.0),
//                       ),
//                     ),
//                     SizedBox(height: 20.0),
//                     Row(
//                       children: [
//                         Expanded(child: Divider(thickness: 1.2, color: Colors.grey.shade400)),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Text("OR",
//                               style: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey)),
//                         ),
//                         Expanded(child: Divider(thickness: 1.2, color: Colors.grey.shade400)),
//                       ],
//                     ),
//                     SizedBox(height: 20.0),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         BlocProvider.of<AuthBloc>(context).add(ContinueWithGoogleEvent());
//                       },
//                       icon: Icon(Icons.g_mobiledata, size: 28),
//                       label: Text("Continue with Google"),
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.black,
//                         backgroundColor: Colors.white,
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         elevation: 4,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               if (state is AuthLoading)
//                 AnimatedOpacity(
//                   opacity: 1,
//                   duration: Duration(milliseconds: 300),
//                   child: Container(
//                     color: Colors.black54,
//                     child: Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           CircularProgressIndicator(color: Constant.colorOrg),
//                           SizedBox(height: 12),
//                           Text("Please wait...",
//                               style: TextStyle(color: Colors.white, fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:ui';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/features/product/presentation/widget/form_field.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            if (_isSignUp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Please verify your account and sign in")),
              );
              _toggleSignUp();
            } else {
              Navigator.pushReplacementNamed(context, '/profileSetup');
            }
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
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
                                    validator: (value) => value == null ||
                                            value.length < 6
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
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                                  thickness: 1.2, color: Colors.grey.shade400)),
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
                                  thickness: 1.2, color: Colors.grey.shade400)),
                        ],
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context)
                              .add(ContinueWithGoogleEvent());
                        },
                        // icon: Icon(Icons.g_mobiledata_rounded, size: 28),
                        // label: Text("Continue with Google"),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          // backgroundColor: Colors.white,
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
