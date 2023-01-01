class ValidationMixin{
  String? mailBoxValidation(String? value){
    if(value!.isEmpty){
      return "Email boş bırakılamaz";
    }
    else if(value.contains(".edu.tr")){
      return "Geçersiz bir mail adresi girdiniz";
    }
    else{
      return "";
    }
  }

    String? passwordBoxValidation(String? value){
    if(value!.isEmpty){
      return "Şifre boş bırakılamaz";
    }
    else{
      return null;
    }
  }
}