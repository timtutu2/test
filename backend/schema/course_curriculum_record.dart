import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CourseCurriculumRecord extends FirestoreRecord {
  CourseCurriculumRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "course_ref" field.
  List<DocumentReference>? _courseRef;
  List<DocumentReference> get courseRef => _courseRef ?? const [];
  bool hasCourseRef() => _courseRef != null;

  // "course_day_time" field.
  List<String>? _courseDayTime;
  List<String> get courseDayTime => _courseDayTime ?? const [];
  bool hasCourseDayTime() => _courseDayTime != null;

  // "custom_color" field.
  List<CustomColorStruct>? _customColor;
  List<CustomColorStruct> get customColor => _customColor ?? const [];
  bool hasCustomColor() => _customColor != null;

  // "curr_index" field.
  List<String>? _currIndex;
  List<String> get currIndex => _currIndex ?? const [];
  bool hasCurrIndex() => _currIndex != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _courseRef = getDataList(snapshotData['course_ref']);
    _courseDayTime = getDataList(snapshotData['course_day_time']);
    _customColor = getStructList(
      snapshotData['custom_color'],
      CustomColorStruct.fromMap,
    );
    _currIndex = getDataList(snapshotData['curr_index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('course_curriculum');

  static Stream<CourseCurriculumRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseCurriculumRecord.fromSnapshot(s));

  static Future<CourseCurriculumRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CourseCurriculumRecord.fromSnapshot(s));

  static CourseCurriculumRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourseCurriculumRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseCurriculumRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseCurriculumRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseCurriculumRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseCurriculumRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseCurriculumRecordData({
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseCurriculumRecordDocumentEquality
    implements Equality<CourseCurriculumRecord> {
  const CourseCurriculumRecordDocumentEquality();

  @override
  bool equals(CourseCurriculumRecord? e1, CourseCurriculumRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.courseRef, e2?.courseRef) &&
        listEquality.equals(e1?.courseDayTime, e2?.courseDayTime) &&
        listEquality.equals(e1?.customColor, e2?.customColor) &&
        listEquality.equals(e1?.currIndex, e2?.currIndex);
  }

  @override
  int hash(CourseCurriculumRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.courseRef,
        e?.courseDayTime,
        e?.customColor,
        e?.currIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseCurriculumRecord;
}
