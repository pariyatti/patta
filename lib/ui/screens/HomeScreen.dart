import 'package:flutter/material.dart';
import 'package:patta/resources/strings.dart';
import 'package:patta/ui/common_widgets/slivered_view.dart';
import 'package:patta/ui/screens/account/AccountScreen.dart';
import 'package:patta/ui/screens/today/TodayScreen.dart';

enum HomeScreenTab { TODAY, ACCOUNT }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenTab _tab = HomeScreenTab.TODAY;

  @override
  Widget build(BuildContext context) {
    int bottomNavigationBarIndex;
    String titleText;
    Widget bodyWidget;
    switch (_tab) {
      case HomeScreenTab.TODAY:
        bottomNavigationBarIndex = 0;
        titleText = '${strings['en'].labelToday}';
        bodyWidget = SliveredView(
          title: titleText,
          body: TodayScreen(),
        );
        break;
      case HomeScreenTab.ACCOUNT:
        bottomNavigationBarIndex = 1;
        titleText = '${strings['en'].labelAccount}';
        bodyWidget = SliveredView(
          title: titleText,
          body: AccountScreen(),
        );
        break;
    }

    return Scaffold(
      backgroundColor: Color(0xfff4efe7),
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationBarIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.today,
              color: Color(0xff6d695f),
            ),
            activeIcon: Icon(
              Icons.today,
              color: Color.fromARGB(255, 186, 86, 38),
            ),
            title: Text(
              strings['en'].labelToday,
              style: TextStyle(
                inherit: true,
                color: bottomNavigationBarIndex == 0
                    ? Color.fromARGB(255, 186, 86, 38)
                    : Color(0xff6d695f),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Color(0xff6d695f),
            ),
            activeIcon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 186, 86, 38),
            ),
            title: Text(
              strings['en'].labelAccount,
              style: TextStyle(
                inherit: true,
                color: bottomNavigationBarIndex == 1
                    ? Color.fromARGB(255, 186, 86, 38)
                    : Color(0xff6d695f),
              ),
            ),
          )
        ],
        onTap: (int tappedItemIndex) {
          this.setState(() {
            if (tappedItemIndex == 0) {
              this._tab = HomeScreenTab.TODAY;
            } else if (tappedItemIndex == 1) {
              this._tab = HomeScreenTab.ACCOUNT;
            }
          });
        },
      ),
    );
  }
}
