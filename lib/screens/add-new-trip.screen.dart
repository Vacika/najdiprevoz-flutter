import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_najdiprevoz/screens/home.screen.dart';
import 'package:mobile_najdiprevoz/shared-widgets/number-picker-widget.dart';

List<String> cities = ['Struga', 'Ohrid', 'Strumica', 'Skopje'];

class AddNewTripScreenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddNewTripScreenWidgetState();
  }
}

class AddNewTripScreenWidgetState extends State<AddNewTripScreenWidget> {
  String fromLocation;
  String toLocation;
  DateTime departureDate;
  int seatsAvailable;
  Map<String, bool> additionalInfo = {
    'hasAC': false,
    'petFriendly': false,
    'smokeFriendly': false,
    'middleSeatFree': false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Add new trip"),
        ),
        body: Center(
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      getDropdownButton(
                          fromLocation,
                          (chosenCity) => setState(() {
                                fromLocation = chosenCity;
                              }),
                          'From'),
                      getDropdownButton(
                          toLocation,
                          (chosenCity) => setState(() {
                                toLocation = chosenCity;
                              }),
                          'To'),
                      dateInputBox(),
                      CustomNumberPicker(
                        min: 1,
                        max: 6,
                        step: 1,
                        title: 'Available seats',
                        onChangeFn: (value) {
                          setState(() {
                            seatsAvailable = value;
                          });
                        },
                      ),
                      getCheckboxWidget(
                          "Air-Conditioning", 'hasAC', Icons.ac_unit),
                      getCheckboxWidget(
                          "Pet Friendly", 'petFriendly', Icons.pets),
                      getCheckboxWidget(
                          "Smoking allowed", 'smokeFriendly', Icons.smoke_free),
                      getCheckboxWidget("Only 2 people in back",
                          'middleSeatFree', Icons.airline_seat_recline_normal),
                      submitButton(),
                    ]))));
  }

  Widget getCheckboxWidget(
      String checkboxName, String checkboxUniqueKey, IconData icon) {
    return Expanded(
        child: CheckboxListTile(
            activeColor: Color.fromRGBO(225, 0, 117, 1),
            secondary: Icon(icon,
                color: additionalInfo[checkboxUniqueKey] == true
                    ? Color.fromRGBO(225, 0, 117, 1)
                    : Colors.blueGrey[900]),
            title: Text(checkboxName,
                style: TextStyle(
                    color: additionalInfo[checkboxUniqueKey] == true
                        ? Theme.of(context).primaryColor
                        : Colors.blueGrey[900])),
            value: additionalInfo[checkboxUniqueKey],
            onChanged: (bool newValue) {
              setState(() {
                additionalInfo[checkboxUniqueKey] = newValue;
              });
            }));
  }

  Widget getDropdownButton(buttonValue, Function onChangeFunc, hint) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: DropdownButton(
            hint: Text(hint),
            value: buttonValue,
            items: cities
                .map((city) => DropdownMenuItem(
                    child: Text(
                      city,
                      textAlign: TextAlign.center,
                    ),
                    value: city))
                .toList(),
            isExpanded: true,
            onChanged: (chosenCity) => onChangeFunc(chosenCity)));
  }

  Widget submitButton() {
    return TextButton(
      child: const Text(
        'SUBMIT',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Color.fromRGBO(225, 0, 117, 1)),
      ),
      onPressed: (() => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(initialIndex: 0)),
                    (Route<dynamic> route) => false)
          }),
    );
  }

  dateInputBox() {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: FlatButton(
            onPressed: () async {
              _selectDate(context);
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    departureDate != null
                        ? "${departureDate.toLocal()}".split(' ')[0]
                        : 'Choose a date',
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    textAlign: TextAlign.start))));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: departureDate != null ? departureDate : DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Color.fromRGBO(225, 0, 117, 1),
            accentColor: Color.fromRGBO(225, 0, 117, 1),
            colorScheme: ColorScheme.light(primary:Color.fromRGBO(225, 0, 117, 1)),
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary
            ),
          ),
          child: child,
        );
      },
      // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != departureDate)
      setState(() {
        departureDate = picked;
      });
  }
}
