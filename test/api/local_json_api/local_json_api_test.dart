import 'package:flutter_test/flutter_test.dart';
import 'package:qr_attendance/api/api.dart';

void main() {
  group('controlUserLoginInf', () {
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
  });

  group("getUserInf", () {
    test("First data should be get from general info", () async {
      LocalJsonApi testApi = LocalJsonApi();

      GeneralUserInf testModel = await testApi.getUserInf("200404006");

      expect(testModel.name, "özgür");
      expect(testModel.surname, "gökmen");
      expect(testModel.faculty, "Mühendislik ve Doğa Bilimleri Fakültesi");
      expect(testModel.department, "Bilgisayar Mühendisliği");
      expect(testModel.stdClass, "3");
      expect(testModel.stdNo, "200404006");
    });

    test("second data should be get from General info", () async {
      LocalJsonApi testApi = LocalJsonApi();

      GeneralUserInf testModel = await testApi.getUserInf("200404006");

      expect(testModel.name, "özgür");
      expect(testModel.surname, "gökmen");
      expect(testModel.faculty, "Mühendislik ve Doğa Bilimleri Fakültesi");
      expect(testModel.department, "Bilgisayar Mühendisliği");
      expect(testModel.stdClass, "3");
      expect(testModel.stdNo, "200404006");
    });

    test("General info shouldnt be get", () async {
      LocalJsonApi testApi = LocalJsonApi();

      GeneralUserInf testModel = await testApi.getUserInf("200404004");

      expect(testModel.name, "");
      expect(testModel.surname, "");
      expect(testModel.faculty, "");
      expect(testModel.department, "");
      expect(testModel.stdClass, "");
      expect(testModel.stdNo, "");
    });

    test("Throw an exception when tried to get data", () async {
      LocalJsonApi testApi = LocalJsonApi();
      expect(() async => await testApi.getUserInf("200404006"),
          throwsA(isA<NotFoundException>()));
    });
  });

  group("getPastLessons", () {
    test("Student lessons info should be get", () async {
      LocalJsonApi testApi = LocalJsonApi();

      StudentsLessonsInf testModel = await testApi.getPastLessons("200404006");

      expect(testModel.stdNo, "200404006");
      expect(testModel.date, [
        "14.10.2022",
        "15.10.2022",
        "21.10.2002",
        "28.10.2022",
        "29.10.2022"
      ]);
      expect(
          testModel.lessonsLearned, ["BLG3O7", "BLG308", "BLG309", "BLG310"]);
      expect(
        testModel.pastLessons,
        ["BLG307", "BLG308", "BLG308", "BLG308", "BLG309"],
      );
    });

    test("Student lessons info shouldnt be get", () async{
      LocalJsonApi testApi = LocalJsonApi();

      StudentsLessonsInf testModel = await testApi.getPastLessons("200404005");

      expect(testModel.stdNo, "");
      expect(testModel.date, []);
      expect(testModel.lessonsLearned, []);
      expect(testModel.pastLessons, []);
    });

    test("Throw an exception when tried to get data", (){
      LocalJsonApi testApi = LocalJsonApi();

      expect(() async => testApi.getPastLessons("200404006"), throwsA(isA<NotFoundException>()));
    });
  });
}
