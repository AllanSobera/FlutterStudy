import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/Models/DTO/CharactersRequest.dart';
import 'package:new_study/Models/dataState.dart';
import 'package:new_study/View/CharacterCell.dart';
import 'characterListCubit.dart';
import 'package:new_study/View/home.dart';
import '../Models/AppModule.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(38, 129, 106, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      builder: (context, router) {
        return router!;
      },
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.red, Colors.orange, Colors.yellow]),
          ),
        ),
        title: const Text(
          "Personagens",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => Modular.get<CharacterListCubit>(
            key: CharacterListCubit.valueKey.value),
        child: BlocBuilder<CharacterListCubit, DataState>(
          builder: (context, state) {
            if (state is InicialState) {
              return const Center();
            } else if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SucessedState) {
              final data = state.data.items;
              return Center(
                child: CharactersList(characters: data),
              );
            } else {
              return const Center(
                child: Text("Deu errado"),
              );
            }
          },
        ),
      ),
    );
  }
}

class CharactersList extends StatelessWidget {
  const CharactersList({super.key, required this.characters});

  final List<CharacterDTO> characters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(40, 40, 40, 1.0),
        ),
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: CharacterCell(
                character: characters[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   String email = "";
//   String password = "";
//   bool enableLoginButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Center(
//                     child: Image.asset(
//                   "images/userIcon.png",
//                   width: 150,
//                   height: 150,
//                 )),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 50, 0, 10),
//                   child: TextField(
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Email',
//                     ),
//                     onChanged: (value) {
//                       email = value;
//                       stateOfLoginButton();
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                     ),
//                     onChanged: (value) {
//                       password = value;
//                       stateOfLoginButton();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: ElevatedButton(
//                   onPressed: enableLoginButton ? () => loginPressed() : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromRGBO(38, 129, 106, 1),
//                     disabledBackgroundColor:
//                         const Color.fromARGB(255, 78, 80, 80),
//                   ),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
//
//   void stateOfLoginButton() {
//     setState(() {
//       enableLoginButton = password.isNotEmpty && email.isNotEmpty;
//     });
//   }
//
//   void loginPressed() {
//     if (kDebugMode) {
//       print("Logged");
//     }
//     if (email.isEmpty || password.isEmpty) {
//       showAlert("Informe seu email e sua senha!");
//       return;
//     }
//
//     if (email == "teste@gmail.com" && password == "123") {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (BuildContext context) => const MyHomePage()));
//     } else {
//       showAlert("As credenciais inseridas são inválidas");
//     }
//   }
//
//   void showAlert(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text(
//           "Atenção",
//         ),
//         content: Text(
//           message,
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Ok!'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
