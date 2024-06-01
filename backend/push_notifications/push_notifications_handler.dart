import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: const Color(0xFFE5E5F5),
          child: Center(
            child: Image.asset(
              'assets/images/S__4612108-removebg-preview.png',
              width: 180.0,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'main': ParameterData.none(),
  'auth_2_Create': ParameterData.none(),
  'auth_2_Login': ParameterData.none(),
  'auth_2_ForgotPassword': ParameterData.none(),
  'auth_2_createProfile': ParameterData.none(),
  'auth_2_Profile': ParameterData.none(),
  'auth_2_EditProfile': ParameterData.none(),
  'chat_2_Details': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'chat_2_main': ParameterData.none(),
  'chat_2_InviteUsers': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'image_Details': (data) async => ParameterData(
        allParams: {
          'chatMessage': await getDocumentParameter<ChatMessagesRecord>(
              data, 'chatMessage', ChatMessagesRecord.fromSnapshot),
          'clickphotodetail': getParameter<String>(data, 'clickphotodetail'),
        },
      ),
  'postpage': ParameterData.none(),
  'own_post': ParameterData.none(),
  'edit_postpage': (data) async => ParameterData(
        allParams: {
          'ownpost': await getDocumentParameter<PostRecord>(
              data, 'ownpost', PostRecord.fromSnapshot),
        },
      ),
  'invitepage': ParameterData.none(),
  'youraskviewpage': ParameterData.none(),
  'detailinvitepage': (data) async => ParameterData(
        allParams: {
          'invitebyotherdetail':
              getParameter<DocumentReference>(data, 'invitebyotherdetail'),
        },
      ),
  'joinpage': (data) async => ParameterData(
        allParams: {
          'postchosed': getParameter<DocumentReference>(data, 'postchosed'),
        },
      ),
  'detailyouraskpage': (data) async => ParameterData(
        allParams: {
          'editownask': getParameter<DocumentReference>(data, 'editownask'),
        },
      ),
  'editchattextpage': (data) async => ParameterData(
        allParams: {
          'chatref': getParameter<DocumentReference>(data, 'chatref'),
        },
      ),
  'editchatphotopage': (data) async => ParameterData(
        allParams: {
          'chatref': getParameter<DocumentReference>(data, 'chatref'),
        },
      ),
  'link_userprofile': (data) async => ParameterData(
        allParams: {
          'profileUserRef':
              getParameter<DocumentReference>(data, 'profileUserRef'),
        },
      ),
  'link_post': (data) async => ParameterData(
        allParams: {
          'postref': getParameter<DocumentReference>(data, 'postref'),
        },
      ),
  'testpage': ParameterData.none(),
  'uCollectionPostpage': ParameterData.none(),
  'mainpost': (data) async => ParameterData(
        allParams: {
          'catestring': getParameter<String>(data, 'catestring'),
        },
      ),
  'classdetailpage': (data) async => ParameterData(
        allParams: {
          'course': getParameter<DocumentReference>(data, 'course'),
        },
      ),
  'chat_2_Details_course': (data) async => ParameterData(
        allParams: {
          'chatRef': await getDocumentParameter<ChatsRecord>(
              data, 'chatRef', ChatsRecord.fromSnapshot),
        },
      ),
  'mainpost_all': ParameterData.none(),
  'timeplanner': ParameterData.none(),
  'tutorials': ParameterData.none(),
  'StartPage': ParameterData.none(),
  'image_Details_post': (data) async => ParameterData(
        allParams: {
          'post': await getDocumentParameter<PostRecord>(
              data, 'post', PostRecord.fromSnapshot),
          'clickphotodetail': getParameter<String>(data, 'clickphotodetail'),
        },
      ),
  'todoList': ParameterData.none(),
  'privacy_page': ParameterData.none(),
  'DetailPage': (data) async => ParameterData(
        allParams: {
          'taskDoc': await getDocumentParameter<TasksRecord>(
              data, 'taskDoc', TasksRecord.fromSnapshot),
        },
      ),
  'uHidePostAndUserpage': ParameterData.none(),
  'repoetoffensive': (data) async => ParameterData(
        allParams: {
          'postReport': getParameter<DocumentReference>(data, 'postReport'),
        },
      ),
  'blankpage': ParameterData.none(),
  'commentDetailpage': (data) async => ParameterData(
        allParams: {
          'courseref': getParameter<DocumentReference>(data, 'courseref'),
          'chillavg': getParameter<double>(data, 'chillavg'),
          'hardavg': getParameter<double>(data, 'hardavg'),
          'userComment': await getDocumentParameter<CommentRecord>(
              data, 'userComment', CommentRecord.fromSnapshot),
          'numComment': getParameter<int>(data, 'numComment'),
        },
      ),
  'instant_share': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
