import 'package:flutter/material.dart';
import 'package:mobile_najdiprevoz/screens/notifications.screen.dart';
import 'package:mobile_najdiprevoz/screens/requests.screen.dart';
import 'package:mobile_najdiprevoz/screens/settings.screen.dart';
import 'package:mobile_najdiprevoz/screens/trip-listing.screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.token, this.initialIndex = 0}) : super(key: key);

  final int initialIndex;
  final String token;

  factory HomeScreen.fromBase64(String token) => HomeScreen(token: token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> screens = <Widget>[
    TripListingScreen(),
    ReservationRequestsScreenWidget(),
    NotificationsScreenWidget(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: getTitle(_currentIndex),
      ),
      body: Center(child: screens.elementAt(_currentIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Trips'),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 1,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blueGrey[700],
        selectedItemColor: Colors.pink,
      ),
    );
  }

  getTitle(int currentIndex) {
    const appName = Text('TripBuddy', style: TextStyle(fontStyle: FontStyle.italic));
    switch (currentIndex) {
      case 0:
        return Row(
          children: [appName, Text('Trips')],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        );
      case 1:
        return Row(
          children: [appName, Text('Requests')],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        );
      case 2:
        return Row(
          children: [appName, Text('Notifications')],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        );
      case 3:
        return Row(
          children: [appName, Text('Settings')],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        );
    }
  }
}

// body: Center(
//   child: FutureBuilder(
//       future: HttpService()
//           .get('http://10.0.2.2:8080/api/notifications', context)
//           .catchError((error) => {log("VaskoERROR:$error")}),
//       builder: (context, snapshot) => snapshot.hasData
//           ? Column(
//               children: <Widget>[
//                 LogoutButton(),
//                 Text(snapshot.data.toString(),
//                     style: Theme.of(context).textTheme.display1)
//               ],
//             )
//           : snapshot.hasError
//               ? Text("An error occurred${snapshot.error}")
//               : CircularProgressIndicator()),
// ),

//#d81b60 primary
// P-Dark #a00037
// P-Light #ff5c8d

// SECONDARY WHITE
