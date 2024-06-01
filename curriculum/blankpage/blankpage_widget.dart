import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'blankpage_model.dart';
export 'blankpage_model.dart';

class BlankpageWidget extends StatefulWidget {
  const BlankpageWidget({super.key});

  @override
  State<BlankpageWidget> createState() => _BlankpageWidgetState();
}

class _BlankpageWidgetState extends State<BlankpageWidget> {
  late BlankpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlankpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'blankpage'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
    );
  }
}
