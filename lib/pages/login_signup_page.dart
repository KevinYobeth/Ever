import 'package:flutter/material.dart';
import 'package:Ever/services/authentication.dart';
import 'package:Ever/template/colors.dart';
import 'package:Ever/template/style.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          // widget.auth.sendEmailVerification();
          // _showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 350.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: darkBackgroundColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 240.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_isLoginForm ? 'Login' : 'Create Account',
                          style: header),
                      Text(
                          _isLoginForm
                              ? 'Please sign in to continue'
                              : 'Please sign up to continue',
                          style: tagline)
                    ],
                  ),
                ),
              ),
            ],
          ),
          _showForm(),
        ],
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  // void _showVerifyEmailSentDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("Verify your account"),
  //         content:
  //             new Text("Link to verify account has been sent to your email"),
  //         actions: <Widget>[
  //           new FlatButton(
  //             child: new Text("Dismiss"),
  //             onPressed: () {
  //               toggleFormMode();
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget _showForm() {
    return new Container(
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    showEmailInput(),
                    showPasswordInput(),
                    showPrimaryButton(),
                    showErrorMessage(),
                  ],
                ),
                SizedBox(height: 100.0),
                showSecondaryButton()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          _errorMessage,
          style: TextStyle(
              fontSize: 13.0,
              color: Colors.red,
              height: 1.0,
              fontWeight: FontWeight.w300),
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showPrimaryButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(220.0, 0, 30.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)),
          color: orange,
          child: new Text(_isLoginForm ? 'Login' : 'Sign Up',
              style: new TextStyle(fontSize: 14.0, color: Colors.white)),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget showSecondaryButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _isLoginForm
                ? 'Don\'t have an account? '
                : 'Already have an account? ',
            style: bottomText,
          ),
          InkWell(
            child: Text(
              _isLoginForm ? 'Sign Up' : 'Sign In',
              style: bottomSign,
            ),
            onTap: toggleFormMode,
          ),
        ],
      ),
    );
  }
}
