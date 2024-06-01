import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseIndexListRecord extends FirestoreRecord {
  CourseIndexListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "school_name" field.
  String? _schoolName;
  String get schoolName => _schoolName ?? '';
  bool hasSchoolName() => _schoolName != null;

  // "course_index" field.
  List<String>? _courseIndex;
  List<String> get courseIndex => _courseIndex ?? const [];
  bool hasCourseIndex() => _courseIndex != null;

  void _initializeFields() {
    _index = castToType<int>(snapshotData['index']);
    _schoolName = snapshotData['school_name'] as String?;
    _courseIndex = getDataList(snapshotData['course_index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course_index_list');

  static Stream<CourseIndexListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseIndexListRecord.fromSnapshot(s));

  static Future<CourseIndexListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseIndexListRecord.fromSnapshot(s));

  static CourseIndexListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseIndexListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseIndexListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseIndexListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseIndexListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseIndexListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseIndexListRecordData({
  int? index,
  String? schoolName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'index': index,
      'school_name': schoolName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseIndexListRecordDocumentEquality
    implements Equality<CourseIndexListRecord> {
  const CourseIndexListRecordDocumentEquality();

  @override
  bool equals(CourseIndexListRecord? e1, CourseIndexListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.index == e2?.index &&
        e1?.schoolName == e2?.schoolName &&
        listEquality.equals(e1?.courseIndex, e2?.courseIndex);
  }

  @override
  int hash(CourseIndexListRecord? e) =>
      const ListEquality().hash([e?.index, e?.schoolName, e?.courseIndex]);

  @override
  bool isValidKey(Object? o) => o is CourseIndexListRecord;
}
