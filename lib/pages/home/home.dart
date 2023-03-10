import 'package:table_calendar/table_calendar.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

 const HomePage({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {

    DateTime _selectedDay = DateTime.now();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 410.4,
            height: 844.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/background.png',
                ).image,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'SLEEPCATCHER',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.05, -0.7),
                    child: Container(
                      width: 499.9,
                      height: 219.2,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Image.asset(
                                  'assets/images/fond1.png',
                                  width: 207,
                                  height: 204.7,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                      AlignmentDirectional(-0.8, 0),
                                      child: Text(
                                        'Bonsoir',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      AlignmentDirectional(-0.6, 0),
                                      child: Text(
                                        'Alexis',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.05, 1),
                  child: Container(
                    width: double.infinity,
                    height: 543,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1C2B),
                      borderRadius: BorderRadius.circular(6),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: AlignmentDirectional(
                        -0.050000000000000044, 0.050000000000000044),
                    child: Align(
                      alignment: AlignmentDirectional(0, -0.65),
                      child: Container(
                        width: 365.3,
                        height: 426.3,
                        decoration: BoxDecoration(
                          color: Color(0x7F000000),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x3B000000),
                              offset: Offset(8, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment:
                        AlignmentDirectional(0, 0.050000000000000044),
                        child: Align(
                          alignment: AlignmentDirectional(0.2, 0.1),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0.65),
                                child: Text(
                                  'Mon dernier sommeil',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Align(
                                child: TableCalendar(
                                  headerStyle:
                                      HeaderStyle(formatButtonVisible: false,titleCentered: true),
                                  focusedDay: _selectedDay,
                                  firstDay: DateTime.utc(2023,1,01),
                                  lastDay: DateTime.utc(2024,1,01),
                                  calendarFormat: CalendarFormat.week,
                                  onDaySelected: (selectedDay, focusedDay) {
                                    print('La date sélectionnée est : $date');
                                    _selectedDay= selectedDay;
                                  },
                                ),

                              ),

                              Align(
                                alignment: AlignmentDirectional(0.8, 0),
                                child: Container(
                                  width: 474.8,
                                  height: 200.6,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              -0.45, 0),
                                          child: CircularPercentIndicator(
                                            percent: 0.8,
                                            radius: 75,
                                            lineWidth: 20,
                                            animation: true,
                                            progressColor: Colors.white,
                                            backgroundColor:
                                            Color(0xFF364562),
                                            center: Text(
                                              '\n8h 32\n5 cycles\n',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                        AlignmentDirectional(0, 0),
                                        child: Container(
                                          width: 184.3,
                                          height: 183.3,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -0.05, -0.1),
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.max,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, -1),
                                                  child: Text(
                                                    'Eveillé : 20 min',
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'Poppins',
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, -1),
                                                  child: Text(
                                                    'léger : 20 min',
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'Poppins',
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, -1),
                                                  child: Text(
                                                    'Profond : 20 min',
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'Poppins',
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                  AlignmentDirectional(
                                                      -1, -1),
                                                  child: Text(
                                                    'Paradoxale : 20 min',
                                                    style: FlutterFlowTheme
                                                        .of(context)
                                                        .bodyText1
                                                        .override(
                                                      fontFamily:
                                                      'Poppins',
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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






