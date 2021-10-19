import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_najdiprevoz/interfaces/reservation-request-full-response.dart';
import 'package:mobile_najdiprevoz/shared-widgets/trip-card.dart';

var MOCK_REQUESTS = <ReservationRequestFullResponse>[
  new ReservationRequestFullResponse(
      1,
      'Vasko Jovanoski',
      1,
      ['Approve', 'Decline', 'Mark as seen'],
      'Struga',
      'Ohrid',
      DateTime.now(),
      'Doesnt Matter',
      'PENDING',
      'Please pick me up at John Lennons 27 Street',
      1,
      'ACTIVE'),
  new ReservationRequestFullResponse(
      1,
      'Vasko Jovanoski',
      1,
      ['Approve', 'Decline', 'Mark as seen'],
      'Struga',
      'Ohrid',
      DateTime.now(),
      'Doesnt Matter',
      'PENDING',
      'Please pick me up at John Lennons 27 Street',
      1,
      'ACTIVE'),
  new ReservationRequestFullResponse(
      1,
      'Vasko Jovanoski',
      1,
      ['Approve', 'Decline', 'Mark as seen'],
      'Struga',
      'Ohrid',
      DateTime.now(),
      'Doesnt Matter',
      'PENDING',
      'Please pick me up at John Lennons 27 Street',
      1,
      'ACTIVE'),
  new ReservationRequestFullResponse(
      1,
      'Vasko Jovanoski',
      1,
      ['Approve', 'Decline', 'Mark as seen'],
      'Struga',
      'Ohrid',
      DateTime.now(),
      'Doesnt Matter',
      'PENDING',
      'Please pick me up at John Lennons 27 Street',
      1,
      'ACTIVE'),
  new ReservationRequestFullResponse(
      1,
      'Vasko Jovanoski',
      1,
      ['Approve', 'Decline', 'Mark as seen'],
      'Struga',
      'Ohrid',
      DateTime.now(),
      'Doesnt Matter',
      'PENDING',
      'Please pick me up at John Lennons 27 Street',
      1,
      'ACTIVE')
];

class ReservationRequestsScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ReservationRequestsScreenStateWidget();
  }
}

class ReservationRequestsScreenStateWidget
    extends State<ReservationRequestsScreenWidget> {
  List<ReservationRequestFullResponse> reservations = MOCK_REQUESTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: reservations.map((e) => getReservationCard(e)).toList(),
    ));
  }

  Widget getReservationCard(ReservationRequestFullResponse req) {
    return Center(
        child: Container(
            padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 10),
            child: Card(
                // margin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      // leading: IconButton(
                      //     onPressed: () {
                      //       setState(() {
                      //         // var updatedNotification = notifications.firstWhere((element) => element == notification);
                      //         // updatedNotification.seen = !updatedNotification.seen;
                      //         // notifications[notifications.indexOf(notification)] = updatedNotification;
                      //       });
                      //     },
                      //     icon: Icon(
                      //       !req.allowedActions.contains('MARK_AS_SEEN')
                      //           ? Icons.notifications_none_rounded
                      //           : Icons.notifications_active_rounded,
                      //       color: req.requestStatus == 'PENDING'
                      //           ? Colors.blueGrey[900]
                      //           : Color.fromRGBO(225, 0, 117, 1),
                      //     )),
                      title: Text(req.requesterName),
                      subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              req.fromLocation + ' - ' + req.toLocation,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            Text(req.additionalDescription),
                            Divider(),
                            Row(
                              children: [
                                getAllowedBtns(req)
                              ],
                            )
                          ]),
                      isThreeLine: true,
                      trailing:
                          Column(children: [departureTime(req.departureTime)]),
                      // trailing: circleImage(notification),
                      // trailing: Row(
                      //   children: [Text('APPROVE')],
                      // ),
                    )
                  ],
                ))));
  }

  getAllowedBtns(ReservationRequestFullResponse req) {

    return ButtonBar(
      children: req.allowedActions.map((e) => TextButton(child: Text(e), onPressed: ()=>{})).toList()
    );
  }
}
