import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/features/product/presentation/bloc/product_bloc.dart';
import 'package:ecommerce/features/product/presentation/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth > 600;
    final bool isDesktop = screenWidth > 1024;

    // Adjust grid columns responsively
    final int crossAxisCount = isDesktop
        ? 4
        : isTablet
            ? 3
            : 2;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.favorite, color: Constant.colorOrg, size: 26),
            const SizedBox(width: 10),
            const Text(
              "Wish List",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 3,
        centerTitle: false,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
 
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(
              child: Text(
                'Oops! ${state.message}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          } else if (state is ProductLoaded) {
            final favoriteProducts = state.products
                .where((product) => product.isFavorite)
                .toList();

            if (favoriteProducts.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_border,
                          color: Colors.grey.shade400, size: 72),
                      const SizedBox(height: 20),
                      const Text(
                        'No items in your wishlist yet!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Start adding products you love to easily find them later.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: GridView.builder(
                itemCount: favoriteProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isTablet ? 0.75 : 0.68,
                ),
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  final color = Colors
                      .primaries[index % Colors.primaries.length]
                      // ignore: deprecated_member_use
                      .withOpacity(0.1);

                  return ProductCard(
                    product: product,
                    bgColor: color,
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
