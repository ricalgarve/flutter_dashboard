class User {
  final int? id;
  final String nome;
  final String email;
  final String password;

  User({this.id, required this.nome, required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      password: map['password'],
    );
  }
}
