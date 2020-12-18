/* import 'dart:io';

import 'package:drawer_menu/models/mysuperlago.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
 */
/* void gridPDF(MySuperLago mySuperLago) async {
  final formatter = DateFormat('yyyy/MM/dd HH:mm a');
  PdfDocument document = PdfDocument();
  document.pages.add();
  PdfPage page = document.pages[0];
  PdfGrid grid = PdfGrid();

  page.graphics.drawString('Sensor de Agua',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.regular),
      bounds: Rect.fromLTWH(0, 0, 400, 300));

  grid.columns.add(count: 7);

  grid.headers.add(1);

  PdfGridRow header = grid.headers[0];

  header.cells[0].value = 'Corriente';
  header.cells[1].value = 'Distancia';
  header.cells[2].value = 'Referencia';
  header.cells[3].value = 'Resistencia de agua';
  header.cells[4].value = 'Voltaje';
  header.cells[5].value = 'Frecuencia';
  header.cells[6].value = 'Precio';

  PdfGridRow row1 = grid.rows.add();
  row1.cells[0].value = mySuperLago.sensorAgua.corriente;
  row1.cells[1].value = mySuperLago.sensorAgua.distancia;
  row1.cells[2].value = mySuperLago.sensorAgua.referencia;
  row1.cells[3].value = mySuperLago.sensorAgua.resistenciaAgua;
  row1.cells[4].value = mySuperLago.sensorAgua.voltaje;
  row1.cells[5].value = mySuperLago.sensorAgua.frecuencia;
  row1.cells[6].value = mySuperLago.sensorAgua.precio;

  grid.draw(page: page, bounds: const Rect.fromLTWH(0, 20, 400, 300));

  PdfGrid grid2 = PdfGrid();
  grid2.columns.add(count: 6);
  grid2.headers.add(1);
  PdfGridRow header1 = grid2.headers[0];
  header1.cells[0].value = 'Deteccion';
  header1.cells[1].value = 'Precio';
  header1.cells[2].value = 'Precision';
  header1.cells[3].value = 'Referencia';
  header1.cells[4].value = 'ResistenciaAgua';
  header1.cells[5].value = 'Voltaje';
  PdfGridRow row11 = grid2.rows.add();
  row11.cells[0].value = mySuperLago.sensorOxigeno.deteccion;
  row11.cells[1].value = mySuperLago.sensorOxigeno.precio;
  row11.cells[2].value = mySuperLago.sensorOxigeno.precision;
  row11.cells[3].value = mySuperLago.sensorOxigeno.referencia;
  row11.cells[4].value = "No";
  row11.cells[5].value = mySuperLago.sensorOxigeno.voltaje;

  page.graphics.drawString('Sensor de Oxigeno',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.regular),
      bounds: Rect.fromLTWH(0, 60, 400, 300));
  grid2.draw(page: page, bounds: Rect.fromLTWH(0, 80, 400, 300));

  PdfGrid grillaSensorPh = PdfGrid();
  grillaSensorPh.columns.add(count: 7);
  grillaSensorPh.headers.add(1);
  PdfGridRow headerGrillaSensorPH = grillaSensorPh.headers[0];
  headerGrillaSensorPH.cells[0].value = 'Medicion';
  headerGrillaSensorPH.cells[1].value = 'Precision';
  headerGrillaSensorPH.cells[2].value = 'Referencia';
  headerGrillaSensorPH.cells[3].value = 'ResistenciaAgua';
  headerGrillaSensorPH.cells[4].value = 'Voltaje';
  headerGrillaSensorPH.cells[5].value = 'Temperatura Tolerable';
  headerGrillaSensorPH.cells[6].value = 'Tiempo de Respuesta';

  PdfGridRow miRowSensorPH = grillaSensorPh.rows.add();
  miRowSensorPH.cells[0].value = mySuperLago.sensorPh.medicion;
  miRowSensorPH.cells[1].value = mySuperLago.sensorPh.precision;
  miRowSensorPH.cells[2].value = mySuperLago.sensorPh.referencia;
  miRowSensorPH.cells[3].value = mySuperLago.sensorPh.resistenciaAgua;
  miRowSensorPH.cells[4].value = mySuperLago.sensorPh.voltaje;
  miRowSensorPH.cells[5].value = mySuperLago.sensorPh.temperaturaTolerable;
  miRowSensorPH.cells[6].value = mySuperLago.sensorPh.tiempoRespuesta;

  page.graphics.drawString('Sensor de Ph',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.regular),
      bounds: Rect.fromLTWH(0, 140, 400, 300));
  grillaSensorPh.draw(page: page, bounds: Rect.fromLTWH(0, 160, 400, 300));

  PdfGrid grillaTemp = PdfGrid();
  grillaTemp.columns.add(count: 5);
  grillaTemp.headers.add(1);
  PdfGridRow headergrillaTemp = grillaTemp.headers[0];
  headergrillaTemp.cells[0].value = 'Resistencia Agua';
  headergrillaTemp.cells[1].value = 'Referencia';
  headergrillaTemp.cells[2].value = 'Consumo';
  headergrillaTemp.cells[3].value = 'Precio';
  headergrillaTemp.cells[4].value = 'Temperatura';

  PdfGridRow miRowTemp = grillaTemp.rows.add();
  miRowTemp.cells[0].value = mySuperLago.sensorTemperatura.resistenciaagua;
  miRowTemp.cells[1].value = mySuperLago.sensorTemperatura.referencia;
  miRowTemp.cells[2].value = mySuperLago.sensorTemperatura.consumo;
  miRowTemp.cells[3].value = mySuperLago.sensorTemperatura.precio;
  miRowTemp.cells[4].value = mySuperLago.sensorTemperatura.temperatura;

  page.graphics.drawString('Sensor de Temperatura',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.regular),
      bounds: Rect.fromLTWH(0, 210, 400, 300));
  PdfLayoutResult result =
      grillaTemp.draw(page: page, bounds: Rect.fromLTWH(0, 230, 400, 300));

  page.graphics.drawString('Peces registrados en el lago',
      PdfStandardFont(PdfFontFamily.helvetica, 14, style: PdfFontStyle.regular),
      bounds: Rect.fromLTWH(0, result.bounds.bottom + 10, 400, 300));

  PdfGrid grillpaces = PdfGrid();

  grillpaces.columns.add(count: 3);
  grillpaces.headers.add(1);
  PdfGridRow header1peces = grillpaces.headers[0];
  header1peces.cells[0].value = 'Cantidad de Peces';
  header1peces.cells[1].value = 'Fecha de Ingreso';
  header1peces.cells[2].value = 'Nombre del Pez';

  for (var i = 0; i < mySuperLago.registrosLagos.length; i++) {
    PdfGridRow myrowPez = grillpaces.rows.add();
    myrowPez.cells[0].value =
        mySuperLago.registrosLagos[i].cantidadPeces.toString();

    myrowPez.cells[1].value = formatter.format(DateTime.parse(
        mySuperLago.registrosLagos[i].fecha.toDate().toString()));
    myrowPez.cells[2].value = mySuperLago.registrosLagos[i].pez.nombrePez;
  }

  document.pages.add();
  PdfPage page2 = document.pages[1];
  grillpaces.draw(page: page2, bounds: Rect.fromLTWH(0, 0, 400, 300));

  Directory tempDir = await getTemporaryDirectory();

  String tempPath = tempDir.path;

  final file = File('$tempPath/Reporte-Lago.pdf');

  file.writeAsBytesSync(document.save());

  OpenFile.open(file.path);
}
 */