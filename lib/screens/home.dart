import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  DateTimeRange? calendarSelectedDay;
  String? dropDownValue1;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFFFCBAE2),
        automaticallyImplyLeading: true,
        title: Text(
          'Hydration Tracker',
          textAlign: TextAlign.start,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 1,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 150, 10),
                  child: Text(
                    'Drink some water !',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: LinearPercentIndicator(
                  percent: 1,
                  width: 90,
                  lineHeight: 40,
                  animation: true,
                  progressColor: Color(0xFF8BF75C),
                  backgroundColor: Color(0xFFCEFFB6),
                  center: Text(
                    '50%',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                  ),
                  barRadius: Radius.circular(10),
                  padding: EdgeInsets.zero,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
                    child: FlutterFlowDropDown<String>(
                      initialOption: dropDownValue1 ??= 'Day',
                      options: ['Every Day'],
                      onChanged: (val) => setState(() => dropDownValue1 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Repeat',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
                    child: FlutterFlowDropDown<String>(
                      initialOption: dropDownValue2 ??= 'Day',
                      options: ['Every Day'],
                      onChanged: (val) => setState(() => dropDownValue2 = val),
                      width: 180,
                      height: 50,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Time',
                      fillColor: Colors.white,
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 0,
                      margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      hidesUnderline: true,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: FlutterFlowCalendar(
                  color: Color(0xFF39EB4D),
                  weekFormat: false,
                  weekStartsMonday: false,
                  onChange: (DateTimeRange? newSelectedDate) {
                    setState(() => calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: TextStyle(),
                  dayOfWeekStyle: TextStyle(),
                  dateStyle: TextStyle(),
                  selectedDateStyle: TextStyle(),
                  inactiveDateStyle: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
