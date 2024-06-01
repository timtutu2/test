// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomColorStruct extends FFFirebaseStruct {
  CustomColorStruct({
    DocumentReference? choseCourse,
    String? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _choseCourse = choseCourse,
        _color = color,
        super(firestoreUtilData);

  // "chose_course" field.
  DocumentReference? _choseCourse;
  DocumentReference? get choseCourse => _choseCourse;
  set choseCourse(DocumentReference? val) => _choseCourse = val;
  bool hasChoseCourse() => _choseCourse != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  static CustomColorStruct fromMap(Map<String, dynamic> data) =>
      CustomColorStruct(
        choseCourse: data['chose_course'] as DocumentReference?,
        color: data['color'] as String?,
      );

  static CustomColorStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomColorStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'chose_course': _choseCourse,
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chose_course': serializeParam(
          _choseCourse,
          ParamType.DocumentReference,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomColorStruct(
        choseCourse: deserializeParam(
          data['chose_course'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['nthu_courses'],
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomColorStruct &&
        choseCourse == other.choseCourse &&
        color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([choseCourse, color]);
}

CustomColorStruct createCustomColorStruct({
  DocumentReference? choseCourse,
  String? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomColorStruct(
      choseCourse: choseCourse,
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomColorStruct? updateCustomColorStruct(
  CustomColorStruct? customColor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customColor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomColorStructData(
  Map<String, dynamic> firestoreData,
  CustomColorStruct? customColor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customColor == null) {
    return;
  }
  if (customColor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customColor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customColorData =
      getCustomColorFirestoreData(customColor, forFieldValue);
  final nestedData =
      customColorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customColor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomColorFirestoreData(
  CustomColorStruct? customColor, [
  bool forFieldValue = false,
]) {
  if (customColor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customColor.toMap());

  // Add any Firestore field values
  customColor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomColorListFirestoreData(
  List<CustomColorStruct>? customColors,
) =>
    customColors?.map((e) => getCustomColorFirestoreData(e, true)).toList() ??
    [];
