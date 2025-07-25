// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:ecommerce/core/constants/constants.dart';
// // import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
// // import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
// // import 'package:ecommerce/features/product/presentation/bloc/cart_bloc.dart';
// // import 'package:ecommerce/features/product/presentation/bloc/cart_event.dart';
// // import 'package:ecommerce/features/product/presentation/pages/product_details_page.dart';
// // import 'package:ecommerce/features/product/presentation/widget/payment_success_popup.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';

// // class HomePage extends StatefulWidget {
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Dispatch GetProductEvent when the widget is initialized
// //     context.read<ProductBloc>().add(GetProductEvent());
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //                     double screenWidth = MediaQuery.of(context).size.width;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(
// //           children: [
// //             Icon(Icons.shopping_bag, color: Constant.colorOrg, size: 28),
// //             SizedBox(width: 8), // Add spacing
// //             Text(
// //               'Products',
// //               style: TextStyle(
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 20,
// //               ),
// //             ),
// //           ],
// //         ),
// //         automaticallyImplyLeading: false,
// //         backgroundColor: Colors.white, // Change the background color
// //         elevation: 4, // Add subtle shadow
// //         centerTitle: true, // Center the title
// //         actions: [
// //           // Add a custom-styled logout button
// //           GestureDetector(
// //             onTap: () {
// //               BlocProvider.of<AuthBloc>(context).add(SignOutEvent());
// //               Navigator.pushReplacementNamed(context, '/auth');
// //             },
// //             child: Container(
// //               margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
// //               decoration: BoxDecoration(
// //                 color:
// //                     Colors.redAccent.withOpacity(0.1), // Light red background
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Icon(Icons.logout, color: Colors.red, size: 20),
// //                   SizedBox(width: 4), // Add spacing
// //                   Text(
// //                     'Logout',
// //                     style: TextStyle(
// //                       color: Colors.red,
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: BlocBuilder<ProductBloc, ProductState>(
// //         builder: (context, state) {
// //           if (state is ProductLoading) {
// //             return Center(child: CircularProgressIndicator());
// //           } else if (state is ProductError) {
// //             return Center(
// //               child: Text(state.message, style: TextStyle(color: Colors.red)),
// //             );
// //           } else if (state is ProductLoaded) {
// //             final products = state.products;

// //             return Column(
// //               children: [
// //                 // Carousel Slider for Featured Products
// //                 Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: CarouselSlider(
// //                     items: products.take(5).map((product) {
// //                       return GestureDetector(
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   ProductDetailsPage(product: product),
// //                             ),
// //                           );
// //                         },
// //                         child: Container(
// //                           margin: EdgeInsets.symmetric(horizontal: 8.0),
// //                           decoration: BoxDecoration(
// //                             color: Colors.white,
// //                             borderRadius: BorderRadius.circular(
// //                                 20.0), // More rounded corners
// //                             boxShadow: [
// //                               BoxShadow(
// //                                 color: Colors.black.withOpacity(
// //                                     0.2), // Darker shadow for depth
// //                                 blurRadius: 12.0,
// //                                 offset: Offset(0, 6),
// //                               ),
// //                             ],
// //                             image: DecorationImage(
// //                               image: NetworkImage(product.image),
// //                               fit: BoxFit.cover,
// //                             ),
// //                           ),
// //                           child: Stack(
// //                             children: [
// //                               // Gradient Overlay
// //                               Positioned.fill(
// //                                 child: Container(
// //                                   decoration: BoxDecoration(
// //                                     gradient: LinearGradient(
// //                                       colors: [
// //                                         Colors.transparent,
// //                                         Colors.black.withOpacity(
// //                                             0.7), // Slightly darker gradient
// //                                       ],
// //                                       begin: Alignment.topCenter,
// //                                       end: Alignment.bottomCenter,
// //                                     ),
// //                                     borderRadius: BorderRadius.circular(20.0),
// //                                   ),
// //                                 ),
// //                               ),
// //                               // Product Title
// //                               Positioned(
// //                                 bottom: 20,
// //                                 left: 20,
// //                                 right: 20,
// //                                 child: Text(
// //                                   product.title,
// //                                   style: TextStyle(
// //                                     fontSize:
// //                                         20, // Increased font size for better readability
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white,
// //                                     shadows: [
// //                                       Shadow(
// //                                         offset: Offset(0, 3),
// //                                         blurRadius: 6.0,
// //                                         color: Colors.black.withOpacity(0.8),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   textAlign: TextAlign.center,
// //                                   maxLines: 1,
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ),
// //                               // Price Tag
// //                               Positioned(
// //                                 top: 15,
// //                                 right: 15,
// //                                 child: Container(
// //                                   padding: EdgeInsets.symmetric(
// //                                       horizontal: 10, vertical: 5),
// //                                   decoration: BoxDecoration(
// //                                     color: Constant.colorOrg
// //                                         .withOpacity(0.9), // Price tag color
// //                                     borderRadius: BorderRadius.circular(15),
// //                                   ),
// //                                   child: Text(
// //                                     '\$${product.price.toStringAsFixed(2)}',
// //                                     style: TextStyle(
// //                                       fontSize: 14,
// //                                       fontWeight: FontWeight.bold,
// //                                       color: Colors.white,
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     }).toList(),
// //                     options: CarouselOptions(
// //                       height: 250.0, // Slightly taller for better visuals
                      
