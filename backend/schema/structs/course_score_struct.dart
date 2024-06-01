// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseScoreStruct extends FFFirebaseStruct {
  CourseScoreStruct({
    DocumentReference? course,
    double? chillScore,
    double? hardLevel,
    DocumentReference? userProvide,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _course = course,
        _chillScore = chillScore,
        _hardLevel = hardLevel,
        _userProvide = userProvide,
        super(firestoreUtilData);

  // "course" field.
  DocumentReference? _course;
  DocumentReference? get course => _course;
  set course(DocumentReference? val) => _course = val;
  bool hasCourse() => _course != null;

  // "chill_score" field.
  double? _chillScore;
  double get chillScore => _chillScore ?? 0.0;
  set chillScore(double? val) => _chillScore = val;
  void incrementChillScore(double amount) => _chillScore = chillScore + amount;
  bool hasChillScore() => _chillScore != null;

  // "hard_level" field.
  double? _hardLevel;
  double get hardLevel => _hardLevel ?? 0.0;
  set hardLevel(double? val) => _hardLevel = val;
  void incrementHardLevel(double amount) => _hardLevel = hardLevel + amount;
  bool hasHardLevel() => _hardLevel != null;

  // "user_provide" field.
  DocumentReference? _userProvide;
  DocumentReference? get userProvide => _userProvide;
  set userProvide(DocumentReference? val) => _userProvide = val;
  bool hasUserProvide() => _userProvide != null;

  static CourseScoreStruct fromMap(Map<String, dynamic> data) =>
      CourseScoreStruct(
        course: data['course'] as DocumentReference?,
        chillScore: castToType<double>(data['chill_score']),
        hardLevel: castToType<double>(data['hard_level']),
        userProvide: data['user_provide'] as DocumentReference?,
      );

  static CourseScoreStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseScoreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'course': _course,
        'chill_score': _chillScore,
        'hard_level': _hardLevel,
        'user_provide': _userProvide,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'course': serializeParam(
          _course,
          ParamType.DocumentReference,
        ),
        'chill_score': serializeParam(
          _chillScore,
          ParamType.double,
        ),
        'hard_level': serializeParam(
          _hardLevel,
          ParamType.double,
        ),
        'user_provide': serializeParam(
          _userProvide,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CourseScoreStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseScoreStruct(
        course: deserializeParam(
          data['course'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['nthu_courses'],
        ),
        chillScore: deserializeParam(
          data['chill_score'],
          ParamType.double,
          false,
        ),
        hardLevel: deserializeParam(
          data['hard_level'],
          ParamType.double,
          false,
        ),
        userProvide: deserializeParam(
          data['user_provide'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'CourseScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseScoreStruct &&
        course == other.course &&
        chillScore == other.chillScore &&
        hardLevel == other.hardLevel &&
        userProvide == other.userProvide;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([course, chillScore, hardLevel, userProvide]);
}

CourseScoreStruct createCourseScoreStruct({
  DocumentReference? course,
  double? chillScore,
  double? hardLevel,
  DocumentReference? userProvide,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CourseScoreStruct(
      course: course,
      chillScore: chillScore,
      hardLevel: hardLevel,
      userProvide: userProvide,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CourseScoreStruct? updateCourseScoreStruct(
  CourseScoreStruct? courseScore, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    courseScore
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCourseScoreStructData(
  Map<String, dynamic> firestoreData,
  CourseScoreStruct? courseScore,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (courseScore == null) {
    return;
  }
  if (courseScore.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && courseScore.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final courseScoreData =
      getCourseScoreFirestoreData(courseScore, forFieldValue);
  final nestedData =
      courseScoreData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = courseScore.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCourseScoreFirestoreData(
  CourseScoreStruct? courseScore, [
  bool forFieldValue = false,
]) {
  if (courseScore == null) {
    return {};
  }
  final firestoreData = mapToFirestore(courseScore.toMap());

  // Add any Firestore field values
  courseScore.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCourseScoreListFirestoreData(
  List<CourseScoreStruct>? courseScores,
) =>
    courseScores?.map((e) => getCourseScoreFirestoreData(e, true)).toList() ??
    [];
