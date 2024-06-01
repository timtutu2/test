import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SchoolLocRecord extends FirestoreRecord {
  SchoolLocRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "school" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "Lat_and_Lng" field.
  List<LatLng>? _latAndLng;
  List<LatLng> get latAndLng => _latAndLng ?? const [];
  bool hasLatAndLng() => _latAndLng != null;

  // "center" field.
  LatLng? _center;
  LatLng? get center => _center;
  bool hasCenter() => _center != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _school = snapshotData['school'] as String?;
    _latAndLng = getDataList(snapshotData['Lat_and_Lng']);
    _center = snapshotData['center'] as LatLng?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('school_Loc');

  static Stream<SchoolLocRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolLocRecord.fromSnapshot(s));

  static Future<SchoolLocRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SchoolLocRecord.fromSnapshot(s));

  static SchoolLocRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolLocRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolLocRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolLocRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolLocRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolLocRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolLocRecordData({
  String? school,
  LatLng? center,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'school': school,
      'center': center,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolLocRecordDocumentEquality implements Equality<SchoolLocRecord> {
  const SchoolLocRecordDocumentEquality();

  @override
  bool equals(SchoolLocRecord? e1, SchoolLocRecord? e2) {
    const listEquality = ListEquality();
    return e1?.school == e2?.school &&
        listEquality.equals(e1?.latAndLng, e2?.latAndLng) &&
        e1?.center == e2?.center &&
        e1?.name == e2?.name;
  }

  @override
  int hash(SchoolLocRecord? e) =>
      const ListEquality().hash([e?.school, e?.latAndLng, e?.center, e?.name]);

  @override
  bool isValidKey(Object? o) => o is SchoolLocRecord;
}
