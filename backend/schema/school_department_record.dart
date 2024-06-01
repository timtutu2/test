import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class SchoolDepartmentRecord extends FirestoreRecord {
  SchoolDepartmentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "school" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "dep" field.
  List<String>? _dep;
  List<String> get dep => _dep ?? const [];
  bool hasDep() => _dep != null;

  // "course_dep" field.
  List<String>? _courseDep;
  List<String> get courseDep => _courseDep ?? const [];
  bool hasCourseDep() => _courseDep != null;

  void _initializeFields() {
    _school = snapshotData['school'] as String?;
    _dep = getDataList(snapshotData['dep']);
    _courseDep = getDataList(snapshotData['course_dep']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('school_department');

  static Stream<SchoolDepartmentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolDepartmentRecord.fromSnapshot(s));

  static Future<SchoolDepartmentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SchoolDepartmentRecord.fromSnapshot(s));

  static SchoolDepartmentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolDepartmentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolDepartmentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolDepartmentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolDepartmentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolDepartmentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolDepartmentRecordData({
  String? school,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'school': school,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolDepartmentRecordDocumentEquality
    implements Equality<SchoolDepartmentRecord> {
  const SchoolDepartmentRecordDocumentEquality();

  @override
  bool equals(SchoolDepartmentRecord? e1, SchoolDepartmentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.school == e2?.school &&
        listEquality.equals(e1?.dep, e2?.dep) &&
        listEquality.equals(e1?.courseDep, e2?.courseDep);
  }

  @override
  int hash(SchoolDepartmentRecord? e) =>
      const ListEquality().hash([e?.school, e?.dep, e?.courseDep]);

  @override
  bool isValidKey(Object? o) => o is SchoolDepartmentRecord;
}
