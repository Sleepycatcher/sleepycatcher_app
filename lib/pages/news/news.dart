import 'package:flutter/material.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(


      child: Column(

    mainAxisSize: MainAxisSize.max,
    children: [
    SingleChildScrollView(

    child: Column(

    mainAxisSize: MainAxisSize.max,
    children: [
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
    Text(
    ' Categories',
    style:
    FlutterFlowTheme.of(context).bodyText2.override(
    fontFamily: 'Lexend Deca',
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    ),
    ),
    ],
    ),
    ),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 1, 0),
    child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
    Padding(
    padding:
    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
    child: Material(
    color: Colors.transparent,
    elevation: 2,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    child: Container(
    width: 69.3,
    height: 60,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    ),
    child: Align(
    alignment: AlignmentDirectional(0, 0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
    Align(
    alignment: AlignmentDirectional(0, 0),
    child: Text(
    'Sommeil',
    style: FlutterFlowTheme.of(context)
        .bodyText2
        .override(
    fontFamily: 'Lexend Deca',
    color: Color(0xFF95A1AC),
    fontSize: 14,
    fontWeight: FontWeight.normal,
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
    Text(
    'Articles',
    style:
    FlutterFlowTheme.of(context).bodyText2.override(
    fontFamily: 'Lexend Deca',
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    ),
    ),
    ],
    ),
    ),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
    child: Container(
    width: 355.2,
    height: 81.1,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8),
    shape: BoxShape.rectangle,
    ),
    child: Padding(
    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
    child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
    Expanded(
    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Class Name',
    style: FlutterFlowTheme.of(context)
        .title2
        .override(
    fontFamily: 'Lexend Deca',
    color: Color(0xFF090F13),
    fontSize: 22,
    fontWeight: FontWeight.bold,
    ),
    ),
    Text(
    'Sommeil',
    style: FlutterFlowTheme.of(context)
        .bodyText1
        .override(
    fontFamily: 'Lexend Deca',
    color: Color(0xFF39D2C0),
    fontSize: 14,
    fontWeight: FontWeight.normal,
    ),
    ),
    ],
    ),
    ),
    /*Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    FFButtonWidget(
    onPressed: () {
    print('Button pressed ...');
    },
    text: 'voir Article',
    options: FFButtonOptions(
    width: 130,
    height: 40,
    padding: EdgeInsetsDirectional.fromSTEB(
    0, 0, 0, 0),
    iconPadding:
    EdgeInsetsDirectional.fromSTEB(
    0, 0, 0, 0),
    color: FlutterFlowTheme.of(context)
        .primaryColor,
    textStyle: FlutterFlowTheme.of(context)
        .subtitle2
        .override(
    fontFamily: 'Poppins',
    color: Colors.white,
    ),
    borderSide: BorderSide(
    color: Colors.transparent,
    width: 1,
    ),
    borderRadius: BorderRadius.circular(8),
    ),
    ),
    ],
    ),*/
    ],
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


