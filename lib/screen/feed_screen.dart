import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/widget/feeds_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class FeedScreen extends StatelessWidget {
  static const routeName = '\feeds_screen';
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<Product> products = productProvider.products;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 40),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 2500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: FeedProducts(
                    id: products[index].id,
                    description: products[index].description,
                    price: products[index].price,
                    imageUrl: products[index].imageUrl,
                    quantity: products[index].quantity,
                    isFavourite: products[index].isFavourite,
                    title: products[index].title,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
