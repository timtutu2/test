import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'instant_share_widget.dart' show InstantShareWidget;
import 'package:flutter/material.dart';

class InstantShareModel extends FlutterFlowModel<InstantShareWidget> {
  ///  Local state fields for this page.

  List<LatLng> schoollocalloc = [];
  void addToSchoollocalloc(LatLng item) => schoollocalloc.add(item);
  void removeFromSchoollocalloc(LatLng item) => schoollocalloc.remove(item);
  void removeAtIndexFromSchoollocalloc(int index) =>
      schoollocalloc.removeAt(index);
  void insertAtIndexInSchoollocalloc(int index, LatLng item) =>
      schoollocalloc.insert(index, item);
  void updateSchoollocallocAtIndex(int index, Function(LatLng) updateFn) =>
      schoollocalloc[index] = updateFn(schoollocalloc[index]);

  List<List<LatLng>> schoollocAll = [];
  void addToschoollocAll(List<LatLng> item) => schoollocAll.add(item);
  void removeFromschoollocAll(List<LatLng> item) => schoollocAll.remove(item);
  void removeAtIndexFromschoollocAll(int index) =>
      schoollocAll.removeAt(index);
  void insertAtIndexInschoollocAll(int index, List<LatLng> item) =>
      schoollocAll.insert(index, item);
  void updateschoollocAllAtIndex(int index, Function(List<LatLng>) updateFn) =>
      schoollocAll[index] = updateFn(schoollocAll[index]);

  List<SchoolLocRecord> schoollocallocDoc = [];
  void addToSchoollocallocDoc(SchoolLocRecord item) =>
      schoollocallocDoc.add(item);
  void removeFromSchoollocallocDoc(SchoolLocRecord item) =>
      schoollocallocDoc.remove(item);
  void removeAtIndexFromSchoollocallocDoc(int index) =>
      schoollocallocDoc.removeAt(index);
  void insertAtIndexInSchoollocallocDoc(int index, SchoolLocRecord item) =>
      schoollocallocDoc.insert(index, item);
  void updateSchoollocallocDocAtIndex(
          int index, Function(SchoolLocRecord) updateFn) =>
      schoollocallocDoc[index] = updateFn(schoollocallocDoc[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in instant_share widget.
  SchoolLocRecord? schoolLoc;
  // Stores action output result for [Firestore Query - Query a collection] action in instant_share widget.
  List<SchoolLocRecord>? schoolLocDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in instant_share widget.
  //List<SchoolLocRecord>? schoolLocDoc;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}