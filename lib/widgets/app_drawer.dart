import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_kids/screens/registration.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_kids/utility/color_box.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          AppBar(
            title: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 25,
                    color: Colors.white,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(' Spectrum'),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, size: 19.0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            backgroundColor: ColorBox.primaryColor,
            automaticallyImplyLeading: false,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: ColorBox.primaryColor,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      DrawerListTiles(
                        page: 0,
                        title: 'Library',
                        icons: FluentIcons.home_24_regular,
                      ),
                      DrawerListTiles(
                        page: 1,
                        title: 'Downloads',
                        icons: FluentIcons.arrow_download_24_regular,
                      ),
                      DrawerListTiles(
                        page: 2,
                        title: 'Notebook',
                        icons: FluentIcons.note_24_regular,
                      ),
                      DrawerListTiles(
                        page: 3,
                        title: 'Games',
                        icons: FluentIcons.games_24_regular,
                      ),
                      // DrawerListTiles(
                      //   page: 4,
                      //   title: 'Favourite',
                      //   icons: FluentIcons.book_star_24_regular,
                      //   screen: FavoriteScreen(),
                      // ),
                      // DrawerListTiles(
                      //   page: 4,
                      //   title: 'Kids',
                      //   icons: FluentIcons.learning_app_20_regular,
                      //   screen: KidHomeScreen(),
                      // ),
                      // DrawerListTiles(
                      //   page: 4,
                      //   title: 'Support',
                      //   icons: FluentIcons.person_support_16_regular,
                      //   screen: ContactSupportScreen(),
                      // ),
                      // DrawerListTiles(
                      //   page: 4,
                      //   title: 'Settings',
                      //   icons: Icons.settings,
                      //   screen: SettingsScreen(),
                      // ),
                      // SizedBox(height: 20.0),
                      DrawerListTiles(
                        page: 5,
                        icons: FluentIcons.sign_out_24_regular,
                        title: 'Logout',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerListTiles extends StatelessWidget {
  final IconData? icons;
  final String? title;
  final int? page;
  final Widget? screen;

  const DrawerListTiles({
    @required this.page,
    @required this.icons,
    @required this.title,
    this.screen,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (page! >= 0 && page! <= 3) {
          // context.read<DrawerBottomNavigation>().selectedindex(page);
          Navigator.pop(context);
        } else if (page == 4) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
        } else if (page == 5) {
          // Navigator.pop(context);

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
        }
      },
      child: ListTile(
        leading: Icon(icons, color: Colors.white),
        title: Text(
          title!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
