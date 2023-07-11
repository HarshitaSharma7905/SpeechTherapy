import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:speechtherapy/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:speechtherapy/Login.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  //create account
  void createaccount() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();
    if(email==""||password==""||cPassword==""){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Enter Required Details"),
      ));
    }
    else if(password !=cPassword){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password dont match"),
      ));
    }
    else{
     try{
       UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("Account Created Successfully"),
       ));
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
     }on FirebaseAuthException catch(err)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));
    }

    }
  }
  var _selectedgender=null;
  String selectedCity="Choose City";

  String selectedstate="Choose State";
  bool cityDropdown=false;
  List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Delhi',
    'Lakshadweep',
    'Puducherry'];

  Map<String, List<String>> cities = {
    'Andhra Pradesh': ['Visakhapatnam', 'Vijayawada', 'Guntur', 'Tirupati'],
    'Arunachal Pradesh': ['Itanagar', 'Naharlagun', 'Pasighat'],
    'Assam': ['Guwahati', 'Silchar', 'Dibrugarh', 'Jorhat'],
    'Bihar': ['Patna', 'Gaya', 'Muzaffarpur', 'Bhagalpur'],
    'Chhattisgarh': ['Raipur', 'Bhilai', 'Bilaspur', 'Durg'],
    'Goa': ['Panaji', 'Margao', 'Vasco da Gama'],
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot'],
    'Haryana': ['Faridabad', 'Gurgaon', 'Panipat', 'Karnal'],
    'Himachal Pradesh': ['Shimla', 'Mandi', 'Dharamshala'],
    'Jharkhand': ['Ranchi', 'Jamshedpur', 'Dhanbad', 'Bokaro'],
    'Karnataka': ['Bengaluru', 'Mysore', 'Hubli', 'Mangalore'],
    'Kerala': ['Thiruvananthapuram', 'Kochi', 'Kozhikode', 'Thrissur'],
    'Madhya Pradesh': ['Bhopal', 'Indore', 'Jabalpur', 'Gwalior'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik'],
    'Manipur': ['Imphal', 'Thoubal', 'Bishnupur'],
    'Meghalaya': ['Shillong', 'Tura', 'Nongpoh'],
    'Mizoram': ['Aizawl', 'Lunglei', 'Champhai'],
    'Nagaland': ['Kohima', 'Dimapur', 'Mokokchung'],
    'Odisha': ['Bhubaneswar', 'Cuttack', 'Rourkela', 'Puri'],
    'Punjab': ['Chandigarh', 'Ludhiana', 'Amritsar', 'Jalandhar'],
    'Rajasthan': ['Jaipur', 'Jodhpur', 'Udaipur', 'Kota'],
    'Sikkim': ['Gangtok', 'Namchi', 'Gyalshing'],
    'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Salem'],
    'Telangana': ['Hyderabad', 'Warangal', 'Nizamabad', 'Karimnagar'],
    'Tripura': ['Agartala', 'Udaipur', 'Dharmanagar'],
    'Uttar Pradesh': ['Lucknow', 'Kanpur', 'Agra', 'Varanasi'],
    'Uttarakhand': ['Dehradun', 'Haridwar', 'Roorkee', 'Haldwani'],
    'West Bengal': ['Kolkata', 'Asansol', 'Siliguri', 'Durgapur'],
    'Andaman and Nicobar Islands': ['Port Blair', 'Diglipur', 'Mayabunder'],
    'Chandigarh': ['Chandigarh'],
    'Delhi': ['New Delhi'],
    'Lakshadweep': ['Kavaratti', 'Minicoy', 'Agatti'],
    'Puducherry': ['Puducherry', 'Karaikal', 'Mahe', 'Yanam'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Create Profile'),
     centerTitle: true,leading: BackButton(onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
     },),
     ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //container 1
                Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
                    child: Image.asset('assets/profile.png'),
                ),SizedBox(height:10 ),
                //container 2
                Container(width: 400,
                child:Column(
                  children: [
                    // TextField(decoration: InputDecoration(labelText: 'First Name',prefixIcon: Icon(Icons.person),border: OutlineInputBorder()),keyboardType: TextInputType.name),SizedBox(height: 10),
                    TextField(controller: emailController,decoration: InputDecoration(labelText: 'Gmail',prefixIcon: Icon(Icons.email_outlined),border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),SizedBox(height: 10),
                    // TextField(decoration: InputDecoration(labelText: 'Contact',prefixIcon: Icon(Icons.phone),border: OutlineInputBorder()),keyboardType: TextInputType.number),SizedBox(height: 10),
                    TextField(controller: passwordController,decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.key),border: OutlineInputBorder()),keyboardType: TextInputType.visiblePassword),SizedBox(height: 10),

                    TextField(controller: cPasswordController,decoration: InputDecoration(labelText: 'Confirm Password',prefixIcon: Icon(Icons.key),border: OutlineInputBorder()),keyboardType: TextInputType.visiblePassword),SizedBox(height: 10),
                  //   DropdownButtonFormField<String>(
                  //     hint: Center(child: Text('Select Gender')),
                  //     decoration: InputDecoration(border: OutlineInputBorder()),
                  //     value: _selectedgender, onChanged: (value) {  },
                  //   items: [
                  //           DropdownMenuItem(child: Text('Select Gender'),value: "-1"),
                  //           DropdownMenuItem(child: Text('Male'),value: "0",),
                  //           DropdownMenuItem(child: Text('Female'),value: "1",),
                  //           DropdownMenuItem(child: Text('Dont prefer to say'),value: "2"),
                  //
                  //   ],
                  //  ),SizedBox(height: 10),
                  // DropdownSearch(
                  //   items:states ,
                  //   selectedItem: selectedstate,
                  //   onChanged: (value) {
                  //     setState(() {
                  //      selectedstate=value!;
                  //      selectedCity="Choose City";
                  //      if(selectedstate!="Choose State")
                  //        {
                  //          cityDropdown=true;
                  //        }
                  //     });
                  //   },
                  // ),SizedBox(height: 10),
                  //   Visibility(
                  //       visible:cityDropdown ,
                  //       child: DropdownSearch<String>(
                  //         selectedItem: selectedCity,
                  //         items: selectedstate != "Choose State" ? cities[selectedstate]! : [],
                  //         onChanged: (value) {
                  //           selectedCity=value!;
                  //         },
                  //
                  //       )),
                    Container(
                      width: 200,height: 40,
                      child: ElevatedButton(onPressed: () {
                        createaccount();

                      }, child: Text('Submit'),style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),),
                    )
                  ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
