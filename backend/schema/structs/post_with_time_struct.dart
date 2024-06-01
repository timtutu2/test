// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostWithTimeStruct extends FFFirebaseStruct {
  PostWithTimeStruct({
    DocumentReference? postCollection,
    DateTime? addTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postCollection = postCollection,
        _addTime = addTime,
        super(firestoreUtilData);

  // "postCollection" field.
  DocumentReference? _postCollection;
  DocumentReference? get postCollection => _postCollection;
  set postCollection(DocumentReference? val) => _postCollection = val;
  bool hasPostCollection() => _postCollection != null;

  // "addTime" field.
  DateTime? _addTime;
  DateTime? get addTime => _addTime;
  set addTime(DateTime? val) => _addTime = val;
  bool hasAddTime() => _addTime != null;

  static PostWithTimeStruct fromMap(Map<String, dynamic> data) =>
      PostWithTimeStruct(
        postCollection: data['postCollection'] as DocumentReference?,
        addTime: data['addTime'] as DateTime?,
      );

  static PostWithTimeStruct? maybeFromMap(dynamic data) => data is Map
      ? PostWithTimeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'postCollection': _postCollection,
        'addTime': _addTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'postCollection': serializeParam(
          _postCollection,
          ParamType.DocumentReference,
        ),
        'addTime': serializeParam(
          _addTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static PostWithTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostWithTimeStruct(
        postCollection: deserializeParam(
          data['postCollection'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['post'],
        ),
        addTime: deserializeParam(
          data['addTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'PostWithTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PostWithTimeStruct &&
        postCollection == other.postCollection &&
        addTime == other.addTime;
  }

  @override
  int get hashCode => const ListEquality().hash([postCollection, addTime]);
}

PostWithTimeStruct createPostWithTimeStruct({
  DocumentReference? postCollection,
  DateTime? addTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostWithTimeStruct(
      postCollection: postCollection,
      addTime: addTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostWithTimeStruct? updatePostWithTimeStruct(
  PostWithTimeStruct? postWithTime, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postWithTime
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostWithTimeStructData(
  Map<String, dynamic> firestoreData,
  PostWithTimeStruct? postWithTime,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postWithTime == null) {
    return;
  }
  if (postWithTime.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postWithTime.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postWithTimeData =
      getPostWithTimeFirestoreData(postWithTime, forFieldValue);
  final nestedData =
      postWithTimeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postWithTime.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostWithTimeFirestoreData(
  PostWithTimeStruct? postWithTime, [
  bool forFieldValue = false,
]) {
  if (postWithTime == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postWithTime.toMap());

  // Add any Firestore field values
  postWithTime.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostWithTimeListFirestoreData(
  List<PostWithTimeStruct>? postWithTimes,
) =>
    postWithTimes?.map((e) => getPostWithTimeFirestoreData(e, true)).toList() ??
    [];
