import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'privacy_page_model.dart';
export 'privacy_page_model.dart';

class PrivacyPageWidget extends StatefulWidget {
  const PrivacyPageWidget({super.key});

  @override
  State<PrivacyPageWidget> createState() => _PrivacyPageWidgetState();
}

class _PrivacyPageWidgetState extends State<PrivacyPageWidget>
    with TickerProviderStateMixin {
  late PrivacyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'privacy_page'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: FlutterFlowTheme.of(context).accent1,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).accent1,
                      icon: Icon(
                        Icons.chevron_left_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'PRIVACY_chevron_left_rounded_ICN_ON_TAP');
                        logFirebaseEvent('IconButton_navigate_back');
                        context.safePop();
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: const Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'YuPearl',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                        unselectedLabelStyle: const TextStyle(),
                        indicatorColor: const Color(0xFF42BAF1),
                        padding: const EdgeInsets.all(4.0),
                        tabs: const [
                          Tab(
                            text: '隱私權政策',
                          ),
                          Tab(
                            text: '用戶規範',
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 5.0, 15.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    '隱私權政策',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x3C14181B),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Text(
                                                  '\n非常歡迎您下載「Connextion」，為了讓您能夠安心的使用本App的各項服務與資訊，特此向您說明本App的隱私權保護政策，以保障您的權益，請您詳閱下列內容： \n\n1.  隱私權保護政策的適用範圍 :\n隱私權保護政策內容，包括本App如何處理在您使用網站服務時收集到的個人識別資料。隱私權保護政策不適用於本App以外的相關連結網站，也不適用於非本App所委託或參與管理的人員。\n \n2. 個人資料的蒐集、處理及利用方式 ：\n\n當您造訪本App或使用本App所提供之功能服務時，我們將視該服務功能性質，請您提供必要的個人資料，並在該特定目的範圍內處理及利用您的個人資料；非經您書面同意，本App不會將個人資料用於其他用途。 \n\n本App在您使用服務信箱、問卷調查等互動性功能時，會保留您所提供的姓名、電子郵件地址、聯絡方式及使用時間等。 \n\n於一般連線時，伺服器會自行記錄相關行徑，包括您使用連線設備的IP位址、使用時間、使用的作業系統、瀏覽及點選資料記錄等，做為我們增進App服務的參考依據，此記錄為內部應用，决不對外公佈。\n\n為提供精確的服務，我們會將收集的問卷調查內容進行統計與分析，分析結果之統計數據或說明文字呈現，除供內部研究外，我們會視需要公佈統計數據及說明文字，但不涉及特定個人之資料。 \n\n您可以隨時向我們提出請求，以更正或刪除您的帳戶或本App所蒐集的個人資料等隱私資訊。聯繫方式請見最下方聯繫管道。 \n\n3. 資料之保護 :\n\n我們蒐集的資料可能儲存在您的裝置或我們的伺服器上（包括我們向第三方租用的雲端伺服器Firebase)，本App主機均設有防火牆、防毒系統等相關的各項資訊安全設備及必要的安全防護措施，加以保護網站及您的個人資料採用嚴格的保護措施，只由經過授權的人員才能接觸您的個人資料，相關處理人員皆簽有保密合約，如有違反保密義務者，將會受到相關的法律處分。\n\n如因業務需要有必要委託其他單位提供服務時，本App亦會嚴格要求其遵守保密義務，並且採取必要檢查程式以確定其將確實遵守。\n\n\n4. 網站對外的相關連結 \n本App的網頁提供其他網站的網路連結，您也可經由本App所提供的連結，點選進入其他網站。 但該連結網站不適用本App的隱私權保護政策，您必須參考該連結網站中的隱私權保護政策。 \n\n\n5. 與第三人共用個人資料之政策 \n本App絕不會提供、交換、出租或出售任何您的個人資料給其他個人、團體、私人企業或公務機關，但有法律依據或合約義務者，不在此限。 前項但書之情形包括不限於：\n\n前項但書之情形包括不限於： \n(1)經由您書面同意。 \n\n(2)法律明文規定。 \n\n(3)為免除您生命、身體、自由或財產上之危險。 \n\n(4)與公務機關或學術研究機構合作，基於公共利益為統計或學術研究而有必要，且資料經過提供者處理或蒐集者依其揭露方式無從識別特定之當事人。\n\n(5)當您在App裏的行為，違反服務條款或可能損害或妨礙App與其他使用者權益或導致任何人遭受損害時，經App管理組織研析揭露您的個人資料是為了辨識、聯絡或採取法律行動所必要者。\n\n(6)有利於您的權益。\n\n(7)本App委託廠商協助蒐集、處理或利用您的個人資料時，將對委外廠商或個人善盡監督管理之責。\n\n6. 隱私權保護政策之修正 \n本App隱私權保護政策將因應需求隨時進行修正，修正後的條款將刊登於網站上。\n\n7. 聯繫管道 \n對於本App之隱私權政策有任何疑問，或者想提出變更、移除個人資料之請求，請透過電子郵件寄至：support@connextion.com.tw',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        color:
                                                            const Color(0xD114181B),
                                                        letterSpacing: 3.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 5.0, 15.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: Text(
                                    '用戶規範',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'YuPearl',
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x3C14181B),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(30.0),
                                          bottomRight: Radius.circular(30.0),
                                          topLeft: Radius.circular(30.0),
                                          topRight: Radius.circular(30.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 20.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Text(
                                                  '終端使用者授權協議（EULA） - Connextion \n本終端使用者授權協議（\"EULA\"）是您與Connextion之間的法律協議。我們的EULA是由EULA模板為Connextion創建的。此EULA協議規範您直接從Connextion或間接通過Connextion授權的經銷商或分銷商（\"經銷商\"）獲取並使用我們的Connextion軟體（\"軟體\"）。在完成安裝過程並使用Connextion軟體之前，請仔細閱讀此EULA協議。它提供了使用Connextion軟體的許可，並包含保修信息和責任免除聲明。如果您註冊了Connextion軟體的免費試用，此EULA協議也將規範該試用。通過點擊\"接受\"或安裝和/或使用Connextion軟體，您確認接受該軟體並同意受此EULA協議的條款約束。如果您代表一家公司或其他法律實體簽訂此EULA協議，您聲明您有權將該實體及其關聯公司約束於這些條款和條件。如果您沒有這樣的權限，或者您不同意此EULA協議的條款和條件，請不要安裝或使用軟體，且您必須不接受此EULA協議。 此EULA協議僅適用於Connextion提供的軟體，無論是否參考或描述了其他軟體。條款也適用於任何Connextion更新、補充、基於互聯網的服務和對軟體的支持服務，除非這些項目在交付時伴隨其他條款。如果是，那些條款適用。 \n\n授權許可：\nConnextion特此授予您一個個人的、不可轉讓的、非獨家許可，按照此EULA協議的條款在您的設備上使用Connextion軟體。 您可以將Connextion軟體加載到您控制下的設備上（例如PC、筆記本電腦、手機或平板）。您負責確保您的設備滿足Connextion軟體的最低要求。 \n您不得： \n\t編輯、更改、修改、改編、翻譯或以其他方式更改軟體的全部或任何部分，也不得允許將軟體的全部或任何部分與任何其他軟體結合或嵌入其中，也不得對軟體進行反編譯、反組裝或反向工程或嘗試進行任何此類事項 \n\t複製、分發、轉售或以任何商業目的使用軟體 \n\t允許任何第三方代表或為任何第三方的利益使用軟體 \n\t以任何違反適用的地方、國家或國際法的方式使用軟體 \n\t以Connextion認為違反此EULA協議的任何目的使用軟體 \n\n知識產權與所有權：\nConnextion將始終保留您最初下載的軟體以及您隨後下載的軟體的所有權。軟體（及其版權和其他任何性質的知識產權，包括對其所做的任何修改）是並將始終是Connextion的財產。 Connextion保留授權第三方使用軟體的權利。 \n\n終止： \n此EULA協議自您首次使用軟體之日起生效，並將持續有效直至終止。您可以隨時通過向Connextion發送書面通知來終止它。 如果您未能遵守此EULA協議的任何條款，協議將立即終止。在此情況下，由此EULA協議授予的許可將立即終止，並且您同意停止所有訪問和使用軟體。本EULA協議的性質繼續和存續的條款將在任何終止後生存。 \n\n管轄法律：\n此EULA協議及因此EULA協議產生的或與之相關的任何爭議，應受該協議管轄法律的管轄並依其解釋。\n',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'YuPearl',
                                                        color:
                                                            const Color(0xD114181B),
                                                        fontSize: 14.0,
                                                        letterSpacing: 3.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
