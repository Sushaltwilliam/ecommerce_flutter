import 'package:ecommerce/bottom_bar.dart';
import 'package:ecommerce/const/theme_data.dart';
import 'package:ecommerce/models/dark_theme-preference.dart';
import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/screen/Inner_screen/brand_navigation_screen.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/feed_screen.dart';
import 'package:ecommerce/screen/product_details_screen.dart';
import 'package:ecommerce/screen/wishlist_screen.dart';
import 'package:ecommerce/widget/wishlist_empty.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    _darkThemeProvider.darkThemeVal =
        await _darkThemeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _darkThemeProvider),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(_darkThemeProvider.dartTheme, context),
          home: BottomBarScreen(),
          routes: {
            BrandNavigationScreen.routeName: (ctx) => BrandNavigationScreen(),
            FeedScreen.routeName: (ctx) => FeedScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
            WishListScreen.routeName: (ctx) => WishListScreen(),
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
          },
        );
      }),
    );
  }
}
