import 'package:flutter_test/flutter_test.dart';
import 'package:qr_attendance/api/api.dart';

void main() {
  test("Login should be succeed", () async {
    LocalJsonApi testApi = LocalJsonApi();

    UserLoginInf testStudent = await testApi.controlUserLoginInf(
        "200404006@st.biruni.edu.tr", "gpyQ3C3K");

    expect(testStudent.stdMail, "200404006@st.biruni.edu.tr");
    expect(testStudent.stdPass, "gpyQ3C3K");
  });

  test("Login should be failed", () async {
    LocalJsonApi testApi = LocalJsonApi();

    UserLoginInf testStudent = await testApi.controlUserLoginInf(
        "200404005@st.biruni.edu.tr", "gpyQ3C3K");

    expect(testStudent.stdMail, "");
    expect(testStudent.stdPass, "");
    expect(testStudent.stdNo, "");
  });

  test("Throw an exception when tried to login", (() {
    LocalJsonApi testApi = LocalJsonApi();

    expect(
        () async => await testApi.controlUserLoginInf(
            "200404005@st.biruni.edu.tr", "gpyQ3C3K"),
        throwsA(isA<NotFoundException>()));
  }));
}