// //                       autoPlay: true,
// //                       autoPlayInterval:
// //                           Duration(seconds: 5), // Slightly faster transitions
// //                       enlargeCenterPage: true,
// //                       enlargeStrategy: CenterPageEnlargeStrategy.height,
// //                       viewportFraction:
// //                           screenWidth > 600 ? 0.2 : 0.7, // Slightly larger focus on the center item
// //                       // scrollPhysics:
// //                       //     BouncingScrollPhysics(), // Smooth scrolling effect
// //                       autoPlayCurve: Curves.bounceOut, // Smooth animation curve
// //                       //aspectRatio: 16 / 9, // Modern aspect ratio
// //                     ),
// //                   ),
// //                 ),


// //                 // GridView for All Products
// //                 Expanded(
// //                   child: GridView.builder(
// //                     padding: const EdgeInsets.all(8.0),
// //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                       crossAxisCount: screenWidth > 600 ? 4 : 2,
// //                       childAspectRatio: 0.75,
// //                       crossAxisSpacing: 8.0,
// //                       mainAxisSpacing: 8.0,
// //                     ),
// //                     itemCount: products.length,
// //                     itemBuilder: (context, index) {
// //                       final product = products[index];
// //                       return GestureDetector(
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   ProductDetailsPage(product: product),
// //                             ),
// //                           );
// //                         },
// //                         child: Card(
// //                           elevation: 4,
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Expanded(
// //                                 child: ClipRRect(
// //                                   borderRadius: BorderRadius.vertical(
// //                                       top: Radius.circular(8)),
// //                                   child: Image.network(
// //                                     product.image,
// //                                     fit: BoxFit.cover,
// //                                     width: double.infinity,
// //                                   ),
// //                                 ),
// //                               ),
// //                               Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child: Text(
// //                                   product.title,
// //                                   style: TextStyle(
// //                                     fontSize: 16,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                   maxLines: 2,
// //                                   overflow: TextOverflow.ellipsis,
// //                                 ),
// //                               ),
// //                               Padding(
// //                                 padding:
// //                                     const EdgeInsets.symmetric(horizontal: 8.0),
// //                                 child: Text(
// //                                   '\$${product.price.toStringAsFixed(2)}',
// //                                   style: TextStyle(
// //                                     fontSize: 14,
// //                                     color: Colors.green,
// //                                     fontWeight: FontWeight.bold,
// //                                   ),
// //                                 ),
// //                               ),
// //                               ButtonBar(
// //                                 alignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   IconButton(
// //                                     icon: (product.isFavorite)
// //                                         ? Icon(Icons.favorite,
// //                                             color: Colors.red)
// //                                         : Icon(Icons.favorite_outline,
// //                                             color: Colors.red),
// //                                     onPressed: () {
// //                                       context
// //                                           .read<ProductBloc>()
// //                                           .add(ToggleFavoriteEvent(product.id));
// //                                     },
// //                                   ),
// //                                   IconButton(
// //                                     onPressed: (){
// //                                       showPaymentSuccessDialog(context);
// //                                     }
// //                                   , icon: Icon(Icons.shopping_bag, color: Colors.lightGreen),
// //                                   ),
// //                                   IconButton(
// //                                     icon: Icon(Icons.shopping_cart,
// //                                         color: Colors.blue),
// //                                     onPressed: () {
// //                                       context.read<CartBloc>().add(
// //                                             AddToCart(
// //                                               userId: FirebaseAuth
// //                                                   .instance
// //                                                   .currentUser!
// //                                                   .uid, // Replace with dynamic user ID
// //                                               productId: product.id.toString(),
// //                                               quantity: 1,
// //                                             ),
// //                                           );
// //                                       ScaffoldMessenger.of(context)
// //                                           .showSnackBar(
// //                                         SnackBar(
// //                                           content: Text(
// //                                             '${product.title} added to Cart',
// //                                             style:
// //                                                 TextStyle(color: Colors.black),
// //                                           ),
// //                                           backgroundColor:
// //                                               Colors.lightBlue[300],
// //                                           duration: Duration(seconds: 2),
// //                                         ),
// //                                       );
// //                                     },
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             );
// //           } else {
// //             return Center(
// //               child: Text('No products available'),
// //             );
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:ecommerce/core/constants/constants.dart';
// import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
// import 'package:ecommerce/features/product/presentation/bloc/cart_bloc.dart';
// import 'package:ecommerce/features/product/presentation/bloc/cart_event.dart';
// import 'package:ecommerce/features/product/presentation/pages/product_details_page.dart';
// import 'package:ecommerce/features/product/presentation/widget/payment_success_popup.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<ProductBloc>().add(GetProductEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 2,
//         titleSpacing: 12,
//         centerTitle: true,
//         leading: Icon(Icons.shopping_bag, color: Constant.colorOrg, size: 26),
//         title: Text(
//           'Products',
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             child: IconButton(
//               icon: Icon(Icons.logout, color: Colors.redAccent),
//               onPressed: () {
//                 context.read<AuthBloc>().add(SignOutEvent());
//                 Navigator.pushReplacementNamed(context, '/auth');
//               },
//             ),
//           ),
//         ],
//       ),
//       body: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is ProductError) {
//             return Center(
//               child: Text(state.message, style: TextStyle(color: Colors.red)),
//             );
//           } else if (state is ProductLoaded) {
//             final products = state.products;

//             if (products.isEmpty) {
//               return Center(child: Text("No products available"));
//             }

//             final bool isTablet = screenWidth > 600;
//             final bool isDesktop = screenWidth > 1000;
//             final int crossAxisCount = isDesktop
//                 ? 5
//                 : isTablet
//                     ? 3
//                     : 2;

//             return Column(
//               children: [
//                 // Carousel
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: CarouselSlider.builder(
//                     itemCount: products.take(5).length,
//                     itemBuilder: (context, index, realIdx) {
//                       final product = products[index];
//                       return GestureDetector(
//                         onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ProductDetailsPage(product: product),
//                           ),
//                         ),
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 6),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(18),
//                             image: DecorationImage(
//                               image: NetworkImage(product.image),
//                               fit: BoxFit.cover,
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 blurRadius: 8,
//                                 offset: Offset(0, 4),
//                               ),
//                             ],
//                           ),
//                           child: Stack(
//                             children: [
//                               // Dark overlay
//                               Positioned.fill(
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(18),
//                                     gradient: LinearGradient(
//                                       colors: [
//                                         Colors.black.withOpacity(0.1),
//                                         Colors.black.withOpacity(0.5),
//                                       ],
//                                       begin: Alignment.topCenter,
//                                       end: Alignment.bottomCenter,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               // Title
//                               Positioned(
//                                 left: 12,
//                                 right: 12,
//                                 bottom: 16,
//                                 child: Text(
//                                   product.title,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     shadows: [
//                                       Shadow(
//                                         color: Colors.black54,
//                                         offset: Offset(0, 2),
//                                         blurRadius: 4,
//                                       ),
//                                     ],
//                                   ),
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ),
//                               // Price badge
//                               Positioned(
//                                 top: 12,
//                                 right: 12,
//                                 child: Container(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Constant.colorOrg,
//                                     borderRadius: BorderRadius.circular(15),
//                                   ),
//                                   child: Text(
//                                     '\$${product.price.toStringAsFixed(2)}',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     options: CarouselOptions(
//                       height: isTablet ? 240 : 200,
//                       autoPlay: true,
//                       autoPlayInterval: Duration(seconds: 5),
//                       enlargeCenterPage: true,
//                       viewportFraction: isDesktop ? 0.22 : isTablet ? 0.35 : 0.8,
//                       enableInfiniteScroll: true,
//                       scrollPhysics: BouncingScrollPhysics(),
//                     ),
//                   ),
//                 ),

