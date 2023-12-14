import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ToDoListRecord extends FirestoreRecord {
  ToDoListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "toDoDate" field.
  DateTime? _toDoDate;
  DateTime? get toDoDate => _toDoDate;
  bool hasToDoDate() => _toDoDate != null;

  // "toDoName" field.
  String? _toDoName;
  String get toDoName => _toDoName ?? '';
  bool hasToDoName() => _toDoName != null;

  // "toDoDescription" field.
  String? _toDoDescription;
  String get toDoDescription => _toDoDescription ?? '';
  bool hasToDoDescription() => _toDoDescription != null;

  // "toDoState" field.
  bool? _toDoState;
  bool get toDoState => _toDoState ?? false;
  bool hasToDoState() => _toDoState != null;

  // "completedDate" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  void _initializeFields() {
    _toDoDate = snapshotData['toDoDate'] as DateTime?;
    _toDoName = snapshotData['toDoName'] as String?;
    _toDoDescription = snapshotData['toDoDescription'] as String?;
    _toDoState = snapshotData['toDoState'] as bool?;
    _completedDate = snapshotData['completedDate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToDoListRecord.fromSnapshot(s));

  static Future<ToDoListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToDoListRecord.fromSnapshot(s));

  static ToDoListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToDoListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToDoListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToDoListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToDoListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToDoListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToDoListRecordData({
  DateTime? toDoDate,
  String? toDoName,
  String? toDoDescription,
  bool? toDoState,
  DateTime? completedDate,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'toDoDate': toDoDate,
      'toDoName': toDoName,
      'toDoDescription': toDoDescription,
      'toDoState': toDoState,
      'completedDate': completedDate,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToDoListRecordDocumentEquality implements Equality<ToDoListRecord> {
  const ToDoListRecordDocumentEquality();

  @override
  bool equals(ToDoListRecord? e1, ToDoListRecord? e2) {
    return e1?.toDoDate == e2?.toDoDate &&
        e1?.toDoName == e2?.toDoName &&
        e1?.toDoDescription == e2?.toDoDescription &&
        e1?.toDoState == e2?.toDoState &&
        e1?.completedDate == e2?.completedDate &&
        e1?.user == e2?.user;
  }

  @override
  int hash(ToDoListRecord? e) => const ListEquality().hash([
        e?.toDoDate,
        e?.toDoName,
        e?.toDoDescription,
        e?.toDoState,
        e?.completedDate,
        e?.user
      ]);

  @override
  bool isValidKey(Object? o) => o is ToDoListRecord;
}
