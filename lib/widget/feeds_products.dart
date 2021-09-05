import 'package:badges/badges.dart';
import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/provider/products.dart';
import 'package:ecommerce/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FeedProducts extends StatefulWidget {
  final String id;
  final String description;
  final int price;
  final String imageUrl;
  final int quantity;
  final bool isFavourite;
  final String title;

  const FeedProducts(
      {Key? key,
      required this.id,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.quantity,
      required this.isFavourite,
      required this.title})
      : super(key: key);

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeDate =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          margin: const EdgeInsets.all(0),
          elevation: 3,
          child: Container(
            // margin: const EdgeInsets.all(5),
            height: size.height * 0.4,
            width: size.width * 0.45,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, offset: Offset(2, 2), blurRadius: 6),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).backgroundColor,
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  overflow: Overflow.visible,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        // constraints: BoxConstraints(
                        //   minHeight: size.width * 0.2,
                        //   maxHeight: size.height * 0.25,
                        // ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ProductDetailsScreen.routeName);
                          },
                          child: Image.network(
                            widget.imageUrl,
                            width: 280,
                            height: 180,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -14,
                      child: Badge(
                        toAnimate: true,
                        animationDuration: Duration(milliseconds: 100),
                        animationType: BadgeAnimationType.fade,
                        shape: BadgeShape.square,
                        badgeColor:
                            themeDate ? Colors.lime : Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8),
                        badgeContent: Text(
                          'New',
                          style: GoogleFonts.robotoSlab(
                              color: themeDate ? Colors.black : Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    height: size.height * 0.1,
                    padding: const EdgeInsets.only(left: 5),
                    margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: themeDate
                              ? GoogleFonts.robotoSlab(
                                  fontSize: 15,
                                )
                              : GoogleFonts.robotoSlab(color: Colors.black),
                        ),
                        Text(
                          'Rs:  ${widget.price.toString()}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: themeDate
                              ? GoogleFonts.robotoSlab(
                                  fontSize: 15,
                                )
                              : GoogleFonts.robotoSlab(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Quality left : ${widget.quantity}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: themeDate
                                  ? GoogleFonts.robotoSlab(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    )
                                  : GoogleFonts.robotoSlab(
                                      color: Colors.grey,
                                    ),
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_horiz,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
