 
import 'package:flutter/material.dart';
import 'package:wared_app/models/wared.dart';
import 'package:wared_app/services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


 
class _HomePageState extends State<HomePage> {
  List<Wared>? wareds;
  var isLoaded = false;

  @override
  void initState() {    
    super.initState();
    //fetch data 
    getData();
  }
  
  getData() async{
      wareds = await RemoteServices().getwardes();
      if (wareds != null)
      {
        setState(() {
          isLoaded=true;
        });
      }
  }
  

  
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar (
        title: const Text('..Wared Actions..'),
        ),
        body: Visibility(
          
          visible: isLoaded,                          
          child: ListView.builder(
            itemCount: wareds?.length,
            itemBuilder: (context,index){      
            return Container(     
              padding: const EdgeInsets.all(16),       
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        // item 1                      
                        Text(wareds![index].waredSerial.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,              
                        style: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.normal,
                        ),
                        ),
                        // item 2 
                        Text(wareds![index].actions ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          ),
         //  replacement: const Center(
         //   child: CircularProgressIndicator(),
         //   ), 
        ),
    );
  }
}