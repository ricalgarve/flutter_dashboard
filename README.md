
# Projeto Flutter - SplashScreen Proj

**Nome:** Richard J. Algarve  
**LinkedIn:** [https://www.linkedin.com/in/richard-j-algarve-896b5748/](https://www.linkedin.com/in/richard-j-algarve-896b5748/)

---

## 📚 Sobre o Projeto

Este projeto Flutter tem como objetivo criar um app com **tela de login**, **tela de cadastro** e **home** para o usuário.  
O cadastro de usuários é realizado **localmente**, utilizando **SQLite**. O app também conta com uma **splash screen personalizada**.

---

## 📂 Estrutura de Pastas

```
lib/
├── models/
│   └── user.dart
├── screens/
│   ├── garbage/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   └── register_screen.dart
├── services/
│   └── database_helper.dart
├── widgets/
├── main.dart
```

---

## 🚀 Funcionalidades

- Tela de **Splash Screen** moderna ao iniciar o app.
- Tela de **Cadastro de Usuário**:
  - Nome, e-mail e senha são registrados.
  - Dados armazenados localmente no banco SQLite.
- Tela de **Login**:
  - Validação de e-mail e senha.
- Tela **Home**:
  - Exibe o nome do usuário logado no topo.

---

## 🛠️ Principais Dependências (pubspec.yaml)

- **Flutter SDK**: ^3.7.2
- **Sqflite**: ^2.3.0
- **Path**: ^1.8.3
- **flutter_native_splash**: ^2.4.6
- **flutter_launcher_icons**: ^0.14.3
- **cupertino_icons**: ^1.0.8

---

## 🎨 Recursos Visuais

- Imagens adicionadas:
  - `assets/images/logo.png`
  - `assets/images/logo_1152_1152.png`
  - `assets/images/icon_512_512.png`

---

## 📦 Observações

- Projeto configurado para **não publicar** no pub.dev (`publish_to: 'none'`).
- Customizações de splash e ícone são automatizadas via comandos:
  - `dart run flutter_native_splash:create`
  - `dart run flutter_launcher_icons`
- Banco SQLite gerenciado pela classe `DatabaseHelper` no diretório `services/`.

---
