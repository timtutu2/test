import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "friend_list" field.
  List<DocumentReference>? _friendList;
  List<DocumentReference> get friendList => _friendList ?? const [];
  bool hasFriendList() => _friendList != null;

  // "love_post_collection" field.
  List<DocumentReference>? _lovePostCollection;
  List<DocumentReference> get lovePostCollection =>
      _lovePostCollection ?? const [];
  bool hasLovePostCollection() => _lovePostCollection != null;

  // "Post_collection" field.
  List<PostWithTimeStruct>? _postCollection;
  List<PostWithTimeStruct> get postCollection => _postCollection ?? const [];
  bool hasPostCollection() => _postCollection != null;

  // "user_curriculum2" field.
  List<DocumentReference>? _userCurriculum2;
  List<DocumentReference> get userCurriculum2 => _userCurriculum2 ?? const [];
  bool hasUserCurriculum2() => _userCurriculum2 != null;

  // "isnt_first_time_login" field.
  bool? _isntFirstTimeLogin;
  bool get isntFirstTimeLogin => _isntFirstTimeLogin ?? false;
  bool hasIsntFirstTimeLogin() => _isntFirstTimeLogin != null;

  // "hide_post" field.
  List<DocumentReference>? _hidePost;
  List<DocumentReference> get hidePost => _hidePost ?? const [];
  bool hasHidePost() => _hidePost != null;

  // "hide_post_time_co" field.
  List<PostWithTimeStruct>? _hidePostTimeCo;
  List<PostWithTimeStruct> get hidePostTimeCo => _hidePostTimeCo ?? const [];
  bool hasHidePostTimeCo() => _hidePostTimeCo != null;

  // "EULA_agreement" field.
  bool? _eULAAgreement;
  bool get eULAAgreement => _eULAAgreement ?? false;
  bool hasEULAAgreement() => _eULAAgreement != null;

  // "block_user" field.
  List<DocumentReference>? _blockUser;
  List<DocumentReference> get blockUser => _blockUser ?? const [];
  bool hasBlockUser() => _blockUser != null;

  // "School" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "comment_with_user" field.
  List<DocumentReference>? _commentWithUser;
  List<DocumentReference> get commentWithUser => _commentWithUser ?? const [];
  bool hasCommentWithUser() => _commentWithUser != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _friendList = getDataList(snapshotData['friend_list']);
    _lovePostCollection = getDataList(snapshotData['love_post_collection']);
    _postCollection = getStructList(
      snapshotData['Post_collection'],
      PostWithTimeStruct.fromMap,
    );
    _userCurriculum2 = getDataList(snapshotData['user_curriculum2']);
    _isntFirstTimeLogin = snapshotData['isnt_first_time_login'] as bool?;
    _hidePost = getDataList(snapshotData['hide_post']);
    _hidePostTimeCo = getStructList(
      snapshotData['hide_post_time_co'],
      PostWithTimeStruct.fromMap,
    );
    _eULAAgreement = snapshotData['EULA_agreement'] as bool?;
    _blockUser = getDataList(snapshotData['block_user']);
    _school = snapshotData['School'] as String?;
    _commentWithUser = getDataList(snapshotData['comment_with_user']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  bool? isntFirstTimeLogin,
  bool? eULAAgreement,
  String? school,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'isnt_first_time_login': isntFirstTimeLogin,
      'EULA_agreement': eULAAgreement,
      'School': school,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        listEquality.equals(e1?.friendList, e2?.friendList) &&
        listEquality.equals(e1?.lovePostCollection, e2?.lovePostCollection) &&
        listEquality.equals(e1?.postCollection, e2?.postCollection) &&
        listEquality.equals(e1?.userCurriculum2, e2?.userCurriculum2) &&
        e1?.isntFirstTimeLogin == e2?.isntFirstTimeLogin &&
        listEquality.equals(e1?.hidePost, e2?.hidePost) &&
        listEquality.equals(e1?.hidePostTimeCo, e2?.hidePostTimeCo) &&
        e1?.eULAAgreement == e2?.eULAAgreement &&
        listEquality.equals(e1?.blockUser, e2?.blockUser) &&
        e1?.school == e2?.school &&
        listEquality.equals(e1?.commentWithUser, e2?.commentWithUser);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.friendList,
        e?.lovePostCollection,
        e?.postCollection,
        e?.userCurriculum2,
        e?.isntFirstTimeLogin,
        e?.hidePost,
        e?.hidePostTimeCo,
        e?.eULAAgreement,
        e?.blockUser,
        e?.school,
        e?.commentWithUser
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
