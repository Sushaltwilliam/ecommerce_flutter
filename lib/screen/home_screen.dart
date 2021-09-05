import 'package:backdrop/backdrop.dart';
import 'package:backdrop/sub_header.dart';
import 'package:ecommerce/widget/back_layer_wid.dart';
import 'package:ecommerce/widget/carousal_slider.dart';
import 'package:ecommerce/widget/categories.dart';
import 'package:ecommerce/widget/popular_brand_widget.dart';
import 'package:ecommerce/widget/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBorderRadius: BorderRadius.circular(0),
          headerHeight: size.height * 0.3,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: BackdropAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            title: Text("Home"),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://gw.alipayobjects.com/zos/rmsportal/XzOPonWCsPjvgkrklCzo.png'),
                  ),
                ),
              )
            ],
          ),
          backLayer: BackLayerWidget(),
          frontLayer: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: size.height * 0.25,
                    width: size.width,
                    child: CarousalSliderWid()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    child: Text(
                      'Categories',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.25,
                  child: AnimationLimiter(
                    child: ListView.builder(
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 2500),
                            child: SlideAnimation(
                              verticalOffset: 100.0,
                              child: FadeInAnimation(
                                  child: CategoriesWidget(
                                index: index,
                              )),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'View All',
                          style: Theme.of(context).primaryTextTheme.subtitle2,
                        ),
                      )
                    ],
                  ),
                ),
                Container(height: size.height * 0.25, child: PopularBrandWid()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    child: Text(
                      'Categories',
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.34,
                  child: AnimationLimiter(
                    child: ListView.builder(
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 2500),
                            child: SlideAnimation(
                              horizontalOffset: 100.0,
                              child:
                                  FadeInAnimation(child: PopularProductWid()),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
