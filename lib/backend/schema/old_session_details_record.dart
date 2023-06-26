import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OldSessionDetailsRecord extends FirestoreRecord {
  OldSessionDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "maxPics" field.
  int? _maxPics;
  int get maxPics => _maxPics ?? 0;
  bool hasMaxPics() => _maxPics != null;

  void _initializeFields() {
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _maxPics = castToType<int>(snapshotData['maxPics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('oldSessionDetails');

  static Stream<OldSessionDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OldSessionDetailsRecord.fromSnapshot(s));

  static Future<OldSessionDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OldSessionDetailsRecord.fromSnapshot(s));

  static OldSessionDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OldSessionDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OldSessionDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OldSessionDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OldSessionDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OldSessionDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOldSessionDetailsRecordData({
  DateTime? startTime,
  DateTime? endTime,
  int? maxPics,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startTime': startTime,
      'endTime': endTime,
      'maxPics': maxPics,
    }.withoutNulls,
  );

  return firestoreData;
}
