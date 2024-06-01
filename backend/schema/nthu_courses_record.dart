import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NthuCoursesRecord extends FirestoreRecord {
  NthuCoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chineseName" field.
  String? _chineseName;
  String get chineseName => _chineseName ?? '';
  bool hasChineseName() => _chineseName != null;

  // "englishName" field.
  String? _englishName;
  String get englishName => _englishName ?? '';
  bool hasEnglishName() => _englishName != null;

  // "time" field.
  List<String>? _time;
  List<String> get time => _time ?? const [];
  bool hasTime() => _time != null;

  // "classroom" field.
  String? _classroom;
  String get classroom => _classroom ?? '';
  bool hasClassroom() => _classroom != null;

  // "teacher" field.
  String? _teacher;
  String get teacher => _teacher ?? '';
  bool hasTeacher() => _teacher != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "time_string" field.
  String? _timeString;
  String get timeString => _timeString ?? '';
  bool hasTimeString() => _timeString != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "chinese_dep" field.
  String? _chineseDep;
  String get chineseDep => _chineseDep ?? '';
  bool hasChineseDep() => _chineseDep != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  bool hasIndex() => _index != null;

  // "credit" field.
  double? _credit;
  double get credit => _credit ?? 0.0;
  bool hasCredit() => _credit != null;

  // "big_open_chat" field.
  DocumentReference? _bigOpenChat;
  DocumentReference? get bigOpenChat => _bigOpenChat;
  bool hasBigOpenChat() => _bigOpenChat != null;

  // "photo_of_course" field.
  String? _photoOfCourse;
  String get photoOfCourse => _photoOfCourse ?? '';
  bool hasPhotoOfCourse() => _photoOfCourse != null;

  // "All_comment" field.
  List<DocumentReference>? _allComment;
  List<DocumentReference> get allComment => _allComment ?? const [];
  bool hasAllComment() => _allComment != null;

  void _initializeFields() {
    _chineseName = snapshotData['chineseName'] as String?;
    _englishName = snapshotData['englishName'] as String?;
    _time = getDataList(snapshotData['time']);
    _classroom = snapshotData['classroom'] as String?;
    _teacher = snapshotData['teacher'] as String?;
    _number = snapshotData['number'] as String?;
    _timeString = snapshotData['time_string'] as String?;
    _color = snapshotData['color'] as String?;
    _chineseDep = snapshotData['chinese_dep'] as String?;
    _index = castToType<int>(snapshotData['index']);
    _credit = castToType<double>(snapshotData['credit']);
    _bigOpenChat = snapshotData['big_open_chat'] as DocumentReference?;
    _photoOfCourse = snapshotData['photo_of_course'] as String?;
    _allComment = getDataList(snapshotData['All_comment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nthu_courses');

  static Stream<NthuCoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NthuCoursesRecord.fromSnapshot(s));

  static Future<NthuCoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NthuCoursesRecord.fromSnapshot(s));

  static NthuCoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NthuCoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NthuCoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NthuCoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NthuCoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NthuCoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNthuCoursesRecordData({
  String? chineseName,
  String? englishName,
  String? classroom,
  String? teacher,
  String? number,
  String? timeString,
  String? color,
  String? chineseDep,
  int? index,
  double? credit,
  DocumentReference? bigOpenChat,
  String? photoOfCourse,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chineseName': chineseName,
      'englishName': englishName,
      'classroom': classroom,
      'teacher': teacher,
      'number': number,
      'time_string': timeString,
      'color': color,
      'chinese_dep': chineseDep,
      'index': index,
      'credit': credit,
      'big_open_chat': bigOpenChat,
      'photo_of_course': photoOfCourse,
    }.withoutNulls,
  );

  return firestoreData;
}

class NthuCoursesRecordDocumentEquality implements Equality<NthuCoursesRecord> {
  const NthuCoursesRecordDocumentEquality();

  @override
  bool equals(NthuCoursesRecord? e1, NthuCoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chineseName == e2?.chineseName &&
        e1?.englishName == e2?.englishName &&
        listEquality.equals(e1?.time, e2?.time) &&
        e1?.classroom == e2?.classroom &&
        e1?.teacher == e2?.teacher &&
        e1?.number == e2?.number &&
        e1?.timeString == e2?.timeString &&
        e1?.color == e2?.color &&
        e1?.chineseDep == e2?.chineseDep &&
        e1?.index == e2?.index &&
        e1?.credit == e2?.credit &&
        e1?.bigOpenChat == e2?.bigOpenChat &&
        e1?.photoOfCourse == e2?.photoOfCourse &&
        listEquality.equals(e1?.allComment, e2?.allComment);
  }

  @override
  int hash(NthuCoursesRecord? e) => const ListEquality().hash([
        e?.chineseName,
        e?.englishName,
        e?.time,
        e?.classroom,
        e?.teacher,
        e?.number,
        e?.timeString,
        e?.color,
        e?.chineseDep,
        e?.index,
        e?.credit,
        e?.bigOpenChat,
        e?.photoOfCourse,
        e?.allComment
      ]);

  @override
  bool isValidKey(Object? o) => o is NthuCoursesRecord;
}
