import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRecord extends FirestoreRecord {
  CommentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  bool hasCourse() => _course != null;

  // "comment_time" field.
  DateTime? _commentTime;
  DateTime? get commentTime => _commentTime;
  bool hasCommentTime() => _commentTime != null;

  // "hard_score" field.
  double? _hardScore;
  double get hardScore => _hardScore ?? 0.0;
  bool hasHardScore() => _hardScore != null;

  // "chill_score" field.
  double? _chillScore;
  double get chillScore => _chillScore ?? 0.0;
  bool hasChillScore() => _chillScore != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _course = snapshotData['course'] as DocumentReference?;
    _commentTime = snapshotData['comment_time'] as DateTime?;
    _hardScore = castToType<double>(snapshotData['hard_score']);
    _chillScore = castToType<double>(snapshotData['chill_score']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment');

  static Stream<CommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRecord.fromSnapshot(s));

  static Future<CommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRecord.fromSnapshot(s));

  static CommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRecordData({
  String? content,
  DocumentReference? user,
  DocumentReference? course,
  DateTime? commentTime,
  double? hardScore,
  double? chillScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'user': user,
      'course': course,
      'comment_time': commentTime,
      'hard_score': hardScore,
      'chill_score': chillScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRecordDocumentEquality implements Equality<CommentRecord> {
  const CommentRecordDocumentEquality();

  @override
  bool equals(CommentRecord? e1, CommentRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.user == e2?.user &&
        e1?.course == e2?.course &&
        e1?.commentTime == e2?.commentTime &&
        e1?.hardScore == e2?.hardScore &&
        e1?.chillScore == e2?.chillScore;
  }

  @override
  int hash(CommentRecord? e) => const ListEquality().hash([
        e?.content,
        e?.user,
        e?.course,
        e?.commentTime,
        e?.hardScore,
        e?.chillScore
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRecord;
}
