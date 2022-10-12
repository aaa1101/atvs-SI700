import 'package:flutter/material.dart';
import 'package:prj_clinica/model/appointment.dart';

class PetHistoric extends StatelessWidget {
  var appointments = <Appointment>[];
  PetHistoric({super.key, required this.appointments});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> listOfColumns = [];
    for (var element in appointments) {
      var finished = (element.finished) ? 'Concluído' : 'Aberto';
      listOfColumns.add({
        'Data': element.date,
        'Horário': element.hour,
        'Tipo Atendimento': 'Consulta',
        'Status': finished
      });
    }

    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
              bottom: 25.0,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Data')),
                  DataColumn(label: Text('Horário')),
                  DataColumn(label: Text('Tipo Atendimento')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Ver mais')),
                ],
                rows: listOfColumns
                    .map(
                      ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element["Data"]!)),
                              DataCell(Text(element["Horário"]!)),
                              DataCell(Text(element["Tipo Atendimento"]!)),
                              DataCell(Text(element["Status"]!)),
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
          );
        },
      ),
    );
  }
}
