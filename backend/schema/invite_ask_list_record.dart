import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InviteAskListRecord extends FirestoreRecord {
  InviteAskListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "resceiver" field.
  DocumentReference? _resceiver;
  DocumentReference? get resceiver => _resceiver;
  bool hasResceiver() => _resceiver != null;

  // "sender_intro" field.
  String? _senderIntro;
  String get senderIntro => _senderIntro ?? '';
  bool hasSenderIntro() => _senderIntro != null;

  // "send_time" field.
  DateTime? _sendTime;
  DateTime? get sendTime => _sendTime;
  bool hasSendTime() => _sendTime != null;

  // "invite_intro_photo" field.
  String? _inviteIntroPhoto;
  String get inviteIntroPhoto => _inviteIntroPhoto ?? '';
  bool hasInviteIntroPhoto() => _inviteIntroPhoto != null;

  // "inv_post" field.
  DocumentReference? _invPost;
  DocumentReference? get invPost => _invPost;
  bool hasInvPost() => _invPost != null;

  // "have_seen" field.
  bool? _haveSeen;
  bool get haveSeen => _haveSeen ?? false;
  bool hasHaveSeen() => _haveSeen != null;

  // "invite_status" field.
  int? _inviteStatus;
  int get inviteStatus => _inviteStatus ?? 0;
  bool hasInviteStatus() => _inviteStatus != null;

  // "inv_course2" field.
  DocumentReference? _invCourse2;
  DocumentReference? get invCourse2 => _invCourse2;
  bool hasInvCourse2() => _invCourse2 != null;

  // "user_can_write" field.
  List<DocumentReference>? _userCanWrite;
  List<DocumentReference> get userCanWrite => _userCanWrite ?? const [];
  bool hasUserCanWrite() => _userCanWrite != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _resceiver = snapshotData['resceiver'] as DocumentReference?;
    _senderIntro = snapshotData['sender_intro'] as String?;
    _sendTime = snapshotData['send_time'] as DateTime?;
    _inviteIntroPhoto = snapshotData['invite_intro_photo'] as String?;
    _invPost = snapshotData['inv_post'] as DocumentReference?;
    _haveSeen = snapshotData['have_seen'] as bool?;
    _inviteStatus = castToType<int>(snapshotData['invite_status']);
    _invCourse2 = snapshotData['inv_course2'] as DocumentReference?;
    _userCanWrite = getDataList(snapshotData['user_can_write']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invite_ask_list');

  static Stream<InviteAskListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InviteAskListRecord.fromSnapshot(s));

  static Future<InviteAskListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InviteAskListRecord.fromSnapshot(s));

  static InviteAskListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InviteAskListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InviteAskListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InviteAskListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InviteAskListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InviteAskListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInviteAskListRecordData({
  DocumentReference? sender,
  DocumentReference? resceiver,
  String? senderIntro,
  DateTime? sendTime,
  String? inviteIntroPhoto,
  DocumentReference? invPost,
  bool? haveSeen,
  int? inviteStatus,
  DocumentReference? invCourse2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'resceiver': resceiver,
      'sender_intro': senderIntro,
      'send_time': sendTime,
      'invite_intro_photo': inviteIntroPhoto,
      'inv_post': invPost,
      'have_seen': haveSeen,
      'invite_status': inviteStatus,
      'inv_course2': invCourse2,
    }.withoutNulls,
  );

  return firestoreData;
}

class InviteAskListRecordDocumentEquality
    implements Equality<InviteAskListRecord> {
  const InviteAskListRecordDocumentEquality();

  @override
  bool equals(InviteAskListRecord? e1, InviteAskListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.sender == e2?.sender &&
        e1?.resceiver == e2?.resceiver &&
        e1?.senderIntro == e2?.senderIntro &&
        e1?.sendTime == e2?.sendTime &&
        e1?.inviteIntroPhoto == e2?.inviteIntroPhoto &&
        e1?.invPost == e2?.invPost &&
        e1?.haveSeen == e2?.haveSeen &&
        e1?.inviteStatus == e2?.inviteStatus &&
        e1?.invCourse2 == e2?.invCourse2 &&
        listEquality.equals(e1?.userCanWrite, e2?.userCanWrite);
  }

  @override
  int hash(InviteAskListRecord? e) => const ListEquality().hash([
        e?.sender,
        e?.resceiver,
        e?.senderIntro,
        e?.sendTime,
        e?.inviteIntroPhoto,
        e?.invPost,
        e?.haveSeen,
        e?.inviteStatus,
        e?.invCourse2,
        e?.userCanWrite
      ]);

  @override
  bool isValidKey(Object? o) => o is InviteAskListRecord;
}
