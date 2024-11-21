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
    route('/', const Homepage()),
  ], initialLocation: localStorage.getItem('is-logged-in') == null ? '/login' : '/');
}
