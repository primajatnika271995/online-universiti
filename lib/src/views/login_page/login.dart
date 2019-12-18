import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_bloc.dart';
import 'package:online_university/src/bloc/login_bloc/login_event.dart';
import 'package:online_university/src/bloc/login_bloc/login_state.dart';
import 'package:online_university/src/utils/app_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  _onNavigation() {
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            _onNavigation();
          }
          if (state is LoginFailed) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Username or Password Incorect!"),
                backgroundColor: AppTheme.blue_stone,
              ),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              appBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          emailField(),
                          passwordField(),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginInitial) {
                                return signInBtn();
                              }
                              if (state is LoginLoading) {
                                return loadingReplace();
                              }
                              if (state is LoginFailed) {
                                return signInBtn();
                              }
                              return Text("s");
                            },
                          ),
                          forgotBtn(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "Need help? Contact our Support team!",
                              style: AppTheme.subtitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Email Address",
          hintStyle: TextStyle(color: AppTheme.nearlyWhite),
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
        ),
        controller: usernameCtrl,
        style: TextStyle(color: AppTheme.nearlyWhite),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: TextStyle(color: AppTheme.nearlyWhite),
          contentPadding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppTheme.nearlyWhite),
          ),
        ),
        controller: passwordCtrl,
        style: TextStyle(color: AppTheme.nearlyWhite),
      ),
    );
  }

  Widget signInBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () {
            // ignore: close_sinks
            final loginBloc = BlocProvider.of<LoginBloc>(context);
            loginBloc.add(FetchLogin(usernameCtrl.text, passwordCtrl.text));
          },
          color: AppTheme.blue_stone,
          child: Text(
            "Sign In",
            style: TextStyle(color: AppTheme.nearlyWhite),
          ),
        ),
      ),
    );
  }

  Widget forgotBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: OutlineButton(
        onPressed: () {},
        child: Text(
          "Forgot Password",
          style: TextStyle(fontSize: 11, color: AppTheme.nearlyWhite),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        highlightColor: Colors.white,
        splashColor: Colors.grey,
      ),
    );
  }

  Widget loadingReplace() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(AppTheme.blue_stone),
            strokeWidth: 4,
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 8.0,
          ),
        ],
      ),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.black,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "Log In",
                style: new TextStyle(
                  fontSize: 22,
                  color: AppTheme.nearlyWhite,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Auth {
  String token;

  Auth({this.token});
}
