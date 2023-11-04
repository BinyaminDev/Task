import 'package:flutter/material.dart';
import 'package:foxy_app/controller.dart/api_service.dart';
import 'package:foxy_app/view/widgets/users.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Consumer<ApiProvider>(
                builder: (context, value, child) =>Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () => _searchController.clear(),
                        ),
                        prefixIcon: IconButton(
                          icon:const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            value.searchUsers(_searchController.text);
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                
              ),
              Consumer<ApiProvider>(
                  builder: (context, value, child) {
                    if(value.userData.isEmpty){
                      return const Center(child: CircularProgressIndicator(),);
                    }else{
                     return Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(8),
                         child: ListView.builder(
                           physics: const BouncingScrollPhysics(),
                           shrinkWrap: true,
                           itemCount: value.userData.length,
                           itemBuilder: ((context, index) {
                              final user = value.userData[index];
                             return UserGrid(user:user);
                           }),
                         ),
                       ),
                     );
                    }
                  } 
                      )
            ],
          ),
        ));
  }
}
