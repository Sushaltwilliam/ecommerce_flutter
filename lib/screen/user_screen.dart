import 'package:ecommerce/const/my_app_icons.dart';
import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:ecommerce/screen/wishlist_screen.dart';
import 'package:ecommerce/widget/wishlist_empty.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _value = false;
  var top = 0.0;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {});
    });
  }

// late List<UserListTileIcons> _icons;

  @override
  Widget build(BuildContext context) {
    // String formatDateTime(DateTime dateTime) {
    //   return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    // }
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Scaffold(
          backgroundColor: themeChange.dartTheme ? Colors.black : Colors.white,
          // appBar: AppBar(
          //   title: Text(formatDateTime(DateTime.now())),
          // ),
          body: Stack(
            children: [
              CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 4,
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(builder:
                        (BuildContext ctc, BoxConstraints constriants) {
                      top = constriants.biggest.height;

                      return Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.purple)),
                            image: top <= 80
                                ? null
                                : DecorationImage(
                                    image: NetworkImage(
                                        'https://gw.alipayobjects.com/zos/rmsportal/XzOPonWCsPjvgkrklCzo.png'),
                                    fit: BoxFit.fill),
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.purpleAccent],
                                begin: const FractionalOffset(0.0, 0.0),
                                end: const FractionalOffset(1.0, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp)),
                        child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          title: AnimatedOpacity(
                            opacity: top <= 100.0 ? 1.0 : 0,
                            duration: Duration(
                              milliseconds: 600,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1.0,
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://gw.alipayobjects.com/zos/rmsportal/XzOPonWCsPjvgkrklCzo.png'),
                                          fit: BoxFit.fill)),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Profile',
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: userTitle(title: 'User Bag'),
                        ),
                        Divider(
                          color: Colors.purple,
                          thickness: 1,
                        ),
                        Column(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(WishListScreen.routeName);
                                },
                                splashColor: Colors.purple,
                                child: ListTile(
                                  title: Text(
                                    'Wishlist',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  trailing: Icon(Icons.chevron_right_rounded),
                                  leading: Icon(EvaIcons.heartOutline),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                splashColor: Colors.purple,
                                child: ListTile(
                                  title: Text(
                                    'Cart',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  trailing: Icon(Icons.chevron_right_rounded),
                                  leading: Icon(EvaIcons.shoppingCart),
                                ),
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                                splashColor: Colors.purple,
                                child: ListTile(
                                  title: Text(
                                    'My Orders',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  trailing: Icon(Icons.chevron_right_rounded),
                                  leading: Icon(EvaIcons.shoppingBagOutline),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: userTitle(title: 'User Information')),
                            Divider(
                              thickness: 1,
                              color: Colors.purple,
                            ),
                            userListTile(context, 'Email', 'email Address', 0),
                            userListTile(context, 'Phone', 'phone', 1),
                            userListTile(
                                context, 'Shipping', 'Shipping Address', 2),
                            userListTile(context, 'Join Date', 'Date', 3),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: userTitle(title: 'User Setting')),
                            Divider(
                              thickness: 1,
                              color: Colors.purple,
                            ),
                            ListTileSwitch(
                              value: themeChange.dartTheme,
                              leading: Icon(EvaIcons.moon),
                              onChanged: (value) {
                                setState(() {
                                  themeChange.darkThemeVal = value;
                                });
                              },
                              visualDensity: VisualDensity.comfortable,
                              switchType: SwitchType.cupertino,
                              switchActiveColor: Colors.indigo,
                              title: Text(
                                'Dark Mode',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            userListTile(context, 'LogOut', '', 4),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildFab()
            ],
          )),
    );
  }

  // late List<UserListTileIcons> _userIons;
  List<IconData> _icons = [
    EvaIcons.emailOutline,
    EvaIcons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    EvaIcons.logOutOutline
  ];

  Widget _buildFab() {
// starting fab position
    final double defaultTopMargin = 175.0 - 4.0;
// pixels from top where scaling should start
    final double scalStart = 160.0;
// pixels from top where scaling should end
    final double scalEnd = scalStart / 2;

    double top = defaultTopMargin;
    double scal = 1.0;
    if (_controller.hasClients) {
      double offset = _controller.offset;
      top -= offset;
      if (offset < defaultTopMargin - scalStart) {
        // offset small => dont scal down
        scal = 1.0;
      } else if (offset < defaultTopMargin - scalEnd) {
        // offset between scalStart and scalend => scalDown
        scal = (defaultTopMargin - scalEnd - offset) / scalEnd;
      } else {
        // offset passed scalEnd => hide fab
        scal = 0.0;
      }
    }
    return Positioned(
      top: top,
      right: 16,
      child: Transform(
        transform: Matrix4.identity()..scale(scal),
        alignment: Alignment.center,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          heroTag: 'btn1',
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }

  Widget userListTile(
      BuildContext context, String title, String subTitle, int index) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.grey[200],
      child: ListTile(
        leading: Icon(
          _icons[index],
          color: Theme.of(context).buttonColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }

  Widget userTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
