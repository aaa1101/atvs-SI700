import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prj_clinica/model/client.dart';
import 'package:prj_clinica/model/pet.dart';
import 'package:prj_clinica/model/pets.dart';

class FirestoreDatabase {
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();
  FirestoreDatabase._createInstance();

  String? uid;

  // Ponto de acesso com o servidor
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<Client> getClient(clientId) async {
    DocumentSnapshot doc = await userCollection.doc(clientId).get();
    Client client = Client.fromMap(doc.data());
    client.uid = clientId;
    return client;
  }

  Future<Pet> getPet(petId) async {
    DocumentSnapshot doc =
        await userCollection.doc(uid).collection("my_pets").doc(petId).get();
    Pet pet = Pet.fromMap(doc.data());
    return pet;
  }

  Future<int> insertClient(Client client) async {
    var ref = await userCollection.doc(client.uid).set({
      "nome": client.nm_cliente,
      "cpf": client.cd_cpf,
      "tel": client.cd_tel,
      "email": client.nm_email
    });

    return 42;
  }

  Future<int> insertPet(Pet pet) async {
    DocumentReference ref =
        await userCollection.doc(uid).collection("my_pets").add({
      "nome": pet.nome,
      "idade": pet.idade,
      "especie": pet.especie,
      "sexo": pet.sexo,
      "raca": pet.raca
    });

    return 42;
  }

  Future<int> updatePet(petId, Pet pet) async {
    await userCollection.doc(uid).collection("my_pets").doc(petId).update({
      "nome": pet.nome,
      "idade": pet.idade,
      "especie": pet.especie,
      "sexo": pet.sexo,
      "raca": pet.raca
    });
    return 42;
  }

  Future<int> deletePet(petId) async {
    await userCollection.doc(uid).collection("my_pets").doc(petId).delete();
    return 42;
  }

  Pets _petListFromSnapshot(QuerySnapshot snapshot) {
    Pets pets = Pets();
    for (var doc in snapshot.docs) {
      Pet pet = Pet.fromMap(doc.data());
      pets.insertPetOfId(doc.id, pet);
    }
    return pets;
  }

  Future<Pets> getPetList() async {
    print(uid);
    QuerySnapshot snapshot =
        await userCollection.doc(uid).collection("my_pets").get();

    print(uid);
    return _petListFromSnapshot(snapshot);
  }

  Stream get stream {
    return userCollection
        .doc(uid)
        .collection("my_pets")
        .snapshots()
        .map(_petListFromSnapshot);
  }
}
