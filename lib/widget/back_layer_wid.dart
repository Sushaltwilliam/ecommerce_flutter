import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/feed_screen.dart';
import 'package:ecommerce/screen/wishlist_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackLayerWidget extends StatelessWidget {
  const BackLayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.purple.shade300,
            Colors.purple.shade400
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://d1aettbyeyfilo.cloudfront.net/dataskills/unsplash_1602675288.jpg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                content(
                  context,
                  Icons.rss_feed_outlined,
                  'Feeds',
                  () {
                    navigator(context, FeedScreen.routeName);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                content(
                  context,
                  Icons.shopping_cart_outlined,
                  'Cart',
                  () {
                    navigator(context, CartScreen.routeName);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                content(
                  context,
                  EvaIcons.heartOutline,
                  'Wishlist',
                  () {
                    navigator(context, WishListScreen.routeName);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                content(
                  context,
                  Icons.upload_outlined,
                  'Upload a new Product',
                  () {
                    navigator(context, FeedScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void navigator(BuildContext context, String text) {
    Navigator.of(context).pushNamed(text);
  }

  Widget content(
      BuildContext context, IconData icon, String text, Function() onTapFun) {
    return GestureDetector(
      onTap: onTapFun,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 17),
            ),
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
