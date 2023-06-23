import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentSessionRecord extends FirestoreRecord {
  CurrentSessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "StartTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "maxPics" field.
  int? _maxPics;
  int get maxPics => _maxPics ?? 0;
  bool hasMaxPics() => _maxPics != null;

  void _initializeFields() {
    _startTime = snapshotData['StartTime'] as DateTime?;
    _endTime = snapshotData['EndTime'] as DateTime?;
    _maxPics = castToType<int>(snapshotData['maxPics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('currentSession');

  static Stream<CurrentSessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentSessionRecord.fromSnapshot(s));

  static Future<CurrentSessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CurrentSessionRecord.fromSnapshot(s));

  static CurrentSessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentSessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentSessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentSessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentSessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentSessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentSessionRecordData({
  DateTime? startTime,
  DateTime? endTime,
  int? maxPics,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'StartTime': startTime,
      'EndTime': endTime,
      'maxPics': maxPics,
    }.withoutNulls,
  );

  return firestoreData;
}
