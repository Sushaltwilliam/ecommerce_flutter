import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/screen/Inner_screen/brand_navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrandNavigationScreen extends StatefulWidget {
  static const routeName = 'brandNavigationScreen';
  // final int index;
  // BrandNavigationScreen({required this.index});

  @override
  _BrandNavigationScreenState createState() => _BrandNavigationScreenState();
}

class _BrandNavigationScreenState extends State<BrandNavigationScreen> {
  int _selectedIndex = 0;
  final padding = 8.0;
  late String routeArg;
  late String brand;

  @override
  void didChangeDependencies() {
    routeArg = ModalRoute.of(context)!.settings.arguments.toString();
    _selectedIndex = int.parse(routeArg.substring(1, 2));
    print(routeArg.toString());
    if (_selectedIndex == 0) {
      setState(() {
        brand = 'Addidas';
      });
    }
    if (_selectedIndex == 1) {
      setState(() {
        brand = 'Dell';
      });
    }
    if (_selectedIndex == 2) {
      setState(() {
        brand = 'HM';
      });
    }
    if (_selectedIndex == 3) {
      setState(() {
        brand = 'Samsung';
      });
    }
    if (_selectedIndex == 4) {
      setState(() {
        brand = 'Hawai';
      });
    }
    if (_selectedIndex == 5) {
      setState(() {
        brand = 'All';
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (ctx, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: NavigationRail(
                    trailing: SizedBox(
                      height: 80,
                    ),
                    minWidth: 60,
                    groupAlignment: 1,
                    selectedIndex: _selectedIndex,
                    onDestinationSelected: (index) {
                      setState(() {
                        _selectedIndex = index;
                        if (_selectedIndex == 0) {
                          setState(() {
                            brand = 'Addidas';
                          });
                        }
                        if (_selectedIndex == 1) {
                          setState(() {
                            brand = 'Dell';
                          });
                        }
                        if (_selectedIndex == 2) {
                          setState(() {
                            brand = 'HM';
                          });
                        }
                        if (_selectedIndex == 3) {
                          setState(() {
                            brand = 'Samsung';
                          });
                        }
                        if (_selectedIndex == 4) {
                          setState(() {
                            brand = 'Hawai';
                          });
                        }
                        if (_selectedIndex == 5) {
                          setState(() {
                            brand = 'All';
                          });
                        }
                        print(brand);
                      });
                    },
                    labelType: NavigationRailLabelType.all,
                    leading: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage(
                                'https://d1aettbyeyfilo.cloudfront.net/dataskills/unsplash_1602675288.jpg'),
                          ),
                        ),
                      ],
                    ),
                    selectedLabelTextStyle: GoogleFonts.robotoSlab(
                        color: Colors.purple,
                        fontSize: 18,
                        letterSpacing: 1.2,
                        decoration: TextDecoration.underline),
                    unselectedLabelTextStyle: GoogleFonts.robotoSlab(
                      color: themeChange ? Colors.white : Colors.black,
                      fontSize: 15,
                      letterSpacing: 1.2,
                    ),
                    destinations: [
                      buildRotatedtextRailDestionation('Adidas', padding),
                      buildRotatedtextRailDestionation('Dell', padding),
                      buildRotatedtextRailDestionation('H & M', padding),
                      buildRotatedtextRailDestionation('Samsung', padding),
                      buildRotatedtextRailDestionation('Hyuawai', padding),
                      buildRotatedtextRailDestionation('All', padding),
                    ],
                  ),
                ),
              ),
            );
          }),
          Flexible(child: ContentSpace(context, brand))
        ],
      ),
    );
  }

  NavigationRailDestination buildRotatedtextRailDestionation(
      String text, double padding) {
    return NavigationRailDestination(
        icon: SizedBox.shrink(),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}

class ContentSpace extends StatelessWidget {
  final String brand;
  ContentSpace(BuildContext context, this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7, right: 7, bottom: 7, top: 10),
      child: Container(
        child: AnimationLimiter(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 2500),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    verticalOffset: 50,
                    child: FadeInAnimation(
                      child: BrandNavigationRail(),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
