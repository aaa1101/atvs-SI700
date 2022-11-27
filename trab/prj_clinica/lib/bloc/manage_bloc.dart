import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prj_clinica/model/pet.dart';
import 'package:prj_clinica/provider/firebase_firestore.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(InsertState()) {
    on<UpdateRequest>((event, emit) {
      emit(UpdateState(petId: event.petId, previousPet: event.previousPet));
    });

    on<UpdateCancel>((event, emit) {
      emit(InsertState());
    });

    on<SubmitEvent>((event, emit) {
      if (state is InsertState) {
        //ToDo: Inserir uma chamada de insert
        FirestoreDatabase.helper.insertPet(event.pet);
      } else if (state is UpdateState) {
        //ToDo: Inserir uma chamada de Update
        FirestoreDatabase.helper
            .updatePet((state as UpdateState).petId, event.pet);
        emit(InsertState());
      }
    });

    on<DeleteEvent>((event, emit) {
      // ToDo: Inserir uma chamada de Delete

      FirestoreDatabase.helper.deletePet(event.petId);
    });
  }
}

/*
  Eventos
*/
abstract class ManageEvent {}

class SubmitEvent extends ManageEvent {
  Pet pet;
  SubmitEvent({required this.pet});
}

class DeleteEvent extends ManageEvent {
  String petId;
  DeleteEvent({required this.petId});
}

class UpdateRequest extends ManageEvent {
  String petId;
  Pet previousPet;
  UpdateRequest({required this.petId, required this.previousPet});
}

class UpdateCancel extends ManageEvent {}

/*
Estados
*/

abstract class ManageState {}

class InsertState extends ManageState {}

class UpdateState extends ManageState {
  String petId;
  Pet previousPet;
  UpdateState({required this.petId, required this.previousPet});
}
