import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/screen/wishlist_screen.dart';
import 'package:ecommerce/widget/feeds_products.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product_detail_screen';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeDate = Provider.of<DarkThemeProvider>(context).dartTheme;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: themeDate ? Colors.white : Colors.black,
            )),
        centerTitle: true,
        title: Text('DETAIL', style: GoogleFonts.roboto()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WishListScreen.routeName);
              },
              icon: Icon(
                EvaIcons.heartOutline,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.shoppingCartOutline,
                color: themeDate ? Colors.white : Colors.purple,
              ))
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
                child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Title',
                          style: GoogleFonts.robotoSlab(
                              color: themeDate ? Colors.white : Colors.black,
                              fontSize: 18),
                        ),
                        Text(
                          'Price : Rs.200',
                          style: GoogleFonts.robotoSlab(
                              color: themeDate ? Colors.white : Colors.black,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.2,
                    width: size.width,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: GoogleFonts.robotoSlab(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'lorem publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
                          style: GoogleFonts.robotoSlab(
                              color: themeDate ? Colors.white : Colors.black,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: size.height * 0.14,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        details('Brand :', ' Name'),
                        details('Quality :', ' 12left'),
                        details('Category :', ' Category'),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: size.height * 0.1,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'No review yet',
                          style: GoogleFonts.robotoSlab(
                              color: themeDate ? Colors.white : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Be the first review',
                          style: GoogleFonts.robotoSlab(
                              color: Colors.grey, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: size.width,
                    child: Text(
                      'Suggested products :',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Container(
                  //   height: size.height * 0.27,
                  //   child: ListView.builder(
                  //       itemCount: 4,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (ctx, inex) {
                  //         return FeedProducts();
                  //       }),
                  // )
                ],
              ),
            )),
            Container(
              alignment: Alignment.bottomRight,
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/shoes.jpeg'),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.share))),
                  ),
                  Card(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.save),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Card(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
          height: 50,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.orangeAccent,
                      )),
                  child: Text('ADD TO CART'),
                  onPressed: () {},
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purpleAccent,
                      )),
                  child: Text('BUY NOW'),
                  onPressed: () {},
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(EvaIcons.heartOutline))
            ],
          ),
        ),
      ),
    );
  }

  Widget details(String brand, String name) {
    final themeDate = Provider.of<DarkThemeProvider>(context).dartTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          brand,
          style: GoogleFonts.robotoSlab(
              color: themeDate ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        Text(
          name,
          style: GoogleFonts.robotoSlab(
              color: themeDate ? Colors.grey : Colors.black, fontSize: 17),
        ),
      ],
    );
  }
}
