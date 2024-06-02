import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'instant_share_model.dart';
export 'instant_share_model.dart';

class InstantShareWidget extends StatefulWidget {
  const InstantShareWidget({super.key});

  @override
  State<InstantShareWidget> createState() => _InstantShareWidgetState();
}

class _InstantShareWidgetState extends State<InstantShareWidget> {
  late InstantShareModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstantShareModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'instant_share'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INSTANT_SHARE_instant_share_ON_INIT_STAT');
      if (currentUserLocationValue == null) {
        logFirebaseEvent('instant_share_request_permissions');
        await requestPermission(locationPermission);
      }
      logFirebaseEvent('instant_share_firestore_query');
      _model.schoolLoc = await querySchoolLocRecordOnce(
        queryBuilder: (schoolLocRecord) => schoolLocRecord.where(
          'school',
          isEqualTo: valueOrDefault(currentUserDocument?.school, ''),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      logFirebaseEvent('instant_share_update_page_state');
      setState(() {
        _model.schoollocalloc =
            _model.schoolLoc!.latAndLng.toList().cast<LatLng>();
      });
      logFirebaseEvent('instant_share_firestore_query_doc');
      _model.schoolLocDoc = (FFAppState().ListofLocationDocRef.isEmpty)? await querySchoolLocRecordOnce(
        queryBuilder: (schoolLocRecord) => schoolLocRecord.where(
          'school',
          isEqualTo: valueOrDefault(currentUserDocument?.school, ''),
        ),
        singleRecord: false,
      ) : 
      await Future.wait(
        FFAppState().ListofLocationDocRef.map((docRef) async {
            final docSnapshot = await docRef.get();
            return SchoolLocRecord.fromSnapshot(docSnapshot);
        }).toList(),
      );
      (FFAppState().ListofLocationDocRef.isEmpty)? print('empty') : print('notempty');
      setState(() {
        _model.schoollocallocDoc = _model.schoolLocDoc! ;
        for (int i = 0; i < _model.schoolLocDoc!.length; i++) {
          _model.schoollocAll.add(_model.schoollocallocDoc[i].latAndLng);
        }
      });    
    });

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }
    //print(_model.schoollocallocDoc);
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: valueOrDefault<double>(
                      MediaQuery.sizeOf(context).height,
                      725.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: false,
                      child: FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            setState(() => _model.googleMapsCenter = latLng),
                        initialLocation: _model.googleMapsCenter ??=
                            currentUserLocationValue!,
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: true,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => SizedBox(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        child: custom_widgets.MapWithOverlay(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          userLocation: currentUserLocationValue,
                          schoolLocation: _model.schoollocalloc,
                          schoolLocationDoc: _model.schoollocallocDoc,
                          schoolLocAll: _model.schoollocAll,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}