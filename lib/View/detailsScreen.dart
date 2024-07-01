import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_study/Models/dataState.dart';
import 'package:new_study/View/detailsCharacterCubit.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});

  static const screenRoute = "/DetailsScreen";

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final cubit = Modular.get<DetailsCharacterCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getDragonBallCharacterDetails(widget.id);
  }

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
        create: (context) => Modular.get<DetailsCharacterCubit>(
          key: DetailsCharacterCubit.valueKey.value
        ),
        child: BlocBuilder<DetailsCharacterCubit, DataState>(
          builder: (context, state) {
              return const Center(
                child: Text("Deu errado"),
              );
          },
        ),
      ),
    );
  }
}
