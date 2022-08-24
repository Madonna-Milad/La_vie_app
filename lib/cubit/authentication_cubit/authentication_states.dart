abstract class AuthenticationStates {}

class InitialState extends AuthenticationStates{}

class LoginSuccessfullyState extends AuthenticationStates{}

class WrongEmailOrPasswordState extends AuthenticationStates{}

class WrongSignupEmailState extends AuthenticationStates{}

class WeakSignupPasswordState extends AuthenticationStates{}

class ErrorMessageState extends AuthenticationStates{}

class ShortNameState extends AuthenticationStates{}
class InvalidEmailState extends AuthenticationStates{}

class WeakPasswordState extends AuthenticationStates{}
class StrongPasswordState extends AuthenticationStates{}

class SignupSuccessfullyState extends AuthenticationStates{}

class ConfirmedPassword extends AuthenticationStates{}
class ValidEmail extends AuthenticationStates{}

