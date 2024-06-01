import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isNullString(String? inputstate) {
  if (inputstate == null) {
    return true;
  } else
    return false;
}

String? statecheck(String? inputvalue) {
  return inputvalue.toString();
}

bool isNullimagepath(String? inputvalue) {
  if (inputvalue == null) {
    return true;
  } else
    return false;
}

String chceckurl(String inputimageurl) {
  return inputimageurl;
}

NthuCoursesRecord? finditemInDocs(
  List<NthuCoursesRecord>? docslist,
  String timeString,
) {
  // Checks if the document list is null and returns null early if true.
  // This avoids throwing an exception and adheres to Flutter/Dart best practices.
  if (docslist == null) return null;

  // Iterates over each document in the list.
  for (NthuCoursesRecord doc in docslist) {
    // Checks if the current document's time list contains the timeString.
    if (doc.time.contains(timeString)) {
      // Returns the document immediately if a match is found.
      return doc;
    }
  }

  // Returns null if no matching document is found.
  // This is a subtle way to handle "not found" cases, allowing the caller to check for null.
  return null;
}

bool? verifyemail(String? inputEmail) {
  // Check if the email is null or empty
  if (inputEmail == null || inputEmail.isEmpty) {
    return false;
  }

  // Check if the email contains the desired substring
  return inputEmail.contains("nthu.edu.tw");
}

double calenderWidthchange(double inputglobalwidth) {
  return ((inputglobalwidth - 75 - 20) / 6) / 44;
}

int minus1(int input) {
  return (input - 1);
}

String findCoursecustomColor(
  DocumentReference? inputCourse,
  List<CustomColorStruct> inputCustomcolorList,
) {
  for (var customColor in inputCustomcolorList) {
    if (customColor.choseCourse == inputCourse) {
      return customColor.color;
    }
  }
  return 'default'; // Return a default color if no match is found
}

List<double> scoreJudgeFunctionChillandHard(List<CommentRecord>? commentList) {
  List<double> score = [0.0, 0.0];

  if (commentList == null) return score;

  double totalscorechill = 0;
  double totalscorehard = 0;
  int len = 0;

  for (var coursescore in commentList) {
    if (coursescore.chillScore != Null &&
        !coursescore.chillScore.isNaN &&
        coursescore.chillScore > 0 &&
        coursescore.hardScore != Null &&
        !coursescore.hardScore.isNaN &&
        coursescore.hardScore > 0) {
      totalscorechill += coursescore.chillScore;
      totalscorehard += coursescore.hardScore;
      len += 1;
    }
  }
  if (len == 0) {
    score = [0.0, 0.0];
  } else {
    score[0] = totalscorechill / len;
    score[1] = totalscorehard / len;
  }

  return score;
}

int? scoreLength(List<CommentRecord>? inputcomment) {
  int len = 0;

  if (inputcomment == null) return len;

  for (var coursescore in inputcomment) {
    if (coursescore.chillScore != Null &&
        coursescore.hardScore != Null &&
        coursescore.chillScore > 0 &&
        coursescore.hardScore > 0) {
      len += 1;
    }
  }

  return len;
}

double? userScoreRecordchill(
  DocumentReference inputcourse,
  List<CourseScoreStruct>? userrecord,
) {
  if (userrecord == null) return null;

  double? chillscore;
  for (var coursescore in userrecord) {
    if (coursescore.course == inputcourse) {
      chillscore = coursescore.chillScore;
    }
  }

  return chillscore;
}

double? userScoreRecordHard(
  DocumentReference inputcourse,
  List<CourseScoreStruct>? userrecord,
) {
  if (userrecord == null) return null;

  double? hardscore;
  for (var coursescore in userrecord) {
    if (coursescore.course == inputcourse) {
      hardscore = coursescore.hardLevel;
    }
  }

  return hardscore;
}

double calenderWidthchangeNYCU(double inputwidth) {
  return ((inputwidth - 65 - 14) / 7) / 44;
}

List<int> schoolIndexupperBound(String? school) {
  var upperbound = [1, 2];
  // Convert the school name to lowercase to ensure consistency and use it in a switch statement.
  switch (school) {
    case '國立清華大學':
      upperbound[0] = 0;
      upperbound[1] = 2699;
      break;
    case '國立陽明交通大學':
      upperbound[0] = 2700;
      upperbound[1] = 5899;
      break;
    default:
      upperbound[0] = 0;
      upperbound[1] = 2699;
  }

  return upperbound;
}
