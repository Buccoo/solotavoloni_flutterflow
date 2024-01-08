// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReservationStruct extends FFFirebaseStruct {
  ReservationStruct({
    DocumentReference? tableRef,
    DocumentReference? eventRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tableRef = tableRef,
        _eventRef = eventRef,
        super(firestoreUtilData);

  // "table_ref" field.
  DocumentReference? _tableRef;
  DocumentReference? get tableRef => _tableRef;
  set tableRef(DocumentReference? val) => _tableRef = val;
  bool hasTableRef() => _tableRef != null;

  // "event_ref" field.
  DocumentReference? _eventRef;
  DocumentReference? get eventRef => _eventRef;
  set eventRef(DocumentReference? val) => _eventRef = val;
  bool hasEventRef() => _eventRef != null;

  static ReservationStruct fromMap(Map<String, dynamic> data) =>
      ReservationStruct(
        tableRef: data['table_ref'] as DocumentReference?,
        eventRef: data['event_ref'] as DocumentReference?,
      );

  static ReservationStruct? maybeFromMap(dynamic data) => data is Map
      ? ReservationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'table_ref': _tableRef,
        'event_ref': _eventRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'table_ref': serializeParam(
          _tableRef,
          ParamType.DocumentReference,
        ),
        'event_ref': serializeParam(
          _eventRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ReservationStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReservationStruct(
        tableRef: deserializeParam(
          data['table_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Events', 'Tables'],
        ),
        eventRef: deserializeParam(
          data['event_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Events'],
        ),
      );

  @override
  String toString() => 'ReservationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReservationStruct &&
        tableRef == other.tableRef &&
        eventRef == other.eventRef;
  }

  @override
  int get hashCode => const ListEquality().hash([tableRef, eventRef]);
}

ReservationStruct createReservationStruct({
  DocumentReference? tableRef,
  DocumentReference? eventRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReservationStruct(
      tableRef: tableRef,
      eventRef: eventRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReservationStruct? updateReservationStruct(
  ReservationStruct? reservation, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    reservation
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReservationStructData(
  Map<String, dynamic> firestoreData,
  ReservationStruct? reservation,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (reservation == null) {
    return;
  }
  if (reservation.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && reservation.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reservationData =
      getReservationFirestoreData(reservation, forFieldValue);
  final nestedData =
      reservationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = reservation.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReservationFirestoreData(
  ReservationStruct? reservation, [
  bool forFieldValue = false,
]) {
  if (reservation == null) {
    return {};
  }
  final firestoreData = mapToFirestore(reservation.toMap());

  // Add any Firestore field values
  reservation.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReservationListFirestoreData(
  List<ReservationStruct>? reservations,
) =>
    reservations?.map((e) => getReservationFirestoreData(e, true)).toList() ??
    [];
