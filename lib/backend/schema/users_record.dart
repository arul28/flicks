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

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "sentPendingRequests" field.
  List<DocumentReference>? _sentPendingRequests;
  List<DocumentReference> get sentPendingRequests =>
      _sentPendingRequests ?? const [];
  bool hasSentPendingRequests() => _sentPendingRequests != null;

  // "sentPendingRequestsNum" field.
  int? _sentPendingRequestsNum;
  int get sentPendingRequestsNum => _sentPendingRequestsNum ?? 0;
  bool hasSentPendingRequestsNum() => _sentPendingRequestsNum != null;

  // "friendsList" field.
  List<DocumentReference>? _friendsList;
  List<DocumentReference> get friendsList => _friendsList ?? const [];
  bool hasFriendsList() => _friendsList != null;

  // "friendsNum" field.
  int? _friendsNum;
  int get friendsNum => _friendsNum ?? 0;
  bool hasFriendsNum() => _friendsNum != null;

  // "incomingPendingRequests" field.
  List<DocumentReference>? _incomingPendingRequests;
  List<DocumentReference> get incomingPendingRequests =>
      _incomingPendingRequests ?? const [];
  bool hasIncomingPendingRequests() => _incomingPendingRequests != null;

  // "incomingPendingRequestsNum" field.
  int? _incomingPendingRequestsNum;
  int get incomingPendingRequestsNum => _incomingPendingRequestsNum ?? 0;
  bool hasIncomingPendingRequestsNum() => _incomingPendingRequestsNum != null;

  // "pinnedNum" field.
  int? _pinnedNum;
  int get pinnedNum => _pinnedNum ?? 0;
  bool hasPinnedNum() => _pinnedNum != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _bio = snapshotData['bio'] as String?;
    _pinned = getDataList(snapshotData['pinned']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _fullName = snapshotData['fullName'] as String?;
    _sentPendingRequests = getDataList(snapshotData['sentPendingRequests']);
    _sentPendingRequestsNum =
        castToType<int>(snapshotData['sentPendingRequestsNum']);
    _friendsList = getDataList(snapshotData['friendsList']);
    _friendsNum = castToType<int>(snapshotData['friendsNum']);
    _incomingPendingRequests =
        getDataList(snapshotData['incomingPendingRequests']);
    _incomingPendingRequestsNum =
        castToType<int>(snapshotData['incomingPendingRequestsNum']);
    _pinnedNum = castToType<int>(snapshotData['pinnedNum']);
    _comments = getStructList(
      snapshotData['comments'],
      CommentStruct.fromMap,
    );
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
  String? fullName,
  int? sentPendingRequestsNum,
  int? friendsNum,
  int? incomingPendingRequestsNum,
  int? pinnedNum,
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
      'fullName': fullName,
      'sentPendingRequestsNum': sentPendingRequestsNum,
      'friendsNum': friendsNum,
      'incomingPendingRequestsNum': incomingPendingRequestsNum,
      'pinnedNum': pinnedNum,
    }.withoutNulls,
  );

  return firestoreData;
}
