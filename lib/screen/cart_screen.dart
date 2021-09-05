import 'package:ecommerce/const/my_app_icons.dart';
import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/widget/cart_empty_screen.dart';
import 'package:ecommerce/widget/cart_full_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart_screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 50;

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    List products = [];

    return !products.isEmpty
        ? Scaffold(
            backgroundColor: themeData ? Colors.black : Colors.white,
            body: CartEmptyScreen(),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text('Cart ( ${products.length.toString()} )'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(MyAppIcons.delete))
              ],
            ),
            bottomSheet: checkOutBtn(context),
            body: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: AnimationLimiter(
                child: ListView.builder(
                  // separatorBuilder: (ctx, index) => Divider(
                  // color: Colors.grey,
                  // ),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 3000),
                      child: SlideAnimation(
                        // curve: Curve(Curves.ease),
                        verticalOffset: 50,
                        horizontalOffset: 50,
                        // verticalOffset: .0,
                        child: FadeInAnimation(
                          curve: Curves.ease,
                          child: FullCartScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }

  Widget checkOutBtn(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeData =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    return Container(
      color: themeData ? Colors.black : Colors.white,
      height: size.height * 0.06,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: size.width * 0.38,
            child: ElevatedButton(
              child: Text('CheckOut'),
              onPressed: () {},
            ),
          ),
          Container(
            width: size.width * 0.38,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Total : ',
                  style: GoogleFonts.robotoSlab(
                      color: themeData ? Colors.white : Colors.purple)),
              TextSpan(
                  text: 'Rs.$total',
                  style: GoogleFonts.robotoSlab(
                      color: themeData ? Colors.white : Colors.purple))
            ])),
          )
        ],
      ),
    );
  }
}
