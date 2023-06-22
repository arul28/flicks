import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "pinned" field.
  List<String>? _pinned;
  List<String> get pinned => _pinned ?? const [];
  bool hasPinned() => _pinned != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "followingNum" field.
  int? _followingNum;
  int get followingNum => _followingNum ?? 0;
  bool hasFollowingNum() => _followingNum != null;

  // "followingList" field.
  List<DocumentReference>? _followingList;
  List<DocumentReference> get followingList => _followingList ?? const [];
  bool hasFollowingList() => _followingList != null;

  // "followedByNum" field.
  int? _followedByNum;
  int get followedByNum => _followedByNum ?? 0;
  bool hasFollowedByNum() => _followedByNum != null;

  // "followedByList" field.
  List<DocumentReference>? _followedByList;
  List<DocumentReference> get followedByList => _followedByList ?? const [];
  bool hasFollowedByList() => _followedByList != null;

  // "currentSession" field.
  List<String>? _currentSession;
  List<String> get currentSession => _currentSession ?? const [];
  bool hasCurrentSession() => _currentSession != null;

  // "oldSession" field.
  List<String>? _oldSession;
  List<String> get oldSession => _oldSession ?? const [];
  bool hasOldSession() => _oldSession != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _bio = snapshotData['bio'] as String?;
    _pinned = getDataList(snapshotData['pinned']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _followingNum = snapshotData['followingNum'] as int?;
    _followingList = getDataList(snapshotData['followingList']);
    _followedByNum = snapshotData['followedByNum'] as int?;
    _followedByList = getDataList(snapshotData['followedByList']);
    _currentSession = getDataList(snapshotData['currentSession']);
    _oldSession = getDataList(snapshotData['oldSession']);
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
  String? bio,
  DateTime? createdTime,
  String? phoneNumber,
  int? followingNum,
  int? followedByNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'bio': bio,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'followingNum': followingNum,
      'followedByNum': followedByNum,
    }.withoutNulls,
  );

  return firestoreData;
}
