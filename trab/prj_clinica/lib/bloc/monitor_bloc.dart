import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/model/pets.dart';
import 'package:prj_clinica/provider/firebase_firestore.dart';

class MonitorBloc extends Bloc<MonitorEvent, MonitorState> {
  Pets pets = Pets();

  MonitorBloc() : super(MonitorState(pets: Pets())) {
    FirestoreDatabase.helper.stream.listen((event) {
      pets = event;
      add(UpdateList());
    });

    on<AskNewList>((event, emit) async {
      pets = await FirestoreDatabase.helper.getPetList();
      print('pet ask: ${pets.length()}');
      // print(pets.petList[0]);
      emit(MonitorState(pets: pets));
    });

    on<UpdateList>((event, emit) {
      emit(MonitorState(pets: pets));
    });

    add(AskNewList());
  }
}

/*
Eventos
*/
abstract class MonitorEvent {}

class AskNewList extends MonitorEvent {}

class UpdateList extends MonitorEvent {}

/*
Estados
*/
class MonitorState {
  Pets pets;
  MonitorState({required this.pets});
}
