import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wvsu_iuis_v2/features/homepage.dart';
import 'package:wvsu_iuis_v2/features/login_page.dart';

GoRouter router() {
  GoRoute route(String path, Widget page) {
    return GoRoute(path: path, builder: (context, state) => page);
  }

  return GoRouter(routes: [
    route('/login', const SignIn()),
    route('/dashboard', const Homepage()),
    route('/account', const Homepage()),
    route('/academics', const Homepage()),
    route('/enrollment', const Homepage()),
    route('/inbox', const Homepage()),
  ], initialLocation: localStorage.getItem('student-id') == null ? '/login' : '/dashboard');
}