import 'package:ecommerce/const/my_app_icons.dart';
import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/widget/full_wishlist.dart';
import 'package:ecommerce/widget/wishlist_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wish_list';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeData =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    List wishList = [];

    return !wishList.isEmpty
        ? Scaffold(
            backgroundColor: themeData ? Colors.black : Colors.white,
            body: WishlistEmpty(),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text('Wishlist ( ${wishList.length.toString()} )'),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(MyAppIcons.delete))
              ],
            ),
            // bottomSheet: checkOutBtn(context),
            body: Container(
              width: size.width,
              // margin: const EdgeInsets.only(bottom: 50),
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
                          child: FullWishList(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ));
  }
}
