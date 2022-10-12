import 'package:flutter/material.dart';
import 'package:prj_clinica/model/pets.dart';

class AppointmentPage extends StatelessWidget {
  AppointmentPage({super.key});
  final pets = Pets.pets;

  @override
  Widget build(BuildContext context) {
    var appointment_pets = [];

    for (var element in pets) {
      if (element.appointments.isNotEmpty) appointment_pets.add(element);
    }
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: ListView.builder(
        itemCount: appointment_pets.length,
        itemBuilder: (context, index) {
          List<Map<String, String>> listOfColumns = [];
          for (var element in appointment_pets[index].appointments) {
            if (element.finished) continue;
            listOfColumns.add({
              'Data': element.date,
              'Horario': element.hour,
              'Tipo de Atendimento': 'Consulta',
              'Veterinario': 'Maria',
            });
          }
          return _tableAppointment(
              appointment_pets, index, listOfColumns, size);
        },
      ),
    );
  }

  Widget _tableAppointment(appointment_pets, int index,
      List<Map<String, String>> listOfColumns, Size size) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appointment_pets[index].nome,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: size.height * 0.5),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Horario')),
                  DataColumn(label: Text('Tipo Atendimento')),
                  DataColumn(label: Text('Veterinario')),
                  DataColumn(label: Text('Ver mais')),
                ],
                rows: listOfColumns
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["Data"]!)),
                              DataCell(Text(element["Horario"]!)),
                              DataCell(Text(element["Tipo de Atendimento"]!)),
                              DataCell(Text(element["Veterinario"]!)),
                              DataCell(
                                const Center(child: Icon(Icons.search)),
                                onTap: () {},
                              ),
                            ],
                          )),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
