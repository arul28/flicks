import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentSessionPicsRecord extends FirestoreRecord {
  CurrentSessionPicsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagePath = snapshotData['imagePath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('currentSessionPics')
          : FirebaseFirestore.instance.collectionGroup('currentSessionPics');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('currentSessionPics').doc();

  static Stream<CurrentSessionPicsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentSessionPicsRecord.fromSnapshot(s));

  static Future<CurrentSessionPicsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CurrentSessionPicsRecord.fromSnapshot(s));

  static CurrentSessionPicsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentSessionPicsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentSessionPicsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentSessionPicsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentSessionPicsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentSessionPicsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentSessionPicsRecordData({
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagePath': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}
