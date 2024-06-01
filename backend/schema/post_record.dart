import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "post_text" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "post_info_money" field.
  String? _postInfoMoney;
  String get postInfoMoney => _postInfoMoney ?? '';
  bool hasPostInfoMoney() => _postInfoMoney != null;

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_time" field.
  DateTime? _postTime;
  DateTime? get postTime => _postTime;
  bool hasPostTime() => _postTime != null;

  // "post_chat_name" field.
  String? _postChatName;
  String get postChatName => _postChatName ?? '';
  bool hasPostChatName() => _postChatName != null;

  // "join_member" field.
  List<DocumentReference>? _joinMember;
  List<DocumentReference> get joinMember => _joinMember ?? const [];
  bool hasJoinMember() => _joinMember != null;

  // "chat_of_post" field.
  DocumentReference? _chatOfPost;
  DocumentReference? get chatOfPost => _chatOfPost;
  bool hasChatOfPost() => _chatOfPost != null;

  // "chat_of_post_ID" field.
  int? _chatOfPostID;
  int get chatOfPostID => _chatOfPostID ?? 0;
  bool hasChatOfPostID() => _chatOfPostID != null;

  // "post_status" field.
  bool? _postStatus;
  bool get postStatus => _postStatus ?? false;
  bool hasPostStatus() => _postStatus != null;

  // "inv_member_list" field.
  List<DocumentReference>? _invMemberList;
  List<DocumentReference> get invMemberList => _invMemberList ?? const [];
  bool hasInvMemberList() => _invMemberList != null;

  // "limit_people_num" field.
  int? _limitPeopleNum;
  int get limitPeopleNum => _limitPeopleNum ?? 0;
  bool hasLimitPeopleNum() => _limitPeopleNum != null;

  // "post_category" field.
  String? _postCategory;
  String get postCategory => _postCategory ?? '';
  bool hasPostCategory() => _postCategory != null;

  // "post_course_name_for_search" field.
  String? _postCourseNameForSearch;
  String get postCourseNameForSearch => _postCourseNameForSearch ?? '';
  bool hasPostCourseNameForSearch() => _postCourseNameForSearch != null;

  // "post_course_pro_name_forsearch" field.
  String? _postCourseProNameForsearch;
  String get postCourseProNameForsearch => _postCourseProNameForsearch ?? '';
  bool hasPostCourseProNameForsearch() => _postCourseProNameForsearch != null;

  // "post_course_info2" field.
  DocumentReference? _postCourseInfo2;
  DocumentReference? get postCourseInfo2 => _postCourseInfo2;
  bool hasPostCourseInfo2() => _postCourseInfo2 != null;

  // "need_apply" field.
  bool? _needApply;
  bool get needApply => _needApply ?? false;
  bool hasNeedApply() => _needApply != null;

  void _initializeFields() {
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _postText = snapshotData['post_text'] as String?;
    _postInfoMoney = snapshotData['post_info_money'] as String?;
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTime = snapshotData['post_time'] as DateTime?;
    _postChatName = snapshotData['post_chat_name'] as String?;
    _joinMember = getDataList(snapshotData['join_member']);
    _chatOfPost = snapshotData['chat_of_post'] as DocumentReference?;
    _chatOfPostID = castToType<int>(snapshotData['chat_of_post_ID']);
    _postStatus = snapshotData['post_status'] as bool?;
    _invMemberList = getDataList(snapshotData['inv_member_list']);
    _limitPeopleNum = castToType<int>(snapshotData['limit_people_num']);
    _postCategory = snapshotData['post_category'] as String?;
    _postCourseNameForSearch =
        snapshotData['post_course_name_for_search'] as String?;
    _postCourseProNameForsearch =
        snapshotData['post_course_pro_name_forsearch'] as String?;
    _postCourseInfo2 = snapshotData['post_course_info2'] as DocumentReference?;
    _needApply = snapshotData['need_apply'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostRecord.fromSnapshot(s));

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostRecord.fromSnapshot(s));

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  DocumentReference? postUser,
  String? postText,
  String? postInfoMoney,
  String? postPhoto,
  DateTime? postTime,
  String? postChatName,
  DocumentReference? chatOfPost,
  int? chatOfPostID,
  bool? postStatus,
  int? limitPeopleNum,
  String? postCategory,
  String? postCourseNameForSearch,
  String? postCourseProNameForsearch,
  DocumentReference? postCourseInfo2,
  bool? needApply,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_user': postUser,
      'post_text': postText,
      'post_info_money': postInfoMoney,
      'post_photo': postPhoto,
      'post_time': postTime,
      'post_chat_name': postChatName,
      'chat_of_post': chatOfPost,
      'chat_of_post_ID': chatOfPostID,
      'post_status': postStatus,
      'limit_people_num': limitPeopleNum,
      'post_category': postCategory,
      'post_course_name_for_search': postCourseNameForSearch,
      'post_course_pro_name_forsearch': postCourseProNameForsearch,
      'post_course_info2': postCourseInfo2,
      'need_apply': needApply,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postUser == e2?.postUser &&
        e1?.postText == e2?.postText &&
        e1?.postInfoMoney == e2?.postInfoMoney &&
        e1?.postPhoto == e2?.postPhoto &&
        e1?.postTime == e2?.postTime &&
        e1?.postChatName == e2?.postChatName &&
        listEquality.equals(e1?.joinMember, e2?.joinMember) &&
        e1?.chatOfPost == e2?.chatOfPost &&
        e1?.chatOfPostID == e2?.chatOfPostID &&
        e1?.postStatus == e2?.postStatus &&
        listEquality.equals(e1?.invMemberList, e2?.invMemberList) &&
        e1?.limitPeopleNum == e2?.limitPeopleNum &&
        e1?.postCategory == e2?.postCategory &&
        e1?.postCourseNameForSearch == e2?.postCourseNameForSearch &&
        e1?.postCourseProNameForsearch == e2?.postCourseProNameForsearch &&
        e1?.postCourseInfo2 == e2?.postCourseInfo2 &&
        e1?.needApply == e2?.needApply;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.postUser,
        e?.postText,
        e?.postInfoMoney,
        e?.postPhoto,
        e?.postTime,
        e?.postChatName,
        e?.joinMember,
        e?.chatOfPost,
        e?.chatOfPostID,
        e?.postStatus,
        e?.invMemberList,
        e?.limitPeopleNum,
        e?.postCategory,
        e?.postCourseNameForSearch,
        e?.postCourseProNameForsearch,
        e?.postCourseInfo2,
        e?.needApply
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
