import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _department =
          await secureStorage.getStringList('ff_department') ?? _department;
    });
    await _safeInitAsync(() async {
      _showcourseDetail = await secureStorage.getBool('ff_showcourseDetail') ??
          _showcourseDetail;
    });
    await _safeInitAsync(() async {
      _EULAgreementApp =
          await secureStorage.getBool('ff_EULAgreementApp') ?? _EULAgreementApp;
    });
    await _safeInitAsync(() async {
      _oldCourse = (await secureStorage.getStringList('ff_oldCourse'))
              ?.map((path) => path.ref)
              .toList() ??
          _oldCourse;
    });
    await _safeInitAsync(() async {
      _currindex =
          await secureStorage.getStringList('ff_currindex') ?? _currindex;
    });
    await _safeInitAsync(() async {
      _ApplastestVersion =
          await secureStorage.getString('ff_ApplastestVersion') ??
              _ApplastestVersion;
    });
    await _safeInitAsync(() async {
      _ListofCenter = (await secureStorage.getStringList('ff_ListofCenter'))
              ?.map(latLngFromString)
              .withoutNulls ??
          _ListofCenter;
    });
    await _safeInitAsync(() async {
      _ListofLocationDocRef =
          (await secureStorage.getStringList('ff_ListofLocationDocRef'))
                  ?.map((path) => path.ref)
                  .toList() ??
              _ListofLocationDocRef;
    });
    await _safeInitAsync(() async {
      _ListofmapAnimateLoc =
          (await secureStorage.getStringList('ff_ListofmapAnimateLoc'))
                  ?.map(latLngFromString)
                  .withoutNulls ??
              _ListofmapAnimateLoc;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _department = [
    'CHEM 化學系',
    'AES 分環所',
    'ANTH 人類所',
    'ASTR 天文所',
    'BAI 智慧生醫博士學程'
  ];
  List<String> get department => _department;
  set department(List<String> value) {
    _department = value;
    secureStorage.setStringList('ff_department', value);
  }

  void deleteDepartment() {
    secureStorage.delete(key: 'ff_department');
  }

  void addToDepartment(String value) {
    _department.add(value);
    secureStorage.setStringList('ff_department', _department);
  }

  void removeFromDepartment(String value) {
    _department.remove(value);
    secureStorage.setStringList('ff_department', _department);
  }

  void removeAtIndexFromDepartment(int index) {
    _department.removeAt(index);
    secureStorage.setStringList('ff_department', _department);
  }

  void updateDepartmentAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _department[index] = updateFn(_department[index]);
    secureStorage.setStringList('ff_department', _department);
  }

  void insertAtIndexInDepartment(int index, String value) {
    _department.insert(index, value);
    secureStorage.setStringList('ff_department', _department);
  }

  List<String> _courseDayTime = [];
  List<String> get courseDayTime => _courseDayTime;
  set courseDayTime(List<String> value) {
    _courseDayTime = value;
  }

  void addToCourseDayTime(String value) {
    _courseDayTime.add(value);
  }

  void removeFromCourseDayTime(String value) {
    _courseDayTime.remove(value);
  }

  void removeAtIndexFromCourseDayTime(int index) {
    _courseDayTime.removeAt(index);
  }

  void updateCourseDayTimeAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _courseDayTime[index] = updateFn(_courseDayTime[index]);
  }

  void insertAtIndexInCourseDayTime(int index, String value) {
    _courseDayTime.insert(index, value);
  }

  List<DocumentReference> _chooseCourseRef = [];
  List<DocumentReference> get chooseCourseRef => _chooseCourseRef;
  set chooseCourseRef(List<DocumentReference> value) {
    _chooseCourseRef = value;
  }

  void addToChooseCourseRef(DocumentReference value) {
    _chooseCourseRef.add(value);
  }

  void removeFromChooseCourseRef(DocumentReference value) {
    _chooseCourseRef.remove(value);
  }

  void removeAtIndexFromChooseCourseRef(int index) {
    _chooseCourseRef.removeAt(index);
  }

  void updateChooseCourseRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _chooseCourseRef[index] = updateFn(_chooseCourseRef[index]);
  }

  void insertAtIndexInChooseCourseRef(int index, DocumentReference value) {
    _chooseCourseRef.insert(index, value);
  }

  DocumentReference? _coursecurriculumRef =
      FirebaseFirestore.instance.doc('/course_curriculum/default');
  DocumentReference? get coursecurriculumRef => _coursecurriculumRef;
  set coursecurriculumRef(DocumentReference? value) {
    _coursecurriculumRef = value;
  }

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching(bool value) {
    _isSearching = value;
  }

  bool _showcourseDetail = true;
  bool get showcourseDetail => _showcourseDetail;
  set showcourseDetail(bool value) {
    _showcourseDetail = value;
    secureStorage.setBool('ff_showcourseDetail', value);
  }

  void deleteShowcourseDetail() {
    secureStorage.delete(key: 'ff_showcourseDetail');
  }

  DateTime? _lasttimeOverride =
      DateTime.fromMillisecondsSinceEpoch(1711955880000);
  DateTime? get lasttimeOverride => _lasttimeOverride;
  set lasttimeOverride(DateTime? value) {
    _lasttimeOverride = value;
  }

  bool _isOverride = false;
  bool get isOverride => _isOverride;
  set isOverride(bool value) {
    _isOverride = value;
  }

  bool _EULAgreementApp = false;
  bool get EULAgreementApp => _EULAgreementApp;
  set EULAgreementApp(bool value) {
    _EULAgreementApp = value;
    secureStorage.setBool('ff_EULAgreementApp', value);
  }

  void deleteEULAgreementApp() {
    secureStorage.delete(key: 'ff_EULAgreementApp');
  }

  List<DocumentReference> _oldCourse = [];
  List<DocumentReference> get oldCourse => _oldCourse;
  set oldCourse(List<DocumentReference> value) {
    _oldCourse = value;
    secureStorage.setStringList(
        'ff_oldCourse', value.map((x) => x.path).toList());
  }

  void deleteOldCourse() {
    secureStorage.delete(key: 'ff_oldCourse');
  }

  void addToOldCourse(DocumentReference value) {
    _oldCourse.add(value);
    secureStorage.setStringList(
        'ff_oldCourse', _oldCourse.map((x) => x.path).toList());
  }

  void removeFromOldCourse(DocumentReference value) {
    _oldCourse.remove(value);
    secureStorage.setStringList(
        'ff_oldCourse', _oldCourse.map((x) => x.path).toList());
  }

  void removeAtIndexFromOldCourse(int index) {
    _oldCourse.removeAt(index);
    secureStorage.setStringList(
        'ff_oldCourse', _oldCourse.map((x) => x.path).toList());
  }

  void updateOldCourseAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _oldCourse[index] = updateFn(_oldCourse[index]);
    secureStorage.setStringList(
        'ff_oldCourse', _oldCourse.map((x) => x.path).toList());
  }

  void insertAtIndexInOldCourse(int index, DocumentReference value) {
    _oldCourse.insert(index, value);
    secureStorage.setStringList(
        'ff_oldCourse', _oldCourse.map((x) => x.path).toList());
  }

  List<String> _currindex = [
    'M1',
    'T1',
    'W1',
    'R1',
    'F1',
    'S1',
    'M2',
    'T2',
    'W2',
    'R2',
    'F2',
    'S2',
    'M3',
    'T3',
    'W3',
    'R3',
    'F3',
    'S3',
    'M4',
    'T4',
    'W4',
    'R4',
    'F4',
    'S4',
    'Mn',
    'Tn',
    'Wn',
    'Rn',
    'Fn',
    'Sn',
    'M5',
    'T5',
    'W5',
    'R5',
    'F5',
    'S5',
    'M6',
    'T6',
    'W6',
    'R6',
    'F6',
    'S6',
    'M7',
    'T7',
    'W7',
    'R7',
    'F7',
    'S7',
    'M8',
    'T8',
    'W8',
    'R8',
    'F8',
    'S8',
    'M9',
    'T9',
    'W9',
    'R9',
    'F9',
    'S9',
    'Ma',
    'Ta',
    'Wa',
    'Ra',
    'Fa',
    'Sa',
    'Mb',
    'Tb',
    'Wb',
    'Rb',
    'Fb',
    'Sb',
    'Mc',
    'Tc',
    'Wc',
    'Rc',
    'Fc',
    'Sc'
  ];
  List<String> get currindex => _currindex;
  set currindex(List<String> value) {
    _currindex = value;
    secureStorage.setStringList('ff_currindex', value);
  }

  void deleteCurrindex() {
    secureStorage.delete(key: 'ff_currindex');
  }

  void addToCurrindex(String value) {
    _currindex.add(value);
    secureStorage.setStringList('ff_currindex', _currindex);
  }

  void removeFromCurrindex(String value) {
    _currindex.remove(value);
    secureStorage.setStringList('ff_currindex', _currindex);
  }

  void removeAtIndexFromCurrindex(int index) {
    _currindex.removeAt(index);
    secureStorage.setStringList('ff_currindex', _currindex);
  }

  void updateCurrindexAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _currindex[index] = updateFn(_currindex[index]);
    secureStorage.setStringList('ff_currindex', _currindex);
  }

  void insertAtIndexInCurrindex(int index, String value) {
    _currindex.insert(index, value);
    secureStorage.setStringList('ff_currindex', _currindex);
  }

  String _ApplastestVersion = '';
  String get ApplastestVersion => _ApplastestVersion;
  set ApplastestVersion(String value) {
    _ApplastestVersion = value;
    secureStorage.setString('ff_ApplastestVersion', value);
  }

  void deleteApplastestVersion() {
    secureStorage.delete(key: 'ff_ApplastestVersion');
  }

  List<LatLng> _ListofCenter = [];
  List<LatLng> get ListofCenter => _ListofCenter;
  set ListofCenter(List<LatLng> value) {
    _ListofCenter = value;
    secureStorage.setStringList(
        'ff_ListofCenter', value.map((x) => x.serialize()).toList());
  }

  void deleteListofCenter() {
    secureStorage.delete(key: 'ff_ListofCenter');
  }

  void addToListofCenter(LatLng value) {
    _ListofCenter.add(value);
    secureStorage.setStringList(
        'ff_ListofCenter', _ListofCenter.map((x) => x.serialize()).toList());
  }

  void removeFromListofCenter(LatLng value) {
    _ListofCenter.remove(value);
    secureStorage.setStringList(
        'ff_ListofCenter', _ListofCenter.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListofCenter(int index) {
    _ListofCenter.removeAt(index);
    secureStorage.setStringList(
        'ff_ListofCenter', _ListofCenter.map((x) => x.serialize()).toList());
  }

  void updateListofCenterAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _ListofCenter[index] = updateFn(_ListofCenter[index]);
    secureStorage.setStringList(
        'ff_ListofCenter', _ListofCenter.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListofCenter(int index, LatLng value) {
    _ListofCenter.insert(index, value);
    secureStorage.setStringList(
        'ff_ListofCenter', _ListofCenter.map((x) => x.serialize()).toList());
  }

  List<DocumentReference> _ListofLocationDocRef = [];
  List<DocumentReference> get ListofLocationDocRef => _ListofLocationDocRef;
  set ListofLocationDocRef(List<DocumentReference> value) {
    _ListofLocationDocRef = value;
    secureStorage.setStringList(
        'ff_ListofLocationDocRef', value.map((x) => x.path).toList());
  }

  void deleteListofLocationDocRef() {
    secureStorage.delete(key: 'ff_ListofLocationDocRef');
  }

  void addToListofLocationDocRef(DocumentReference value) {
    _ListofLocationDocRef.add(value);
    secureStorage.setStringList('ff_ListofLocationDocRef',
        _ListofLocationDocRef.map((x) => x.path).toList());
  }

  void removeFromListofLocationDocRef(DocumentReference value) {
    _ListofLocationDocRef.remove(value);
    secureStorage.setStringList('ff_ListofLocationDocRef',
        _ListofLocationDocRef.map((x) => x.path).toList());
  }

  void removeAtIndexFromListofLocationDocRef(int index) {
    _ListofLocationDocRef.removeAt(index);
    secureStorage.setStringList('ff_ListofLocationDocRef',
        _ListofLocationDocRef.map((x) => x.path).toList());
  }

  void updateListofLocationDocRefAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _ListofLocationDocRef[index] = updateFn(_ListofLocationDocRef[index]);
    secureStorage.setStringList('ff_ListofLocationDocRef',
        _ListofLocationDocRef.map((x) => x.path).toList());
  }

  void insertAtIndexInListofLocationDocRef(
      int index, DocumentReference value) {
    _ListofLocationDocRef.insert(index, value);
    secureStorage.setStringList('ff_ListofLocationDocRef',
        _ListofLocationDocRef.map((x) => x.path).toList());
  }

  List<LatLng> _ListofmapAnimateLoc = [];
  List<LatLng> get ListofmapAnimateLoc => _ListofmapAnimateLoc;
  set ListofmapAnimateLoc(List<LatLng> value) {
    _ListofmapAnimateLoc = value;
    secureStorage.setStringList(
        'ff_ListofmapAnimateLoc', value.map((x) => x.serialize()).toList());
  }

  void deleteListofmapAnimateLoc() {
    secureStorage.delete(key: 'ff_ListofmapAnimateLoc');
  }

  void addToListofmapAnimateLoc(LatLng value) {
    _ListofmapAnimateLoc.add(value);
    secureStorage.setStringList('ff_ListofmapAnimateLoc',
        _ListofmapAnimateLoc.map((x) => x.serialize()).toList());
  }

  void removeFromListofmapAnimateLoc(LatLng value) {
    _ListofmapAnimateLoc.remove(value);
    secureStorage.setStringList('ff_ListofmapAnimateLoc',
        _ListofmapAnimateLoc.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListofmapAnimateLoc(int index) {
    _ListofmapAnimateLoc.removeAt(index);
    secureStorage.setStringList('ff_ListofmapAnimateLoc',
        _ListofmapAnimateLoc.map((x) => x.serialize()).toList());
  }

  void updateListofmapAnimateLocAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _ListofmapAnimateLoc[index] = updateFn(_ListofmapAnimateLoc[index]);
    secureStorage.setStringList('ff_ListofmapAnimateLoc',
        _ListofmapAnimateLoc.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListofmapAnimateLoc(int index, LatLng value) {
    _ListofmapAnimateLoc.insert(index, value);
    secureStorage.setStringList('ff_ListofmapAnimateLoc',
        _ListofmapAnimateLoc.map((x) => x.serialize()).toList());
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);

  final _nthuCourseMainCacheManager =
      StreamRequestManager<List<NthuCoursesRecord>>();
  Stream<List<NthuCoursesRecord>> nthuCourseMainCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NthuCoursesRecord>> Function() requestFn,
  }) =>
      _nthuCourseMainCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNthuCourseMainCacheCache() => _nthuCourseMainCacheManager.clear();
  void clearNthuCourseMainCacheCacheKey(String? uniqueKey) =>
      _nthuCourseMainCacheManager.clearRequest(uniqueKey);

  final _inviteListCacheManager = FutureRequestManager<int>();
  Future<int> inviteListCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _inviteListCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInviteListCacheCache() => _inviteListCacheManager.clear();
  void clearInviteListCacheCacheKey(String? uniqueKey) =>
      _inviteListCacheManager.clearRequest(uniqueKey);

  final _postAllCacheManager = FutureRequestManager<List<PostRecord>>();
  Future<List<PostRecord>> postAllCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostRecord>> Function() requestFn,
  }) =>
      _postAllCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostAllCacheCache() => _postAllCacheManager.clear();
  void clearPostAllCacheCacheKey(String? uniqueKey) =>
      _postAllCacheManager.clearRequest(uniqueKey);

  final _uCollectionPostManager = StreamRequestManager<PostRecord>();
  Stream<PostRecord> uCollectionPost({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<PostRecord> Function() requestFn,
  }) =>
      _uCollectionPostManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUCollectionPostCache() => _uCollectionPostManager.clear();
  void clearUCollectionPostCacheKey(String? uniqueKey) =>
      _uCollectionPostManager.clearRequest(uniqueKey);

  final _chatMessageTestManager =
      StreamRequestManager<List<ChatMessagesRecord>>();
  Stream<List<ChatMessagesRecord>> chatMessageTest({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ChatMessagesRecord>> Function() requestFn,
  }) =>
      _chatMessageTestManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChatMessageTestCache() => _chatMessageTestManager.clear();
  void clearChatMessageTestCacheKey(String? uniqueKey) =>
      _chatMessageTestManager.clearRequest(uniqueKey);

  final _postFilterManager = FutureRequestManager<List<PostRecord>>();
  Future<List<PostRecord>> postFilter({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostRecord>> Function() requestFn,
  }) =>
      _postFilterManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostFilterCache() => _postFilterManager.clear();
  void clearPostFilterCacheKey(String? uniqueKey) =>
      _postFilterManager.clearRequest(uniqueKey);

  final _commentOfTheCourseManager = StreamRequestManager<CommentRecord>();
  Stream<CommentRecord> commentOfTheCourse({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<CommentRecord> Function() requestFn,
  }) =>
      _commentOfTheCourseManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommentOfTheCourseCache() => _commentOfTheCourseManager.clear();
  void clearCommentOfTheCourseCacheKey(String? uniqueKey) =>
      _commentOfTheCourseManager.clearRequest(uniqueKey);

  final _userInfoCommentManager = StreamRequestManager<UsersRecord>();
  Stream<UsersRecord> userInfoComment({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UsersRecord> Function() requestFn,
  }) =>
      _userInfoCommentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserInfoCommentCache() => _userInfoCommentManager.clear();
  void clearUserInfoCommentCacheKey(String? uniqueKey) =>
      _userInfoCommentManager.clearRequest(uniqueKey);

  final _invMemberSaftyModeManager =
      StreamRequestManager<List<InvAskListRecord>>();
  Stream<List<InvAskListRecord>> invMemberSaftyMode({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<InvAskListRecord>> Function() requestFn,
  }) =>
      _invMemberSaftyModeManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearInvMemberSaftyModeCache() => _invMemberSaftyModeManager.clear();
  void clearInvMemberSaftyModeCacheKey(String? uniqueKey) =>
      _invMemberSaftyModeManager.clearRequest(uniqueKey);

  final _blockUserManager = StreamRequestManager<UsersRecord>();
  Stream<UsersRecord> blockUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<UsersRecord> Function() requestFn,
  }) =>
      _blockUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBlockUserCache() => _blockUserManager.clear();
  void clearBlockUserCacheKey(String? uniqueKey) =>
      _blockUserManager.clearRequest(uniqueKey);

  final _postUserInfoManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> postUserInfo({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _postUserInfoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostUserInfoCache() => _postUserInfoManager.clear();
  void clearPostUserInfoCacheKey(String? uniqueKey) =>
      _postUserInfoManager.clearRequest(uniqueKey);

  final _courseSelectCacheManager =
      StreamRequestManager<List<NthuCoursesRecord>>();
  Stream<List<NthuCoursesRecord>> courseSelectCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<NthuCoursesRecord>> Function() requestFn,
  }) =>
      _courseSelectCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCourseSelectCacheCache() => _courseSelectCacheManager.clear();
  void clearCourseSelectCacheCacheKey(String? uniqueKey) =>
      _courseSelectCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
