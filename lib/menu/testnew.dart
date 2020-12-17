/*         return Row(
                  children: [
                    SizedBox(width: 10.0),
                    Icon(FontAwesomeIcons.water,
                        color: Colors.blue, size: 25.0),
                    SizedBox(width: 10.0),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10.0),
                          child: Table(
                            defaultColumnWidth: FixedColumnWidth(80.0),
                            children: [
                              TableRow(children: [
                                Text('Lago ' + (index + 1).toString(),
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.green)),
                                Text('MIN',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.indigo[900])),
                                Text('ACTUAL',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15.0)),
                                Text('MAX',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.red)),
                              ]),
                              TableRow(children: [
                                Text('Temperatura'),
                                Text(
                                    myLista[index]
                                            .minimosensorTemperatura
                                            .toString() +
                                        " C",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.indigo[900])),
                                GetBuilder<MySuperLago>(
                                    init: myLista[index],
                                    builder: (mySuperController) => Column(
                                          children: [
                                            if (myLista[index]
                                                    .actualSensorTemperatura ==
                                                0) ...{
                                              GestureDetector(
                                                onTap: () {
                                                  myLista[index].increment();
                                                },
                                                child: Icon(Icons.add),
                                              ),
                                            } else ...{
                                              Text(
                                                myLista[index]
                                                    .actualSensorTemperatura
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            }
                                          ],
                                        )),
                                Text(
                                    myLista[index]
                                            .maximosensorTemperatura
                                            .toString() +
                                        " C",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red)),
                              ]),
                              TableRow(children: [
                                Text('Nivel de Oxigeno'),
                                Text(
                                    myLista[index].minSensorOxigeno.toString() +
                                        "%",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.indigo[900])),
                                GetBuilder<MySuperLago>(
                                    init: myLista[index],
                                    builder: (mySuperController) => Column(
                                          children: [
                                            if (myLista[index]
                                                    .actualSensorTemperatura ==
                                                0)
                                              ...{}
                                            else ...{
                                              Text(
                                                myLista[index]
                                                    .actualSensorOxigeno
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            }
                                          ],
                                        )),
                                Text(
                                    myLista[index].maxSensorOxigeno.toString() +
                                        "%",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red)),
                              ]),
                              TableRow(children: [
                                Text('Nivel de Ph '),
                                Text(
                                    myLista[index].minimosensorPh.toString() +
                                        " PH",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.indigo[900])),
                                GetBuilder<MySuperLago>(
                                    init: myLista[index],
                                    builder: (mySuperController) => Column(
                                          children: [
                                            if (myLista[index]
                                                    .actualSensorTemperatura ==
                                                0)
                                              ...{}
                                            else ...{
                                              Text(
                                                myLista[index]
                                                    .actualSensorPh
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            }
                                          ],
                                        )),
                                Text(
                                    myLista[index].maximosensorPh.toString() +
                                        " PH",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red)),
                              ]),
                              TableRow(children: [
                                Text('Nivel de Agua '),
                                Text(
                                    myLista[index].minimoSensorAgua.toString() +
                                        " CM",
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: Colors.indigo[900])),
                                GetBuilder<MySuperLago>(
                                    init: myLista[index],
                                    builder: (mySuperController) => Column(
                                          children: [
                                            if (myLista[index]
                                                    .actualSensorTemperatura ==
                                                0)
                                              ...{}
                                            else ...{
                                              Text(
                                                myLista[index]
                                                    .actualSensorAgua
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                              ),
                                            }
                                          ],
                                        )),
                                Text(
                                    myLista[index].maximoSensorAgua.toString() +
                                        " CM",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.red)),
                              ]),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          color: Colors.blue,
                          height: 100.0,
                          width: 100.0,
                        ),
                      ],
                    )
                  ],
                );
         */