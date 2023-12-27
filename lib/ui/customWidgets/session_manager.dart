import 'package:flutter/material.dart';

class SessionController{


  static final SessionController _session= SessionController._internal();

  String?  UsserId;
  factory SessionController()
  {
    return _session ;
  }
  SessionController._internal()
  {

  }
}