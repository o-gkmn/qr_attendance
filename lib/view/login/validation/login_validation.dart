class LoginValidation {
  final String mailBoxInput;
  final String passwordBoxInput;

  String errorMsg = "";

  LoginValidation({required this.mailBoxInput, required this.passwordBoxInput}){
    mailBoxValidation();
    passwordBoxValidation();
  }

  void mailBoxValidation() {
    if (mailBoxInput.isEmpty) {
      errorMsg = "Email boş bırakılamaz";
    } else if (!mailBoxInput.contains(".edu.tr")) {
      errorMsg = "Geçersiz bir mail adresi girdiniz";
    }
  }

  void passwordBoxValidation() {
    if (passwordBoxInput.isEmpty) {
      errorMsg = "Şifre boş bırakılamaz";
    }
  }
}
