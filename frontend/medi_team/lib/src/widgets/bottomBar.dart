import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medi_team/src/api/navigatorPush.dart' as NavigatorPush;

import 'package:flutter/material.dart';
import 'package:medi_team/src/screens/chatbot.dart';
import 'package:medi_team/src/screens/covid19.dart';
import 'package:medi_team/src/screens/homePageWithAuth.dart';
import 'package:medi_team/src/screens/homePageWithoutAuth.dart';
import 'package:medi_team/src/screens/pictures.dart';

import 'package:medi_team/src/api/auth.dart' as auth;

switchScreen(int index, BuildContext context) async {
  switch (index) {
    case 0:
      String token = await auth.getToken();
      NavigatorPush.navigatorPushReplacement(context,
          (token == null ? HomePageWithoutAuth() : HomePageWithAuth()));
      break;
    case 1:
      NavigatorPush.navigatorPushReplacement(context, Pictures());
      break;
    case 2:
      NavigatorPush.navigatorPushReplacement(context, Chatbot());
      break;
    case 3:
      NavigatorPush.navigatorPushReplacement(context, Covid19());
      break;
  }
}

BottomNavigationBar bottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    selectedFontSize: 10.25,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.cyan[700],
    currentIndex: 0,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "INICIO",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.photo_library),
        label: "IMÁGENES",
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.robot),
        label: "CHAT BOT",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.report_problem),
        label: "COVID-19",
      ),
    ],
    onTap: (int index) async {
      await switchScreen(index, context);
    },
  );
}
