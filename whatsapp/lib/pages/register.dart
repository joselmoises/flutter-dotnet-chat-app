import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _mensagemErro = "";

  _validateFields() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    String? error;

    // Regex simples e eficiente para e-mail válido
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      error = "Please fill in all the fields.";
    } else if (!emailRegex.hasMatch(email)) {
      error = "Please enter a valid email address.";
    } else if (password != confirmPassword) {
      error = "Passwords do not match.";
    }

    if (error != null) {
      setState(() {
        _mensagemErro = error!;
      });
    } else {
      // Nenhum erro: limpa a mensagem (opcional)
      setState(() {
        _mensagemErro = "";
      });
      _submitForm();

      // Aqui você pode chamar a função de login/cadastro, etc.
    }
  }

  _submitForm() {
    // Implementar a lógica de envio do formulário
    // Por exemplo, enviar os dados para um servidor ou salvar localmente
    print(
      "Form submitted with: "
      "Name: ${_nameController.text}, "
      "Email: ${_emailController.text}, "
      "Password: ${_passwordController.text}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF075E54),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/usuario.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,

                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Name",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Email Address",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Confirm Password",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      _validateFields();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    _mensagemErro,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
