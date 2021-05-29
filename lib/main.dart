import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:weekday_selector/weekday_selector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int quantity = 1;
  int amt = 531;
  final values = List.filled(7, true);
  int deliveries = 10;
  var selectedDate = DateTime.now();
  int value = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [

          NumberPickerColumn(begin: 10, end: 30, jump: 10),
        ]),
        /*delimiter: [
          PickerDelimiter(child: Container(
            width: 30.0,
            alignment: Alignment.center,

          ))
        ],*/
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          setState(() {
            deliveries = picker.getSelectedValues()[0];
          });
        }
    ).showDialog(context);
  }
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10000))))) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 20,
        ),
        title: Align(
          alignment: Alignment(-1.2, 0.05),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
            child: Text(
              'Create subscription',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      color: Color(0xFFEDF9F9),
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: Alignment(-0.1, 0),
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.width * 0.35,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51RcxiQNx9L._SL1000_.jpg',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment(-0.05, 0.05),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  child: Text(
                                    'Tata Tea Gold(1 kg)',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                      child: Text(
                                        '₹$amt',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Text(
                                        '₹625',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF686262),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '.1pkt',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF686262),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment(-0.05, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFF9F9F9)),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment(-0.05, -0.15),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: Color(0xFF777777),
                          size: 29,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(-0.05, -0.15),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Quantity\nper day',
                          style: TextStyle(
                            color: Color(0xFF777777),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 125,
                    ),
                    Align(
                      alignment: Alignment(-0.05, -0.15),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Color(0xFF4FC0BA),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment(0.05, 0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity = quantity > 1 ? quantity - 1 : 1;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  color: quantity > 1
                                      ? Color(0xFF4FC0BA)
                                      : Colors.grey,
                                  size: 20,
                                ),
                                iconSize: 20,
                              ),
                            ),
                            Text(
                              '$quantity',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.05, 0),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Color(0xFF4FC0BA),
                                  size: 20,
                                ),
                                iconSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.05, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFF9F9F9)),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Icon(
                            Icons.loop,
                            color: Color(0xFF777777),
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            'Repeat',
                            style: TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(6, 20, 0, 0),
                          child: Text(
                            'DAILY',
                            style: TextStyle(
                              color: Color(0xFF4FC0BA),

                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 10, 0, 0),
                      child: WeekdaySelector(
                        onChanged: (int day) {
                          setState(() {
                            final index = day % 7;

                            values[index] = !values[index];
                          });
                        },
                        values: values,
                        selectedColor: Colors.white,
                        color: Color(0xFF4FC0BA),
                        selectedFillColor: Color(0xFF4FC0BA),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.05, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFF9F9F9)),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                              child: Icon(
                                Icons.update,
                                color: Color(0xFF777777),
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                              child: Text(
                                'Recharge/Top up',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45, 10, 0, 0),
                          child: Text(
                            '$deliveries Deliveries',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        showPickerNumber(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.05, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xFFF9F9F9)),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFF777777),
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 30, 0, 0),
                              child: Text(
                                'Start Date',
                                style: TextStyle(
                                  color: Color(0xFF777777),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(45, 10, 0, 0),
                          child: Text(
                            "${selectedDate.toLocal()}".split(' ')[0],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ConstrainedBox(
                    constraints:  BoxConstraints.tightFor(width:MediaQuery.of(context).size.width * 0.45 , height:MediaQuery.of(context).size.height * 0.20),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 5, 25),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Deliver Once"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color(0xFF4FC0BA),
                          side: BorderSide(color: Color(0xFF4FC0BA), width: 1),
                        ),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints:  BoxConstraints.tightFor(width:MediaQuery.of(context).size.width * 0.50 , height:MediaQuery.of(context).size.height * 0.20),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 10, 25),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            value = amt*quantity*deliveries;
                          });
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.SUCCES,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'Your Final Amount is',
                            desc: '₹$value',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          )..show();
                        },
                        child: Text("Subscribe"),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4FC0BA),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