//                 // Product Grid
//                 Expanded(
//                   child: GridView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     itemCount: products.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       mainAxisSpacing: 16,
//                       crossAxisSpacing: 16,
//                       childAspectRatio: 0.65,
//                     ),
//                     itemBuilder: (context, index) {
//                       final product = products[index];
//                       return GestureDetector(
//                         onTap: () => Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => ProductDetailsPage(product: product),
//                           ),
//                         ),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           elevation: 3,
//                           shadowColor: Colors.grey.shade300,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(12)),
//                                   child: Image.network(
//                                     product.image,
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       product.title,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14),
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       '\$${product.price.toStringAsFixed(2)}',
//                                       style: TextStyle(
//                                         color: Colors.green,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 13,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               ButtonBar(
//                                 alignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   IconButton(
//                                     icon: Icon(
//                                       product.isFavorite
//                                           ? Icons.favorite
//                                           : Icons.favorite_border,
//                                       color: Colors.redAccent,
//                                     ),
//                                     onPressed: () {
//                                       context.read<ProductBloc>().add(
//                                           ToggleFavoriteEvent(product.id));
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_cart,
//                                         color: Colors.blue),
//                                     onPressed: () {
//                                       context.read<CartBloc>().add(
//                                             AddToCart(
//                                               userId: FirebaseAuth
//                                                   .instance.currentUser!.uid,
//                                               productId:
//                                                   product.id.toString(),
//                                               quantity: 1,
//                                             ),
//                                           );
//                                       ScaffoldMessenger.of(context)
//                                           .showSnackBar(SnackBar(
//                                         content: Text(
//                                           '${product.title} added to cart',
//                                           style: TextStyle(
//                                               color: Colors.white),
//                                         ),
//                                         backgroundColor: Colors.blueAccent,
//                                       ));
//                                     },
//                                   ),
//                                   IconButton(
//                                     icon: Icon(Icons.shopping_bag,
//                                         color: Colors.green),
//                                     onPressed: () {
//                                       showPaymentSuccessDialog(context);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               ],
//             );
//           } else {
//             return Center(child: Text('No products available'));
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_event.dart';
import 'package:ecommerce/features/product/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/cart_event.dart';
import 'package:ecommerce/features/product/presentation/pages/product_details_page.dart';
import 'package:ecommerce/features/product/presentation/widget/payment_success_popup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        titleSpacing: 12,
        centerTitle: true,
        leading: Icon(Icons.shopping_bag, color: Constant.colorOrg, size: 26),
        title: Text(
          'Products',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.redAccent),
              onPressed: () {
                context.read<AuthBloc>().add(SignOutEvent());
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(
              child: Text(state.message, style: TextStyle(color: Colors.red)),
            );
          } else if (state is ProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return Center(child: Text("No products available"));
            }

            final List featuredProducts = products.take(5).toList();
            final bool isTablet = screenWidth > 600;
            final bool isDesktop = screenWidth > 1000;
            final int crossAxisCount = isDesktop
                ? 5
                : isTablet
                    ? 3
                    : 2;

            return Column(
              children: [
                // Carousel Slider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: CarouselSlider.builder(
                    itemCount: featuredProducts.length,
                    itemBuilder: (context, index, realIdx) {
                      final product = featuredProducts[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsPage(product: product),
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: NetworkImage(product.image),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.1),
                                        Colors.black.withOpacity(0.5),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 12,
                                right: 12,
                                bottom: 16,
                                child: Text(
                                  product.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 2),
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                top: 12,
                                right: 12,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Constant.colorOrg,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: isTablet ? 240 : 200,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      enlargeCenterPage: true,
                      viewportFraction:
                          isDesktop ? 0.22 : isTablet ? 0.35 : 0.6,
                      enableInfiniteScroll: true,
                      scrollPhysics: BouncingScrollPhysics(),
                    ),
                  ),
                ),

                // Product Grid
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailsPage(product: product),
                          ),
                        ),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 3,
                          shadowColor: Colors.grey.shade300,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '\$${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      product.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.redAccent,
                                    ),
                                    onPressed: () {
                                      context.read<ProductBloc>().add(
                                          ToggleFavoriteEvent(product.id));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.shopping_cart,
                                        color: Colors.blue),
                                    onPressed: () {
                                      context.read<CartBloc>().add(
                                            AddToCart(
                                              userId: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                              productId:
                                                  product.id.toString(),
                                              quantity: 1,
                                            ),
                                          );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          '${product.title} added to cart',
                                          style:
                                              TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.blueAccent,
                                      ));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.shopping_bag,
                                        color: Colors.green),
                                    onPressed: () {
                                      showPaymentSuccessDialog(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
