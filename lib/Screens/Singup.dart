import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskapp/Screens/Login.dart';
import 'package:taskapp/utils/AppColors.dart';
import 'package:taskapp/utils/text_style.dart';


class SignUpScreen extends StatefulWidget {
  @override
  _singupPageState createState() => _singupPageState();
}

class _singupPageState extends State<SignUpScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobilenumbercontroller=TextEditingController();
  bool _validate = false;
  bool _validate1 = false;
  bool _isObscure = true;
  bool  isRememberMe =false;

  Future<void> _performSignup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString("mobilenumber", _mobilenumbercontroller.text);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final oldCheckboxTheme = theme.checkboxTheme;
    final newCheckBoxTheme = oldCheckboxTheme.copyWith(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(width: 1.0, color: AppColors.secondary),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: ((MediaQuery.of(context).size.height) / 2) - 20,
                    color: AppColors.primary,
                  ),
                  Container(
                    height: ((MediaQuery.of(context).size.height) / 2) - 255,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            ScrollConfiguration(
              behavior:
              const MaterialScrollBehavior().copyWith(overscroll: false),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(alignment: Alignment.topCenter, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: 320,
                    height: 320,
                    decoration:  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.06)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: 230,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: 170),
                          padding:  EdgeInsets.only(top: 100, bottom:MediaQuery.of(context).viewInsets.bottom>0?180:120),
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.white),
                          child: Container(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Register Your Account",
                                  style: CustomStyle.login,
                                ),
                                Container(
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 20, 0, 30),
                                  child:  Text(
                                    "",
                                    style: CustomStyle.everything,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10),child:
                                Text(
                                  "user",
                                  style: CustomStyle.txtvalue,
                                ),),
                                Container(
                                  height: 60,
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                      color: AppColors.secondary.withOpacity(0.06)),
                                  child: Center(
                                    child: TextField(
                                      controller: _usernameController,
                                      autofocus: false,
                                      decoration:  InputDecoration(
                                          hintText:  "user",
                                          hintStyle: CustomStyle.txthintvalue,
                                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                                          contentPadding:
                                          EdgeInsets.all(
                                              20),
                                          border: InputBorder.none),
                                      style: CustomStyle.txtvalue,


                                      textInputAction:
                                      TextInputAction.done,
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(left: 10),child:  Text(
                                  "password",
                                  style: CustomStyle.txtvalue,
                                ),),
                                Container(
                                  height: 60,
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  margin:
                                  const EdgeInsets.fromLTRB(0, 10, 0, 15),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(12)),
                                      color: AppColors.secondary.withOpacity(0.06)),
                                  child: Center(
                                    child: TextField(
                                      controller: _passwordController,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _isObscure
                                                  ? Icons
                                                  .visibility_off
                                                  : Icons
                                                  .visibility,
                                              color: AppColors
                                                  .primary,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure =
                                                !_isObscure;
                                              });
                                            },
                                          ),
                                          hintText: '*******',
                                          hintStyle: CustomStyle.txthintvalue,
                                          errorText: _validate1 ? 'Value Can\'t Be Empty' : null,
                                          contentPadding:
                                          const EdgeInsets.all(
                                              20),
                                          border: InputBorder.none),
                                      style: CustomStyle.txtvalue,
                                      obscureText: _isObscure,
                                      keyboardType: TextInputType
                                          .visiblePassword,
                                      textInputAction:
                                      TextInputAction.done,
                                    ),
                                  ),
                                ),
                            Text(
                              "Mobile number",
                              style: CustomStyle.txtvalue,
                            ),
                  Container(
                    height: 60,
                    margin:
                    const EdgeInsets.fromLTRB(0, 10, 0, 15),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                        color: AppColors.secondary.withOpacity(0.06)),
                    child: Center(
                      child: TextField(
                        controller: _mobilenumbercontroller,
                        autofocus: false,
                        decoration:  InputDecoration(
                            hintText:  "user",
                            hintStyle: CustomStyle.txthintvalue,
                            errorText: _validate ? 'Value Can\'t Be Empty' : null,
                            contentPadding:
                            EdgeInsets.all(
                                20),
                            border: InputBorder.none),
                        style: CustomStyle.txtvalue,


                        textInputAction:
                        TextInputAction.done,
                      ),
                    ),
                  ),


                              ],
                            ),
                          )),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.only(top: 90),
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: AppColors.primary,
                          width: 3.0,
                          style: BorderStyle.solid),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(160)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 25,
                          offset: const Offset(
                              0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("ABC",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: "Outfit"),),
                    ),
                  )
                ]),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      _performSignup();


                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.primary,
                        shadowColor: AppColors.primary.withOpacity(0.4),
                        elevation: 25,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(12)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:    [
                        Text(
                          "SingUp",
                          style: CustomStyle.txtvalue2.copyWith(
                              color: AppColors.white
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_forward)
                      ],
                    )),
              ),
            ),
          ],

        ),
      ),
    );
  }
}


