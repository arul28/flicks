import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _subject = snapshotData['subject'] as String?;
    _email = snapshotData['email'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tickets')
          : FirebaseFirestore.instance.collectionGroup('tickets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('tickets').doc();

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  String? message,
  String? subject,
  String? email,
  DateTime? dateCreated,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'subject': subject,
      'email': email,
      'dateCreated': dateCreated,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.subject == e2?.subject &&
        e1?.email == e2?.email &&
        e1?.dateCreated == e2?.dateCreated;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality()
      .hash([e?.message, e?.subject, e?.email, e?.dateCreated]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
