import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'table_detail_model.dart';
export 'table_detail_model.dart';

class TableDetailWidget extends StatefulWidget {
  const TableDetailWidget({
    super.key,
    required this.tableParam,
  });

  final DocumentReference? tableParam;

  @override
  _TableDetailWidgetState createState() => _TableDetailWidgetState();
}

class _TableDetailWidgetState extends State<TableDetailWidget>
    with TickerProviderStateMixin {
  late TableDetailModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.linear,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableDetailModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          StreamBuilder<TablesRecord>(
            stream: TablesRecord.getDocument(widget.tableParam!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).tertiary,
                      ),
                    ),
                  ),
                );
              }
              final columnTablesRecord = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                          Text(
                            columnTablesRecord.name,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Color(0xFFFF0000),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Rimuovere il tavolo?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Annulla'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Rimuovi'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;

                              await columnTablesRecord.area!.update({
                                ...mapToFirestore(
                                  {
                                    'tablesList': FieldValue.arrayRemove(
                                        [columnTablesRecord.reference]),
                                  },
                                ),
                              });
                              await widget.tableParam!.delete();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Text(
                          'CLIENTI IN ATTESA',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final clientsList =
                              columnTablesRecord.pendingClients.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(clientsList.length,
                                (clientsListIndex) {
                              final clientsListItem =
                                  clientsList[clientsListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream:
                                      UsersRecord.getDocument(clientsListItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(0.0, 1.0),
                                          )
                                        ],
                                      ),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.5,
                                          children: [
                                            SlidableAction(
                                              label: 'Rimuovi',
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              icon: Icons.delete_forever,
                                              onPressed: (_) async {
                                                await widget.tableParam!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'pendingClients':
                                                          FieldValue
                                                              .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                            ),
                                            SlidableAction(
                                              label: 'Accetta',
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              icon: Icons.check,
                                              onPressed: (_) async {
                                                await widget.tableParam!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'pendingClients':
                                                          FieldValue
                                                              .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });

                                                await widget.tableParam!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'clients': FieldValue
                                                          .arrayUnion([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            containerUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          subtitle: Text(
                                            containerUsersRecord.phoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!);
                                  },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 20.0),
                            child: Text(
                              'CLIENTI APPROVATI',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: const Icon(
                              Icons.person_add_alt_sharp,
                              color: Color(0xFF14DC06),
                              size: 30.0,
                            ),
                            onPressed: () async {
                              await columnTablesRecord.reference.update({
                                ...mapToFirestore(
                                  {
                                    'fakeClients': FieldValue.arrayUnion([
                                      random_data.randomString(
                                        1,
                                        10,
                                        true,
                                        false,
                                        false,
                                      )
                                    ]),
                                  },
                                ),
                              });
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            icon: Icon(
                              Icons.person_remove,
                              color: FlutterFlowTheme.of(context).error,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              await columnTablesRecord.reference.update({
                                ...mapToFirestore(
                                  {
                                    'fakeClients': FieldValue.arrayRemove(
                                        [columnTablesRecord.fakeClients.first]),
                                  },
                                ),
                              });
                            },
                          ),
                        ],
                      ),
                      Builder(
                        builder: (context) {
                          final clientsList =
                              columnTablesRecord.clients.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(clientsList.length,
                                (clientsListIndex) {
                              final clientsListItem =
                                  clientsList[clientsListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: StreamBuilder<UsersRecord>(
                                  stream:
                                      UsersRecord.getDocument(clientsListItem),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            offset: const Offset(0.0, 1.0),
                                          )
                                        ],
                                      ),
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          extentRatio: 0.25,
                                          children: [
                                            SlidableAction(
                                              label: 'Rimuovi',
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              icon: Icons.delete_forever,
                                              onPressed: (_) async {
                                                await widget.tableParam!
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'clients': FieldValue
                                                          .arrayRemove([
                                                        containerUsersRecord
                                                            .reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            containerUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          subtitle: Text(
                                            containerUsersRecord.phoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          dense: false,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation2']!);
                                  },
                                ),
                              );
                            }),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          final fakeClientsList =
                              columnTablesRecord.fakeClients.toList();
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(fakeClientsList.length,
                                (fakeClientsListIndex) {
                              final fakeClientsListItem =
                                  fakeClientsList[fakeClientsListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 1.0),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        offset: const Offset(0.0, 1.0),
                                      )
                                    ],
                                  ),
                                  child: Slidable(
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      extentRatio: 0.25,
                                      children: [
                                        SlidableAction(
                                          label: 'Rimuovi',
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                          icon: Icons.delete_forever,
                                          onPressed: (_) async {
                                            await widget.tableParam!.update({
                                              ...mapToFirestore(
                                                {
                                                  'fakeClients':
                                                      FieldValue.arrayRemove([
                                                    fakeClientsListItem
                                                  ]),
                                                },
                                              ),
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        fakeClientsListItem,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge,
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      dense: false,
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                              );
                            }),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
