import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const StartPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const StartPageWidget(),
        ),
        FFRoute(
          name: 'main',
          path: '/main',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'main') : const MainWidget(),
        ),
        FFRoute(
          name: 'auth_2_Create',
          path: '/auth2Create',
          builder: (context, params) => const Auth2CreateWidget(),
        ),
        FFRoute(
          name: 'auth_2_Login',
          path: '/auth2Login',
          builder: (context, params) => const Auth2LoginWidget(),
        ),
        FFRoute(
          name: 'auth_2_ForgotPassword',
          path: '/auth2ForgotPassword',
          builder: (context, params) => const Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'auth_2_createProfile',
          path: '/auth2CreateProfile',
          builder: (context, params) => const Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_Profile',
          path: '/auth2Profile',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'auth_2_Profile')
              : const Auth2ProfileWidget(),
        ),
        FFRoute(
          name: 'auth_2_EditProfile',
          path: '/auth2EditProfile',
          builder: (context, params) => const Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: 'chat_2_Details',
          path: '/chat2Details',
          requireAuth: true,
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_main',
          path: '/chat2Main',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'chat_2_main')
              : const Chat2MainWidget(),
        ),
        FFRoute(
          name: 'chat_2_InviteUsers',
          path: '/chat2InviteUsers',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2InviteUsersWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'image_Details',
          path: '/imageDetails',
          asyncParams: {
            'chatMessage':
                getDoc(['chat_messages'], ChatMessagesRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsWidget(
            chatMessage: params.getParam(
              'chatMessage',
              ParamType.Document,
            ),
            clickphotodetail: params.getParam(
              'clickphotodetail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'postpage',
          path: '/postpage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'postpage')
              : const PostpageWidget(),
        ),
        FFRoute(
          name: 'own_post',
          path: '/ownPost',
          builder: (context, params) => const OwnPostWidget(),
        ),
        FFRoute(
          name: 'edit_postpage',
          path: '/editPostpage',
          asyncParams: {
            'ownpost': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => EditPostpageWidget(
            ownpost: params.getParam(
              'ownpost',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'invitepage',
          path: '/invitepage',
          builder: (context, params) => const InvitepageWidget(),
        ),
        FFRoute(
          name: 'youraskviewpage',
          path: '/youraskviewpage',
          builder: (context, params) => const YouraskviewpageWidget(),
        ),
        FFRoute(
          name: 'detailinvitepage',
          path: '/detailinvitepage',
          builder: (context, params) => DetailinvitepageWidget(
            invitebyotherdetail: params.getParam(
              'invitebyotherdetail',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['invite_ask_list'],
            ),
          ),
        ),
        FFRoute(
          name: 'joinpage',
          path: '/joinpage',
          builder: (context, params) => JoinpageWidget(
            postchosed: params.getParam(
              'postchosed',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
          ),
        ),
        FFRoute(
          name: 'detailyouraskpage',
          path: '/detailyouraskpage',
          builder: (context, params) => DetailyouraskpageWidget(
            editownask: params.getParam(
              'editownask',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['invite_ask_list'],
            ),
          ),
        ),
        FFRoute(
          name: 'editchattextpage',
          path: '/editchattextpage',
          builder: (context, params) => EditchattextpageWidget(
            chatref: params.getParam(
              'chatref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: 'editchatphotopage',
          path: '/editchatphotopage',
          builder: (context, params) => EditchatphotopageWidget(
            chatref: params.getParam(
              'chatref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['chats'],
            ),
          ),
        ),
        FFRoute(
          name: 'link_userprofile',
          path: '/linkUserprofile',
          builder: (context, params) => LinkUserprofileWidget(
            profileUserRef: params.getParam(
              'profileUserRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: 'link_post',
          path: '/linkPost',
          requireAuth: true,
          builder: (context, params) => LinkPostWidget(
            postref: params.getParam(
              'postref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
          ),
        ),
        FFRoute(
          name: 'testpage',
          path: '/testpage',
          builder: (context, params) => const TestpageWidget(),
        ),
        FFRoute(
          name: 'uCollectionPostpage',
          path: '/uCollectionPostpage',
          builder: (context, params) => const UCollectionPostpageWidget(),
        ),
        FFRoute(
          name: 'mainpost',
          path: '/mainpost',
          builder: (context, params) => MainpostWidget(
            catestring: params.getParam(
              'catestring',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'classdetailpage',
          path: '/classdetailpage',
          builder: (context, params) => ClassdetailpageWidget(
            course: params.getParam(
              'course',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['nthu_courses'],
            ),
          ),
        ),
        FFRoute(
          name: 'chat_2_Details_course',
          path: '/chat2DetailsCourse',
          asyncParams: {
            'chatRef': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => Chat2DetailsCourseWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'mainpost_all',
          path: '/mainpostall',
          builder: (context, params) => const MainpostAllWidget(),
        ),
        FFRoute(
          name: 'timeplanner',
          path: '/timeplanner',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'timeplanner')
              : const TimeplannerWidget(),
        ),
        FFRoute(
          name: 'tutorials',
          path: '/tutorials',
          builder: (context, params) => const TutorialsWidget(),
        ),
        FFRoute(
          name: 'StartPage',
          path: '/startPage',
          builder: (context, params) => const StartPageWidget(),
        ),
        FFRoute(
          name: 'image_Details_post',
          path: '/imageDetailsPost',
          asyncParams: {
            'post': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => ImageDetailsPostWidget(
            post: params.getParam(
              'post',
              ParamType.Document,
            ),
            clickphotodetail: params.getParam(
              'clickphotodetail',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'todoList',
          path: '/todoList',
          builder: (context, params) => const TodoListWidget(),
        ),
        FFRoute(
          name: 'privacy_page',
          path: '/privacyPage',
          builder: (context, params) => const PrivacyPageWidget(),
        ),
        FFRoute(
          name: 'DetailPage',
          path: '/detailPage',
          asyncParams: {
            'taskDoc': getDoc(['tasks'], TasksRecord.fromSnapshot),
          },
          builder: (context, params) => DetailPageWidget(
            taskDoc: params.getParam(
              'taskDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'uHidePostAndUserpage',
          path: '/uHidePostAndUserpage',
          builder: (context, params) => const UHidePostAndUserpageWidget(),
        ),
        FFRoute(
          name: 'repoetoffensive',
          path: '/repoetoffensive',
          builder: (context, params) => RepoetoffensiveWidget(
            postReport: params.getParam(
              'postReport',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['post'],
            ),
          ),
        ),
        FFRoute(
          name: 'blankpage',
          path: '/blankpage',
          builder: (context, params) => const BlankpageWidget(),
        ),
        FFRoute(
          name: 'commentDetailpage',
          path: '/commentDetailpage',
          asyncParams: {
            'userComment': getDoc(['comment'], CommentRecord.fromSnapshot),
          },
          builder: (context, params) => CommentDetailpageWidget(
            courseref: params.getParam(
              'courseref',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['nthu_courses'],
            ),
            chillavg: params.getParam(
              'chillavg',
              ParamType.double,
            ),
            hardavg: params.getParam(
              'hardavg',
              ParamType.double,
            ),
            userComment: params.getParam(
              'userComment',
              ParamType.Document,
            ),
            numComment: params.getParam(
              'numComment',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'instant_share',
          path: '/instantShare',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'instant_share')
              : const InstantShareWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/startPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
