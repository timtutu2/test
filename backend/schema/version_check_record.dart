import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class VersionCheckRecord extends FirestoreRecord {
  VersionCheckRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "lastest_version" field.
  String? _lastestVersion;
  String get lastestVersion => _lastestVersion ?? '';
  bool hasLastestVersion() => _lastestVersion != null;

  void _initializeFields() {
    _lastestVersion = snapshotData['lastest_version'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Version_check');

  static Stream<VersionCheckRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VersionCheckRecord.fromSnapshot(s));

  static Future<VersionCheckRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VersionCheckRecord.fromSnapshot(s));

  static VersionCheckRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VersionCheckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VersionCheckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VersionCheckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VersionCheckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VersionCheckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVersionCheckRecordData({
  String? lastestVersion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastest_version': lastestVersion,
    }.withoutNulls,
  );

  return firestoreData;
}

class VersionCheckRecordDocumentEquality
    implements Equality<VersionCheckRecord> {
  const VersionCheckRecordDocumentEquality();

  @override
  bool equals(VersionCheckRecord? e1, VersionCheckRecord? e2) {
    return e1?.lastestVersion == e2?.lastestVersion;
  }

  @override
  int hash(VersionCheckRecord? e) =>
      const ListEquality().hash([e?.lastestVersion]);

  @override
  bool isValidKey(Object? o) => o is VersionCheckRecord;
}
