import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryRecord extends FirestoreRecord {
  HistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imagesList" field.
  List<String>? _imagesList;
  List<String> get imagesList => _imagesList ?? const [];
  bool hasImagesList() => _imagesList != null;

  // "developedAt" field.
  DateTime? _developedAt;
  DateTime? get developedAt => _developedAt;
  bool hasDevelopedAt() => _developedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagesList = getDataList(snapshotData['imagesList']);
    _developedAt = snapshotData['developedAt'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('history')
          : FirebaseFirestore.instance.collectionGroup('history');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('history').doc();

  static Stream<HistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HistoryRecord.fromSnapshot(s));

  static Future<HistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HistoryRecord.fromSnapshot(s));

  static HistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHistoryRecordData({
  DateTime? developedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'developedAt': developedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class HistoryRecordDocumentEquality implements Equality<HistoryRecord> {
  const HistoryRecordDocumentEquality();

  @override
  bool equals(HistoryRecord? e1, HistoryRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imagesList, e2?.imagesList) &&
        e1?.developedAt == e2?.developedAt;
  }

  @override
  int hash(HistoryRecord? e) =>
      const ListEquality().hash([e?.imagesList, e?.developedAt]);

  @override
  bool isValidKey(Object? o) => o is HistoryRecord;
}
