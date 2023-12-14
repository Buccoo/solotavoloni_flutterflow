// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TableStruct extends FFFirebaseStruct {
  TableStruct({
    String? name,
    DocumentReference? area,
    int? maxPeople,
    DocumentReference? pRReference,
    List<DocumentReference>? clients,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _area = area,
        _maxPeople = maxPeople,
        _pRReference = pRReference,
        _clients = clients,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "area" field.
  DocumentReference? _area;
  DocumentReference? get area => _area;
  set area(DocumentReference? val) => _area = val;
  bool hasArea() => _area != null;

  // "maxPeople" field.
  int? _maxPeople;
  int get maxPeople => _maxPeople ?? 0;
  set maxPeople(int? val) => _maxPeople = val;
  void incrementMaxPeople(int amount) => _maxPeople = maxPeople + amount;
  bool hasMaxPeople() => _maxPeople != null;

  // "PRReference" field.
  DocumentReference? _pRReference;
  DocumentReference? get pRReference => _pRReference;
  set pRReference(DocumentReference? val) => _pRReference = val;
  bool hasPRReference() => _pRReference != null;

  // "clients" field.
  List<DocumentReference>? _clients;
  List<DocumentReference> get clients => _clients ?? const [];
  set clients(List<DocumentReference>? val) => _clients = val;
  void updateClients(Function(List<DocumentReference>) updateFn) =>
      updateFn(_clients ??= []);
  bool hasClients() => _clients != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  static TableStruct fromMap(Map<String, dynamic> data) => TableStruct(
        name: data['name'] as String?,
        area: data['area'] as DocumentReference?,
        maxPeople: castToType<int>(data['maxPeople']),
        pRReference: data['PRReference'] as DocumentReference?,
        clients: getDataList(data['clients']),
        createdAt: data['createdAt'] as DateTime?,
      );

  static TableStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TableStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'area': _area,
        'maxPeople': _maxPeople,
        'PRReference': _pRReference,
        'clients': _clients,
        'createdAt': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'area': serializeParam(
          _area,
          ParamType.DocumentReference,
        ),
        'maxPeople': serializeParam(
          _maxPeople,
          ParamType.int,
        ),
        'PRReference': serializeParam(
          _pRReference,
          ParamType.DocumentReference,
        ),
        'clients': serializeParam(
          _clients,
          ParamType.DocumentReference,
          true,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TableStruct fromSerializableMap(Map<String, dynamic> data) =>
      TableStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        area: deserializeParam(
          data['area'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Events', 'Areas'],
        ),
        maxPeople: deserializeParam(
          data['maxPeople'],
          ParamType.int,
          false,
        ),
        pRReference: deserializeParam(
          data['PRReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Users'],
        ),
        clients: deserializeParam<DocumentReference>(
          data['clients'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['Users'],
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TableStruct &&
        name == other.name &&
        area == other.area &&
        maxPeople == other.maxPeople &&
        pRReference == other.pRReference &&
        listEquality.equals(clients, other.clients) &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, area, maxPeople, pRReference, clients, createdAt]);
}

TableStruct createTableStruct({
  String? name,
  DocumentReference? area,
  int? maxPeople,
  DocumentReference? pRReference,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TableStruct(
      name: name,
      area: area,
      maxPeople: maxPeople,
      pRReference: pRReference,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TableStruct? updateTableStruct(
  TableStruct? table, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    table
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTableStructData(
  Map<String, dynamic> firestoreData,
  TableStruct? table,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (table == null) {
    return;
  }
  if (table.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && table.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tableData = getTableFirestoreData(table, forFieldValue);
  final nestedData = tableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = table.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTableFirestoreData(
  TableStruct? table, [
  bool forFieldValue = false,
]) {
  if (table == null) {
    return {};
  }
  final firestoreData = mapToFirestore(table.toMap());

  // Add any Firestore field values
  table.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTableListFirestoreData(
  List<TableStruct>? tables,
) =>
    tables?.map((e) => getTableFirestoreData(e, true)).toList() ?? [];
