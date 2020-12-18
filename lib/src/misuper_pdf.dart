import 'dart:io';

import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void generateDocument(MySuperLago item) async {
  final formatter = DateFormat('yyyy/MM/dd HH:mm a');
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return null;
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.BoxBorder(
                    bottom: true, width: 0.5, color: PdfColors.grey)),
            child: pw.Text('Portable Document Format',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(
                level: 0,
                text: 'REPORTE',
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: <pw.Widget>[
                      pw.Text('REPORTE', textScaleFactor: 2),
                      pw.PdfLogo(),
                      
                    ])),
            pw.Header(
                level: 1, text: 'Sensor PH'),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Medicion',
                'Precision',
                'Referencia',
                'Resistencia de Agua',
                'Voltaje',
                'Temperatura Tolerable',
                'Tiempo de Respuesta',
              ],
              <String>[
                item.sensorPh.medicion,
                item.sensorPh.precision,
                item.sensorPh.referencia,
                item.sensorPh.resistenciaAgua,
                item.sensorPh.voltaje,
                item.sensorPh.temperaturaTolerable,
                item.sensorPh.tiempoRespuesta,
              ],
            ]),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Header(
                level: 1, text: 'Sensor Agua'),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Corriente',
                'Distancia',
                'Referencia',
                'Resistencia de agua',
                'Voltaje',
                'Frecuencia',
                'Precio',
              ],
              <String>[
                item.sensorAgua.corriente,
                item.sensorAgua.distancia,
                item.sensorAgua.referencia,
                item.sensorAgua.resistenciaAgua,
                item.sensorAgua.voltaje,
                item.sensorAgua.frecuencia,
                item.sensorAgua.precio,
              ],
            ]),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
           pw.Header(
                level: 1, text: 'Sensor Oxigeno'),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Deteccion',
                'Precio',
                'Precision',
                'Referencia',
                'Resistencia de Agua',
                'Voltaje',
              ],
              <String>[
                item.sensorOxigeno.deteccion,
                item.sensorOxigeno.precio,
                item.sensorOxigeno.precision,
                item.sensorOxigeno.referencia,
                "No",
                item.sensorOxigeno.voltaje,
              ],
            ]),
           pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Header(
                level: 1, text: 'Sensor Temperatura'),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Resistencia Agua',
                'Referencia',
                'Consumo',
                'Precio',
                'Temperatura',
              ],
              <String>[
                item.sensorTemperatura.resistenciaagua,
                item.sensorTemperatura.referencia,
                item.sensorTemperatura.consumo,
                item.sensorTemperatura.precio,
                item.sensorTemperatura.temperatura,
              ],
            ]),
            pw.Padding(padding: const pw.EdgeInsets.all(10)),
            pw.Header(level: 1, text: 'Peces registrados en el lago'),
            pw.Table.fromTextArray(context: context, data: <List<String>>[
              <String>[
                'Nombre del pez',
                'Fecha de ingreso',
                'Cantidad Peces',
              ],
              for (var i = 0; i < item.registrosLagos.length; i++) ...{
                [
                  item.registrosLagos[i].pez.nombrePez,
                  formatter.format(DateTime.parse(
                      item.registrosLagos[i].fecha.toDate().toString())),
                  item.registrosLagos[i].cantidadPeces.toString(),
                ]
              },
            ]),
          ]));

  Directory tempDir = await getTemporaryDirectory();

  String tempPath = tempDir.path;

  final file = File('$tempPath/Reporte-Lago.pdf');

  file.writeAsBytesSync(doc.save());

  OpenFile.open(file.path);
}
