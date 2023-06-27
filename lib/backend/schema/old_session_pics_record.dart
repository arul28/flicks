import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OldSessionPicsRecord extends FirestoreRecord {
  OldSessionPicsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "timeTaken" field.
  DateTime? _timeTaken;
  DateTime? get timeTaken => _timeTaken;
  bool hasTimeTaken() => _timeTaken != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagePath = snapshotData['imagePath'] as String?;
    _timeTaken = snapshotData['timeTaken'] as DateTime?;
    _isPinned = snapshotData['isPinned'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('oldSessionPics')
          : FirebaseFirestore.instance.collectionGroup('oldSessionPics');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('oldSessionPics').doc();

  static Stream<OldSessionPicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OldSessionPicsRecord.fromSnapshot(s));

  static Future<OldSessionPicsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OldSessionPicsRecord.fromSnapshot(s));

  static OldSessionPicsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OldSessionPicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OldSessionPicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OldSessionPicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OldSessionPicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OldSessionPicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOldSessionPicsRecordData({
  String? imagePath,
  DateTime? timeTaken,
  bool? isPinned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagePath': imagePath,
      'timeTaken': timeTaken,
      'isPinned': isPinned,
    }.withoutNulls,
  );

  return firestoreData;
}
