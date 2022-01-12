extension ValidatorExtensions on String {

  String? validatePassword() {
    if(isEmpty) {
      return 'Veuillez remplir ce champ';
    }

    return null;
  }

  String? validateEmail() {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);

    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un email valide';
    } 

    return null;
  }

  String? validatePhone() {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern);

    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un numéro valide';
    } 

    return null;
  }

  String? validateName() {
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);

    if(!regex.hasMatch(this)) {
      return 'Veuillez entrer un prénom valide';
    }

    return null;
  }

  String? validateLastName() {
    String pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);
    if (isEmpty || !regex.hasMatch(this)) {
      return 'Veuillez entrer un nom valide';
    } 
      
    return null;
  }
}
