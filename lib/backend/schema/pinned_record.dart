import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PinnedRecord extends FirestoreRecord {
  PinnedRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagePath = snapshotData['imagePath'] as String?;
    _timeTaken = snapshotData['timeTaken'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pinned')
          : FirebaseFirestore.instance.collectionGroup('pinned');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('pinned').doc();

  static Stream<PinnedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PinnedRecord.fromSnapshot(s));

  static Future<PinnedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PinnedRecord.fromSnapshot(s));

  static PinnedRecord fromSnapshot(DocumentSnapshot snapshot) => PinnedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PinnedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PinnedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PinnedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PinnedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPinnedRecordData({
  String? imagePath,
  DateTime? timeTaken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagePath': imagePath,
      'timeTaken': timeTaken,
    }.withoutNulls,
  );

  return firestoreData;
}

class PinnedRecordDocumentEquality implements Equality<PinnedRecord> {
  const PinnedRecordDocumentEquality();

  @override
  bool equals(PinnedRecord? e1, PinnedRecord? e2) {
    return e1?.imagePath == e2?.imagePath && e1?.timeTaken == e2?.timeTaken;
  }

  @override
  int hash(PinnedRecord? e) =>
      const ListEquality().hash([e?.imagePath, e?.timeTaken]);

  @override
  bool isValidKey(Object? o) => o is PinnedRecord;
}
