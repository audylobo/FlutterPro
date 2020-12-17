/* 


     return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: width * 0.25,
                          height: 120.0,
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myLista[index].nombreLago),
                              Text("Nivel de Oxigeno"),
                              Text("Nivel de pH"),
                              Text("Nivel de Agua")
                            ],
                          ),
                        ),
                       
                        Container(
                            width: width * 0.25,
                          height: 120.0,
                          color: Colors.blue,
                          child: GetBuilder<MySuperLago>(
                              init: myLista[index],
                              builder: (mySuperController) => Column(
                                    children: [


                                       Text("ACTUAL"),
                                      if(myLista[index].actualSensorTemperatura ==0)...{
                                        IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          myLista[index].increment();
                                        },
                                      ),
                                      }else...{
                                      Text(myLista[index].actualSensorTemperatura.toString()),
                                      Text(myLista[index].actualSensorOxigeno.toString()),
                                      Text(myLista[index].actualSensorPh.toString()),
                                      Text(myLista[index].actualSensorAgua.toString()),
                                      }
                                     

                                    
                                    ],
                                  )),
                        ),
                        Container(
                          width: width * 0.25,
                          height: 120.0,
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("MAX"),
                              Text(myLista[index]
                                      .maximosensorTemperatura
                                      .toString() +
                                  " C"),
                              Text(myLista[index].maxSensorOxigeno.toString() +
                                  "%"),
                              Text(myLista[index].maximosensorPh.toString() +
                                  " PH"),
                              Text(myLista[index].maximoSensorAgua.toString() +
                                  " CM"),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
            */