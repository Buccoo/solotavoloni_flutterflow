import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TablesRecord extends FirestoreRecord {
  TablesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "area" field.
  DocumentReference? _area;
  DocumentReference? get area => _area;
  bool hasArea() => _area != null;

  // "maxPerson" field.
  int? _maxPerson;
  int get maxPerson => _maxPerson ?? 0;
  bool hasMaxPerson() => _maxPerson != null;

  // "clients" field.
  List<DocumentReference>? _clients;
  List<DocumentReference> get clients => _clients ?? const [];
  bool hasClients() => _clients != null;

  // "prRef" field.
  DocumentReference? _prRef;
  DocumentReference? get prRef => _prRef;
  bool hasPrRef() => _prRef != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "pendingClients" field.
  List<DocumentReference>? _pendingClients;
  List<DocumentReference> get pendingClients => _pendingClients ?? const [];
  bool hasPendingClients() => _pendingClients != null;

  // "tavolone" field.
  bool? _tavolone;
  bool get tavolone => _tavolone ?? false;
  bool hasTavolone() => _tavolone != null;

  // "fakeClients" field.
  List<String>? _fakeClients;
  List<String> get fakeClients => _fakeClients ?? const [];
  bool hasFakeClients() => _fakeClients != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _area = snapshotData['area'] as DocumentReference?;
    _maxPerson = castToType<int>(snapshotData['maxPerson']);
    _clients = getDataList(snapshotData['clients']);
    _prRef = snapshotData['prRef'] as DocumentReference?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _pendingClients = getDataList(snapshotData['pendingClients']);
    _tavolone = snapshotData['tavolone'] as bool?;
    _fakeClients = getDataList(snapshotData['fakeClients']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Tables')
          : FirebaseFirestore.instance.collectionGroup('Tables');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Tables').doc();

  static Stream<TablesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TablesRecord.fromSnapshot(s));

  static Future<TablesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TablesRecord.fromSnapshot(s));

  static TablesRecord fromSnapshot(DocumentSnapshot snapshot) => TablesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TablesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TablesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TablesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TablesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTablesRecordData({
  String? name,
  DocumentReference? area,
  int? maxPerson,
  DocumentReference? prRef,
  DateTime? createdAt,
  bool? tavolone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'area': area,
      'maxPerson': maxPerson,
      'prRef': prRef,
      'createdAt': createdAt,
      'tavolone': tavolone,
    }.withoutNulls,
  );

  return firestoreData;
}

class TablesRecordDocumentEquality implements Equality<TablesRecord> {
  const TablesRecordDocumentEquality();

  @override
  bool equals(TablesRecord? e1, TablesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.area == e2?.area &&
        e1?.maxPerson == e2?.maxPerson &&
        listEquality.equals(e1?.clients, e2?.clients) &&
        e1?.prRef == e2?.prRef &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.pendingClients, e2?.pendingClients) &&
        e1?.tavolone == e2?.tavolone &&
        listEquality.equals(e1?.fakeClients, e2?.fakeClients);
  }

  @override
  int hash(TablesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.area,
        e?.maxPerson,
        e?.clients,
        e?.prRef,
        e?.createdAt,
        e?.pendingClients,
        e?.tavolone,
        e?.fakeClients
      ]);

  @override
  bool isValidKey(Object? o) => o is TablesRecord;
}
