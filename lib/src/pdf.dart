import 'dart:io';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';

void createReportPDF(DocumentSnapshot data) async {
  var formatter = new DateFormat('yyyy-MM-dd HH:mm');
  List<List<String>> sensorData = new List<List<String>>();
  sensorData.add(['Nombre del sensor','Tipo','Valor']);
  data['sensors'].forEach(
    (value) => sensorData.add(<String>[value['name'].toString(), value['type'].toString(), value['value'].toString()])
  );
  final pw.Document doc = pw.Document();
  doc.addPage(pw.MultiPage(
      pageFormat:
          PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: pw.CrossAxisAlignment.start,
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
                level: 1, text: 'Reporte de sensores - ID: ${data.documentID}'),
            pw.Paragraph(
                text:
                    'Fecha: ${formatter.format(data['createdDate'].toDate())}'),
            pw.Paragraph(text: 'Generado por: ${data['createdBy']}'),
            pw.Table.fromTextArray(context: context, data: sensorData),
          ]));

  Directory tempDir = await getTemporaryDirectory();

  String tempPath = tempDir.path;

  final file = File('$tempPath/report-${data.documentID}.pdf');
  
  file.writeAsBytesSync(doc.save());

  OpenFile.open(file.path);
}
