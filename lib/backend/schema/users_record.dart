import 'dart:async';

import 'package:collection/collection.dart';

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

  // "liked" field.
  List<DocumentReference>? _liked;
  List<DocumentReference> get liked => _liked ?? const [];
  bool hasLiked() => _liked != null;

  // "emailVerified" field.
  bool? _emailVerified;
  bool get emailVerified => _emailVerified ?? false;
  bool hasEmailVerified() => _emailVerified != null;

  // "profileCreated" field.
  bool? _profileCreated;
  bool get profileCreated => _profileCreated ?? false;
  bool hasProfileCreated() => _profileCreated != null;

  // "firstViewAfterSwitch" field.
  bool? _firstViewAfterSwitch;
  bool get firstViewAfterSwitch => _firstViewAfterSwitch ?? false;
  bool hasFirstViewAfterSwitch() => _firstViewAfterSwitch != null;

  // "comNotifs" field.
  bool? _comNotifs;
  bool get comNotifs => _comNotifs ?? false;
  bool hasComNotifs() => _comNotifs != null;

  // "likesNotifs" field.
  bool? _likesNotifs;
  bool get likesNotifs => _likesNotifs ?? false;
  bool hasLikesNotifs() => _likesNotifs != null;

  // "reqNotifs" field.
  bool? _reqNotifs;
  bool get reqNotifs => _reqNotifs ?? false;
  bool hasReqNotifs() => _reqNotifs != null;

  // "devNotifs" field.
  bool? _devNotifs;
  bool get devNotifs => _devNotifs ?? false;
  bool hasDevNotifs() => _devNotifs != null;

  // "blockedUsers" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "iBlocked" field.
  List<DocumentReference>? _iBlocked;
  List<DocumentReference> get iBlocked => _iBlocked ?? const [];
  bool hasIBlocked() => _iBlocked != null;

  // "blockedBy" field.
  List<DocumentReference>? _blockedBy;
  List<DocumentReference> get blockedBy => _blockedBy ?? const [];
  bool hasBlockedBy() => _blockedBy != null;

  // "restrictedUsers" field.
  List<DocumentReference>? _restrictedUsers;
  List<DocumentReference> get restrictedUsers => _restrictedUsers ?? const [];
  bool hasRestrictedUsers() => _restrictedUsers != null;

  // "oldSessionPicsCount" field.
  int? _oldSessionPicsCount;
  int get oldSessionPicsCount => _oldSessionPicsCount ?? 0;
  bool hasOldSessionPicsCount() => _oldSessionPicsCount != null;

  // "lastPicTakenTime" field.
  DateTime? _lastPicTakenTime;
  DateTime? get lastPicTakenTime => _lastPicTakenTime;
  bool hasLastPicTakenTime() => _lastPicTakenTime != null;

  // "lastPinAddedTime" field.
  DateTime? _lastPinAddedTime;
  DateTime? get lastPinAddedTime => _lastPinAddedTime;
  bool hasLastPinAddedTime() => _lastPinAddedTime != null;

  // "whatsNew" field.
  bool? _whatsNew;
  bool get whatsNew => _whatsNew ?? false;
  bool hasWhatsNew() => _whatsNew != null;

  // "streak" field.
  int? _streak;
  int get streak => _streak ?? 0;
  bool hasStreak() => _streak != null;

  // "introNeeded" field.
  bool? _introNeeded;
  bool get introNeeded => _introNeeded ?? false;
  bool hasIntroNeeded() => _introNeeded != null;

  // "contacts" field.
  List<String>? _contacts;
  List<String> get contacts => _contacts ?? const [];
  bool hasContacts() => _contacts != null;

  // "runReloadScript" field.
  bool? _runReloadScript;
  bool get runReloadScript => _runReloadScript ?? false;
  bool hasRunReloadScript() => _runReloadScript != null;

  // "suggestedFriends" field.
  List<DocumentReference>? _suggestedFriends;
  List<DocumentReference> get suggestedFriends => _suggestedFriends ?? const [];
  bool hasSuggestedFriends() => _suggestedFriends != null;

  // "phoneNumSet" field.
  bool? _phoneNumSet;
  bool get phoneNumSet => _phoneNumSet ?? false;
  bool hasPhoneNumSet() => _phoneNumSet != null;

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
    _liked = getDataList(snapshotData['liked']);
    _emailVerified = snapshotData['emailVerified'] as bool?;
    _profileCreated = snapshotData['profileCreated'] as bool?;
    _firstViewAfterSwitch = snapshotData['firstViewAfterSwitch'] as bool?;
    _comNotifs = snapshotData['comNotifs'] as bool?;
    _likesNotifs = snapshotData['likesNotifs'] as bool?;
    _reqNotifs = snapshotData['reqNotifs'] as bool?;
    _devNotifs = snapshotData['devNotifs'] as bool?;
    _blockedUsers = getDataList(snapshotData['blockedUsers']);
    _iBlocked = getDataList(snapshotData['iBlocked']);
    _blockedBy = getDataList(snapshotData['blockedBy']);
    _restrictedUsers = getDataList(snapshotData['restrictedUsers']);
    _oldSessionPicsCount = castToType<int>(snapshotData['oldSessionPicsCount']);
    _lastPicTakenTime = snapshotData['lastPicTakenTime'] as DateTime?;
    _lastPinAddedTime = snapshotData['lastPinAddedTime'] as DateTime?;
    _whatsNew = snapshotData['whatsNew'] as bool?;
    _streak = castToType<int>(snapshotData['streak']);
    _introNeeded = snapshotData['introNeeded'] as bool?;
    _contacts = getDataList(snapshotData['contacts']);
    _runReloadScript = snapshotData['runReloadScript'] as bool?;
    _suggestedFriends = getDataList(snapshotData['suggestedFriends']);
    _phoneNumSet = snapshotData['phoneNumSet'] as bool?;
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
  bool? emailVerified,
  bool? profileCreated,
  bool? firstViewAfterSwitch,
  bool? comNotifs,
  bool? likesNotifs,
  bool? reqNotifs,
  bool? devNotifs,
  int? oldSessionPicsCount,
  DateTime? lastPicTakenTime,
  DateTime? lastPinAddedTime,
  bool? whatsNew,
  int? streak,
  bool? introNeeded,
  bool? runReloadScript,
  bool? phoneNumSet,
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
      'emailVerified': emailVerified,
      'profileCreated': profileCreated,
      'firstViewAfterSwitch': firstViewAfterSwitch,
      'comNotifs': comNotifs,
      'likesNotifs': likesNotifs,
      'reqNotifs': reqNotifs,
      'devNotifs': devNotifs,
      'oldSessionPicsCount': oldSessionPicsCount,
      'lastPicTakenTime': lastPicTakenTime,
      'lastPinAddedTime': lastPinAddedTime,
      'whatsNew': whatsNew,
      'streak': streak,
      'introNeeded': introNeeded,
      'runReloadScript': runReloadScript,
      'phoneNumSet': phoneNumSet,
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
        e1?.bio == e2?.bio &&
        listEquality.equals(e1?.pinned, e2?.pinned) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.fullName == e2?.fullName &&
        listEquality.equals(e1?.sentPendingRequests, e2?.sentPendingRequests) &&
        e1?.sentPendingRequestsNum == e2?.sentPendingRequestsNum &&
        listEquality.equals(e1?.friendsList, e2?.friendsList) &&
        e1?.friendsNum == e2?.friendsNum &&
        listEquality.equals(
            e1?.incomingPendingRequests, e2?.incomingPendingRequests) &&
        e1?.incomingPendingRequestsNum == e2?.incomingPendingRequestsNum &&
        e1?.pinnedNum == e2?.pinnedNum &&
        listEquality.equals(e1?.liked, e2?.liked) &&
        e1?.emailVerified == e2?.emailVerified &&
        e1?.profileCreated == e2?.profileCreated &&
        e1?.firstViewAfterSwitch == e2?.firstViewAfterSwitch &&
        e1?.comNotifs == e2?.comNotifs &&
        e1?.likesNotifs == e2?.likesNotifs &&
        e1?.reqNotifs == e2?.reqNotifs &&
        e1?.devNotifs == e2?.devNotifs &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        listEquality.equals(e1?.iBlocked, e2?.iBlocked) &&
        listEquality.equals(e1?.blockedBy, e2?.blockedBy) &&
        listEquality.equals(e1?.restrictedUsers, e2?.restrictedUsers) &&
        e1?.oldSessionPicsCount == e2?.oldSessionPicsCount &&
        e1?.lastPicTakenTime == e2?.lastPicTakenTime &&
        e1?.lastPinAddedTime == e2?.lastPinAddedTime &&
        e1?.whatsNew == e2?.whatsNew &&
        e1?.streak == e2?.streak &&
        e1?.introNeeded == e2?.introNeeded &&
        listEquality.equals(e1?.contacts, e2?.contacts) &&
        e1?.runReloadScript == e2?.runReloadScript &&
        listEquality.equals(e1?.suggestedFriends, e2?.suggestedFriends) &&
        e1?.phoneNumSet == e2?.phoneNumSet;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.bio,
        e?.pinned,
        e?.createdTime,
        e?.phoneNumber,
        e?.fullName,
        e?.sentPendingRequests,
        e?.sentPendingRequestsNum,
        e?.friendsList,
        e?.friendsNum,
        e?.incomingPendingRequests,
        e?.incomingPendingRequestsNum,
        e?.pinnedNum,
        e?.liked,
        e?.emailVerified,
        e?.profileCreated,
        e?.firstViewAfterSwitch,
        e?.comNotifs,
        e?.likesNotifs,
        e?.reqNotifs,
        e?.devNotifs,
        e?.blockedUsers,
        e?.iBlocked,
        e?.blockedBy,
        e?.restrictedUsers,
        e?.oldSessionPicsCount,
        e?.lastPicTakenTime,
        e?.lastPinAddedTime,
        e?.whatsNew,
        e?.streak,
        e?.introNeeded,
        e?.contacts,
        e?.runReloadScript,
        e?.suggestedFriends,
        e?.phoneNumSet
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
