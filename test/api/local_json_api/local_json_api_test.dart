import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:qr_attendance/api/api.dart';

class MockLocalJsonApi extends Mock implements LocalJsonApi {}

class TException extends Mock implements NotFoundException {}

void main() {
  late MockLocalJsonApi mockLocalJsonApi;
  late UserLoginInf userLoginInf;
  late GeneralUserInf generalUserInf;
  late NotFoundException exception;
  late StudentsLessonsInf studentsLessonsInf;

  setUp(() {
    mockLocalJsonApi = MockLocalJsonApi();
    exception = TException();
    userLoginInf = const UserLoginInf(
        stdNo: "200404006",
        stdMail: "200404006@st.biruni.edu.tr",
        stdPass: "gpyQ3C3K");
    generalUserInf = const GeneralUserInf(
        name: "Özgür",
        surname: "Gökmen",
        stdNo: "200404006",
        faculty: "Mühendislik ve Doğa Bilimleri Fakültesi",
        department: "Bilgisayar Mühendisliği",
        stdClass: "2");
    studentsLessonsInf = const StudentsLessonsInf(
        stdNo: "200404006",
        lessonsLearned: <String>[
          "BLG308 ,BLG309"
        ],
        pastLessons: <String>[
          "BLG309, BLG308, BLG308, BLG309, BŞG308"
        ],
        date: <String>[
          "10.11.2022",
          "11.11.2022",
          "13.11.2022",
          "15.11.2022",
          "16.11.2022"
        ]);
  });

  group('controlUserLoginInf', () {
    test("Login should be succeed", () async {
      when(() => mockLocalJsonApi.controlUserLoginInf(any(), any()))
          .thenAnswer((_) async => userLoginInf);

      UserLoginInf testUser = await mockLocalJsonApi.controlUserLoginInf(
          userLoginInf.stdMail, userLoginInf.stdPass);

      expect(testUser.stdMail, userLoginInf.stdMail);
      expect(testUser.stdPass, userLoginInf.stdPass);

      verify(() => mockLocalJsonApi.controlUserLoginInf(any(), any()))
          .called(1);
    });

    test("Login should be failed", () async {
      when(() => mockLocalJsonApi.controlUserLoginInf(any(), any()))
          .thenAnswer((_) async => const UserLoginInf.empty());

      UserLoginInf testStudent = await mockLocalJsonApi.controlUserLoginInf(
          userLoginInf.stdMail, userLoginInf.stdPass);

      expect(testStudent.stdMail, const UserLoginInf.empty().stdMail);
      expect(testStudent.stdPass, const UserLoginInf.empty().stdPass);
      expect(testStudent.stdNo, const UserLoginInf.empty().stdNo);

      verify(() => mockLocalJsonApi.controlUserLoginInf(any(), any()))
          .called(1);
    });

    test("Throw an exception when tried to login", (() async {
      when(() => mockLocalJsonApi.controlUserLoginInf(any(), any()))
          .thenThrow(exception);

      expect(
          () async => await mockLocalJsonApi.controlUserLoginInf(
              userLoginInf.stdMail, userLoginInf.stdPass),
          throwsA(isA<TException>()));
    }));

    group("getUserInf", () {
      test("First data should be get from general info", () async {
        when(() => mockLocalJsonApi.getUserInf(any()))
            .thenAnswer((_) async => generalUserInf);

        GeneralUserInf testStudent =
            await mockLocalJsonApi.getUserInf(generalUserInf.stdNo);

        expect(testStudent.name, generalUserInf.name);
        expect(testStudent.surname, generalUserInf.surname);
        expect(testStudent.faculty, generalUserInf.faculty);
        expect(testStudent.department, generalUserInf.department);
        expect(testStudent.stdClass, generalUserInf.stdClass);
        expect(testStudent.stdNo, generalUserInf.stdNo);

        verify(() => mockLocalJsonApi.getUserInf(any())).called(1);
      });

      test("General info shouldnt be get", () async {
        when(() => mockLocalJsonApi.getUserInf(any()))
            .thenAnswer((_) async => const GeneralUserInf.empty());

        GeneralUserInf testModel =
            await mockLocalJsonApi.getUserInf("200404004");

        expect(testModel.name, const GeneralUserInf.empty().name);
        expect(testModel.surname, const GeneralUserInf.empty().surname);
        expect(testModel.faculty, const GeneralUserInf.empty().faculty);
        expect(testModel.department, const GeneralUserInf.empty().department);
        expect(testModel.stdClass, const GeneralUserInf.empty().stdClass);
        expect(testModel.stdNo, const GeneralUserInf.empty().stdNo);

        verify(() => mockLocalJsonApi.getUserInf(any())).called(1);
      });

      test("Throw an exception when tried to get data", () async {
        when(() => mockLocalJsonApi.getUserInf(any())).thenThrow(exception);

        expect(
            () async => await mockLocalJsonApi.getUserInf(generalUserInf.stdNo),
            throwsA(isA<TException>()));
      });
    });

    group("getPastLessons", () {
      test("Student lessons info should be get", () async {
        when(() => mockLocalJsonApi.getPastLessons(any()))
            .thenAnswer((_) async => studentsLessonsInf);

        StudentsLessonsInf testModel =
            await mockLocalJsonApi.getPastLessons(userLoginInf.stdNo);

        expect(testModel.stdNo, studentsLessonsInf.stdNo);
        expect(testModel.date, studentsLessonsInf.date);
        expect(testModel.lessonsLearned, studentsLessonsInf.lessonsLearned);
        expect(testModel.pastLessons, studentsLessonsInf.pastLessons);
      });

      test("Student lessons info shouldnt be get", () async {
        when(() => mockLocalJsonApi.getPastLessons(any()))
            .thenAnswer((_) async => const StudentsLessonsInf.empty());

        StudentsLessonsInf testModel =
            await mockLocalJsonApi.getPastLessons(userLoginInf.stdNo);

        expect(testModel.stdNo, const StudentsLessonsInf.empty().stdNo);
        expect(testModel.date, const StudentsLessonsInf.empty().date);
        expect(testModel.lessonsLearned,
            const StudentsLessonsInf.empty().lessonsLearned);
        expect(testModel.pastLessons,
            const StudentsLessonsInf.empty().pastLessons);
      });

      test("Throw an exception when tried to get data", () {
        when(() => mockLocalJsonApi.getPastLessons(any())).thenThrow(exception);

        expect(() async => mockLocalJsonApi.getPastLessons("200404006"),
            throwsA(isA<TException>()));
      });
    });

    group("deleteAllPastLessons", () {
      test("Past lessons and dates should be delete", () async {
        when(() => mockLocalJsonApi.getPastLessons(any())).thenAnswer(
            (_) async => studentsLessonsInf
                .copyWith(pastLessons: <String>[], date: <String>[]));

        when(() => mockLocalJsonApi.deleteAllPastLessons(any())).thenAnswer(
            (_) async => studentsLessonsInf
                .copyWith(pastLessons: <String>[], date: <String>[]));

        await mockLocalJsonApi.deleteAllPastLessons(userLoginInf.stdNo);

        StudentsLessonsInf testModel =
            await mockLocalJsonApi.getPastLessons("200404006");

        expect(testModel.stdNo, studentsLessonsInf.stdNo);
        expect(testModel.lessonsLearned, studentsLessonsInf.lessonsLearned);
        expect(testModel.pastLessons, <String>[]);
        expect(testModel.date, <String>[]);
      });

      test("deleteAllPastLessons throws an error", () async {
        when(() => mockLocalJsonApi.deleteAllPastLessons(any()))
            .thenThrow(exception);

        expect(
            () async =>
                await mockLocalJsonApi.deleteAllPastLessons(userLoginInf.stdNo),
            throwsA(isA<TException>()));
      });
    });
  });
}
