import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'testpage_model.dart';
export 'testpage_model.dart';

class TestpageWidget extends StatefulWidget {
  const TestpageWidget({super.key});

  @override
  State<TestpageWidget> createState() => _TestpageWidgetState();
}

class _TestpageWidgetState extends State<TestpageWidget> {
  late TestpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestpageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'testpage'});
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
        backgroundColor: FlutterFlowTheme.of(context).info,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDowndepValueController ??=
                      FormFieldController<String>(null),
                  options: const [
                    '分環所',
                    '人類所',
                    '天文所',
                    '智慧生醫博士學位學程',
                    '醫工所',
                    '醫環系',
                    '化工系',
                    '化學系',
                    '中文系',
                    '華語中心',
                    '通訊所',
                    '資工系',
                    '半導體研究學院',
                    '科管院',
                    '醫科系',
                    '工學院',
                    '電資院',
                    '經濟系',
                    '電機系',
                    '電資院學士班',
                    '高階經營管理碩士專班',
                    'EMBA雙聯學位學程',
                    '智慧製造高階在職專班',
                    'EMBA亞太馬國境外專班',
                    'EMBA深圳境外專班',
                    '電子所',
                    '工科系',
                    '外語系',
                    '通識中心',
                    '通識核心',
                    '台研教專班',
                    '健康經管碩士在職專班',
                    '歷史所',
                    '人社院學士班',
                    '清華學院國際學士班',
                    '計科所',
                    '工工系',
                    '工工在職專班',
                    '資安所',
                    'IMBA碩士班',
                    '跨院國際碩士學位',
                    '跨院國際博士學位',
                    '科管院學士班',
                    '光電所',
                    '清華學院學士班',
                    '資應所',
                    '服科所',
                    '藝術學院',
                    '藝設系',
                    '科技藝術研究所',
                    '藝術學院學士班',
                    '音樂系',
                    '環文系',
                    '環文系在職專班',
                    '幼教系',
                    '幼教系在職專班',
                    '教科系',
                    '教科系在職專班',
                    '英教系',
                    '竹師教育學院博士班',
                    '竹師教育學院',
                    '竹師教育學院學士班',
                    '學科所',
                    '數理所',
                    '數理所在職專班',
                    '心諮系',
                    '心諮系在職專班',
                    'STEAM碩士在職專班',
                    '特教系',
                    '運科系',
                    '運科系在職專班',
                    '臺語所',
                    '華德福碩士在職學程',
                    '英語教育中心(110起)',
                    '語文中心',
                    '語言所',
                    '生科系',
                    '生資所',
                    '生技所',
                    '生醫學院',
                    '分生所',
                    '分醫所',
                    '系神所',
                    '科法所',
                    '數學系',
                    'MBA專班',
                    '華語文碩士學位學程',
                    '財金碩士專班',
                    '國防教育課',
                    '公共政策與管理專班',
                    '材料系',
                    '奈微所',
                    '核工所',
                    '原科院',
                    '體育室',
                    '哲學所',
                    '物理系',
                    '動機系',
                    '精準醫療博士學位學程',
                    '計財系',
                    '藥品醫材法規科學專班',
                    '華文所',
                    '社群人智國際學程',
                    '社會所',
                    '統計所',
                    '師培中心(中等教程)',
                    '師培中心(國小教程)',
                    '師培中心(一般課程)',
                    '清華學院',
                    '學士後醫學系',
                    '國際研究生學程',
                    '台文所',
                    '科管所',
                    '台北政經學院',
                    '服務學習'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDowndepValue = val),
                  width: 248.0,
                  height: 58.0,
                  searchHintTextStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'YuPearl',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                  searchTextStyle:
                      FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'YuPearl',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'YuPearl',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  hintText: '課程系所',
                  searchHintText: 'Search ',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: FlutterFlowTheme.of(context).info,
                  elevation: 2.0,
                  borderColor: FlutterFlowTheme.of(context).primaryText,
                  borderWidth: 2.0,
                  borderRadius: 10.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: true,
                  isMultiSelect: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
