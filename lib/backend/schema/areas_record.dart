import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AreasRecord extends FirestoreRecord {
  AreasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "manPrice" field.
  int? _manPrice;
  int get manPrice => _manPrice ?? 0;
  bool hasManPrice() => _manPrice != null;

  // "womanPrice" field.
  int? _womanPrice;
  int get womanPrice => _womanPrice ?? 0;
  bool hasWomanPrice() => _womanPrice != null;

  // "maxPeopleAtTable" field.
  int? _maxPeopleAtTable;
  int get maxPeopleAtTable => _maxPeopleAtTable ?? 0;
  bool hasMaxPeopleAtTable() => _maxPeopleAtTable != null;

  // "minBudgetAtTable" field.
  int? _minBudgetAtTable;
  int get minBudgetAtTable => _minBudgetAtTable ?? 0;
  bool hasMinBudgetAtTable() => _minBudgetAtTable != null;

  // "areaName" field.
  String? _areaName;
  String get areaName => _areaName ?? '';
  bool hasAreaName() => _areaName != null;

  // "displayName" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "guests" field.
  List<String>? _guests;
  List<String> get guests => _guests ?? const [];
  bool hasGuests() => _guests != null;

  // "tablesList" field.
  List<DocumentReference>? _tablesList;
  List<DocumentReference> get tablesList => _tablesList ?? const [];
  bool hasTablesList() => _tablesList != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _manPrice = castToType<int>(snapshotData['manPrice']);
    _womanPrice = castToType<int>(snapshotData['womanPrice']);
    _maxPeopleAtTable = castToType<int>(snapshotData['maxPeopleAtTable']);
    _minBudgetAtTable = castToType<int>(snapshotData['minBudgetAtTable']);
    _areaName = snapshotData['areaName'] as String?;
    _displayName = snapshotData['displayName'] as String?;
    _guests = getDataList(snapshotData['guests']);
    _tablesList = getDataList(snapshotData['tablesList']);
    _available = snapshotData['available'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Areas')
          : FirebaseFirestore.instance.collectionGroup('Areas');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Areas').doc();

  static Stream<AreasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AreasRecord.fromSnapshot(s));

  static Future<AreasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AreasRecord.fromSnapshot(s));

  static AreasRecord fromSnapshot(DocumentSnapshot snapshot) => AreasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AreasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AreasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AreasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AreasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAreasRecordData({
  int? manPrice,
  int? womanPrice,
  int? maxPeopleAtTable,
  int? minBudgetAtTable,
  String? areaName,
  String? displayName,
  bool? available,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'manPrice': manPrice,
      'womanPrice': womanPrice,
      'maxPeopleAtTable': maxPeopleAtTable,
      'minBudgetAtTable': minBudgetAtTable,
      'areaName': areaName,
      'displayName': displayName,
      'available': available,
    }.withoutNulls,
  );

  return firestoreData;
}

class AreasRecordDocumentEquality implements Equality<AreasRecord> {
  const AreasRecordDocumentEquality();

  @override
  bool equals(AreasRecord? e1, AreasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.manPrice == e2?.manPrice &&
        e1?.womanPrice == e2?.womanPrice &&
        e1?.maxPeopleAtTable == e2?.maxPeopleAtTable &&
        e1?.minBudgetAtTable == e2?.minBudgetAtTable &&
        e1?.areaName == e2?.areaName &&
        e1?.displayName == e2?.displayName &&
        listEquality.equals(e1?.guests, e2?.guests) &&
        listEquality.equals(e1?.tablesList, e2?.tablesList) &&
        e1?.available == e2?.available;
  }

  @override
  int hash(AreasRecord? e) => const ListEquality().hash([
        e?.manPrice,
        e?.womanPrice,
        e?.maxPeopleAtTable,
        e?.minBudgetAtTable,
        e?.areaName,
        e?.displayName,
        e?.guests,
        e?.tablesList,
        e?.available
      ]);

  @override
  bool isValidKey(Object? o) => o is AreasRecord;
}
