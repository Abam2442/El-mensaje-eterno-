extension Validation on String {
  bool get isValidEmail {
    return true;
    // return RegExp(
    //         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    //     .hasMatch(this);
  }

  bool get isValidPhone {
    return RegExp(
            r"^(\+\d{1,3}\s?)?((\(\d{3}\)\s?)|(\d{3})(\s|-?))(\d{3}(\s|-?))(\d{4})(\s?(([E|e]xt[:|.|]?)|x|X)(\s?\d+))?$")
        .hasMatch(this);
  }

  bool get isValidName {
    return length > 2;
  }

  bool get isEmployer => this == 'employer';
  bool get isCandidate => this == 'candidate';

  bool get isValidPassword {
    return length >= 6;
    // return RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])').hasMatch(this) && length >= 6;
    // return RegExp(
    //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
    //     .hasMatch(this);
  }
  bool get isDouble {
    return RegExp(r"^[+]?\d+([.]\d+)?$").hasMatch(this);
  }
}
