import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return FutureBuilder<ApiCallResponse>(
      future: GetBancosCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homePageGetBancosResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: Color(0xFFE27800),
              elevation: 8.0,
              child: FlutterFlowIconButton(
                borderColor: Color(0x004B39EF),
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: Color(0x004B39EF),
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'CriarBanco',
                    queryParameters: {
                      'id': serializeParam(
                        0,
                        ParamType.int,
                      ),
                      'nome': serializeParam(
                        '',
                        ParamType.String,
                      ),
                      'digito': serializeParam(
                        0,
                        ParamType.int,
                      ),
                      'numero': serializeParam(
                        0,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xFFE27800),
              automaticallyImplyLeading: false,
              title: Text(
                'Bancos',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 51.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE27800),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Nome Banco',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
                                Text(
                                  'Visualizar',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                                Text(
                                  'Deletar',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final listaDeBancos =
                            homePageGetBancosResponse.jsonBody.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listaDeBancos.length,
                          itemBuilder: (context, listaDeBancosIndex) {
                            final listaDeBancosItem =
                                listaDeBancos[listaDeBancosIndex];
                            return Container(
                              width: 100.0,
                              height: 43.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                border: Border.all(
                                  color: Color(0x0014181B),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.45,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.00, 0.00),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                listaDeBancosItem,
                                                r'''$.nome''',
                                              ).toString(),
                                              maxLines: 3,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x004B39EF),
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: Icon(
                                              Icons.remove_red_eye_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              var _shouldSetState = false;

                                              context.pushNamed(
                                                'EditarBancos',
                                                queryParameters: {
                                                  'id': serializeParam(
                                                    getJsonField(
                                                      listaDeBancosItem,
                                                      r'''$.id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'nome': serializeParam(
                                                    getJsonField(
                                                      listaDeBancosItem,
                                                      r'''$.nome''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'digito': serializeParam(
                                                    getJsonField(
                                                      listaDeBancosItem,
                                                      r'''$.digito''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'numero': serializeParam(
                                                    getJsonField(
                                                      listaDeBancosItem,
                                                      r'''$.numero''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              _model.apiResultv03 =
                                                  await GetBancoByIdCall.call(
                                                idBanco: getJsonField(
                                                  listaDeBancosItem,
                                                  r'''$.id''',
                                                ),
                                              );
                                              _shouldSetState = true;
                                              if ((_model.apiResultv03
                                                      ?.succeeded ??
                                                  true)) {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Ocorreu um erro ao acessar essa infromação, entre em contato com o time de T.I',
                                                    style: TextStyle(
                                                      color: Color(0xFFFF0000),
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.35,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  23.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0x004B39EF),
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            fillColor: Color(0x004B39EF),
                                            icon: FaIcon(
                                              FontAwesomeIcons.trashAlt,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
