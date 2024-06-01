import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class InvAskListRecord extends FirestoreRecord {
  InvAskListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "inv_ask_member" field.
  List<DocumentReference>? _invAskMember;
  List<DocumentReference> get invAskMember => _invAskMember ?? const [];
  bool hasInvAskMember() => _invAskMember != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _invAskMember = getDataList(snapshotData['inv_ask_member']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inv_ask_list')
          : FirebaseFirestore.instance.collectionGroup('inv_ask_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inv_ask_list').doc(id);

  static Stream<InvAskListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvAskListRecord.fromSnapshot(s));

  static Future<InvAskListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvAskListRecord.fromSnapshot(s));

  static InvAskListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvAskListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvAskListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvAskListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvAskListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvAskListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvAskListRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class InvAskListRecordDocumentEquality implements Equality<InvAskListRecord> {
  const InvAskListRecordDocumentEquality();

  @override
  bool equals(InvAskListRecord? e1, InvAskListRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.invAskMember, e2?.invAskMember);
  }

  @override
  int hash(InvAskListRecord? e) => const ListEquality().hash([e?.invAskMember]);

  @override
  bool isValidKey(Object? o) => o is InvAskListRecord;
}
