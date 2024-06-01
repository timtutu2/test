import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ScoreRecord extends FirestoreRecord {
  ScoreRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "score_provide_by_user" field.
  List<CourseScoreStruct>? _scoreProvideByUser;
  List<CourseScoreStruct> get scoreProvideByUser =>
      _scoreProvideByUser ?? const [];
  bool hasScoreProvideByUser() => _scoreProvideByUser != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _scoreProvideByUser = getStructList(
      snapshotData['score_provide_by_user'],
      CourseScoreStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('score')
          : FirebaseFirestore.instance.collectionGroup('score');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('score').doc(id);

  static Stream<ScoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScoreRecord.fromSnapshot(s));

  static Future<ScoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScoreRecord.fromSnapshot(s));

  static ScoreRecord fromSnapshot(DocumentSnapshot snapshot) => ScoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScoreRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ScoreRecordDocumentEquality implements Equality<ScoreRecord> {
  const ScoreRecordDocumentEquality();

  @override
  bool equals(ScoreRecord? e1, ScoreRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.scoreProvideByUser, e2?.scoreProvideByUser);
  }

  @override
  int hash(ScoreRecord? e) =>
      const ListEquality().hash([e?.scoreProvideByUser]);

  @override
  bool isValidKey(Object? o) => o is ScoreRecord;
}
