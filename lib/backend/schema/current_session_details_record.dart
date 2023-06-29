import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentSessionDetailsRecord extends FirestoreRecord {
  CurrentSessionDetailsRecord._(
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
      FirebaseFirestore.instance.collection('currentSessionDetails');

  static Stream<CurrentSessionDetailsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CurrentSessionDetailsRecord.fromSnapshot(s));

  static Future<CurrentSessionDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CurrentSessionDetailsRecord.fromSnapshot(s));

  static CurrentSessionDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CurrentSessionDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CurrentSessionDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CurrentSessionDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CurrentSessionDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CurrentSessionDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCurrentSessionDetailsRecordData({
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

class CurrentSessionDetailsRecordDocumentEquality
    implements Equality<CurrentSessionDetailsRecord> {
  const CurrentSessionDetailsRecordDocumentEquality();

  @override
  bool equals(
      CurrentSessionDetailsRecord? e1, CurrentSessionDetailsRecord? e2) {
    return e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.maxPics == e2?.maxPics;
  }

  @override
  int hash(CurrentSessionDetailsRecord? e) =>
      const ListEquality().hash([e?.startTime, e?.endTime, e?.maxPics]);

  @override
  bool isValidKey(Object? o) => o is CurrentSessionDetailsRecord;
}
