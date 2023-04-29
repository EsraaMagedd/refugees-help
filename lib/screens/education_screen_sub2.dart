import 'package:flutter/material.dart';
import 'package:refugees_help/screens/education_screen_sub21.dart';
import 'package:refugees_help/screens/education_screen_sub1.dart';
import 'package:flutter/widgets.dart';


class data{
  @required String? collegeName;
  @required String? collegeNameE;
  @required String? collegeImg;
  @required String collegeURL;
  Widget collegeScreen;

  data({required this.collegeName,
    required this.collegeNameE,
    this.collegeImg,
    required this.collegeURL ,
    required this.collegeScreen});
}

List<data> college=[
  data( collegeName: 'كلية الحاسبات والذكاء الاصطناعي',
    collegeNameE: 'Faculty of Computers and Artificial Intelligence',
    collegeImg: 'assets/images/fcai.png',
    collegeURL: 'http://fcai.usc.edu.eg/',
    collegeScreen:details(0),
  ),
  data( collegeName: 'كلية الصيدلة',
    collegeNameE: 'Faculty of Pharmacy',
    collegeImg: 'assets/images/pharmacy.jfif',
    collegeURL: 'https://fop.usc.edu.eg/ar',
    collegeScreen:details(1),
  ),
  data( collegeName: 'كلية الطب البيطري',
    collegeNameE: 'Faculty of Veterinary Medicine',
    collegeImg: 'assets/images/vet.png',
    collegeURL: 'https://vet.usc.edu.eg/ar',
    collegeScreen:details(2),
  ),
  data( collegeName: 'كلية التجارة',
    collegeNameE: 'Faculty of Commerce',
    collegeImg: 'assets/images/comm.jfif',
    collegeURL: 'https://com.usc.edu.eg/ar',
    collegeScreen:details(3),
  ),
  data( collegeName: 'كلية التربية',
    collegeNameE: 'Faculty of Education',
    collegeImg: 'assets/images/edus.jfif',
    collegeURL: 'https://edu.usc.edu.eg/ar',
    collegeScreen:details(4),
  ),

  data( collegeName: 'كلية التربية الرياضية',
    collegeNameE: 'Faculty of Sport Education',
    collegeImg: 'assets/images/sport.jfif',
    collegeURL: 'https://phed.usc.edu.eg/ar',
    collegeScreen:details(5),
  ),
  data( collegeName: 'كلية الحقوق',
    collegeNameE: 'Faculty of Law',
    collegeImg: 'assets/images/law.png',
    collegeURL: 'https://law.usc.edu.eg/ar',
    collegeScreen:details(6),
  ),
  data( collegeName: 'كلية السياحة والفنادق',
    collegeNameE: 'Faculty of Tourism and Hotels',
    collegeImg: 'assets/images/tour.png',
    collegeURL: 'https://fth.usc.edu.eg/ar',
    collegeScreen:details(7),
  ),
  data( collegeName: 'كلية التربية للطفولة المبكرة',
    collegeNameE: 'Faculty of Early Childhood Education',
    collegeImg: 'assets/images/educ.jfif',
    collegeURL: 'https://ech.usc.edu.eg/',
    collegeScreen:details(8),
  ),
];
class education_screen_sub2 extends StatelessWidget {
  const education_screen_sub2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySub2(),
    );
  }
}
class MySub2 extends StatefulWidget {
  const MySub2({super.key});

  @override
  State<MySub2> createState() => _MySub2();
}
class _MySub2 extends State<MySub2>{
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('الكليات المتاحة في جامعة مدينة السادات'),
          backgroundColor: Colors.grey,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const education_screen_sub21()),
                );
              }
          ),
        ),

        backgroundColor: Color(0xffEFECE7),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context,index)=>buildCount(college[index], context),
              separatorBuilder: (context,index)=>SizedBox(height:15,)
              , itemCount: college.length),
        ),
      ),);
  }
}

Widget buildCount(data d,BuildContext context){

  return SingleChildScrollView(
    child:
    Card(
      //color: Color(0xffCCC8BF),
      color: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
  child: ListTile (

          leading: CircleAvatar(
            //  radius: 48, // Image radius
            backgroundImage: AssetImage("${d.collegeImg}"),
            backgroundColor: Colors.white,
          ),
          title:  Text("${d.collegeName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
          trailing: ElevatedButton(
            child: Text('تفاصيل',style: TextStyle(fontSize: 12),),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.grey.shade400,
              shape: StadiumBorder(),
            ),
            onPressed: () {
              showModalBottomSheet(context: context, builder:(context)=>d.collegeScreen );


            },
            //_navigateToNextScreen(context);
          )
  ),
      ),

  );
}

class details extends StatelessWidget {


  details(int i){

  }

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("عرض المزيد"),
          backgroundColor: Colors.grey,
          centerTitle: true,
          toolbarHeight: 40,
        ),
        body: Container(
            margin: EdgeInsets.all(10),
            child:ListView.separated(
              itemBuilder: (context, index) => buildCount2(college[2], context),
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: 1, // update itemCount to display only one item
            )

        ),
      ),
    );
  }
}

Widget buildCount2(data d,BuildContext context){

  return SingleChildScrollView(
    child: Column(
      children: [
        ListTile (
          leading: CircleAvatar(
            //  radius: 48, // Image radius
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("${d.collegeImg}"),
          ),
          title:  Text("${d.collegeName}\n ${d.collegeNameE}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
        ),
        SizedBox(height: 20,),
        SizedBox(height: 40,),
        Row(
            children:[
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.school),
              ),
              Text("${d.collegeURL}"),

            ]
        ),
        SizedBox(height: 100,),
        Text("تواصل معنا..",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              IconButton(
                onPressed: (){

                  //action coe when button is pressed
                },
                icon: Icon(Icons.phone_enabled),
              ),
              IconButton(
                onPressed: (){
                  //action coe when button is pressed
                },
                icon: Icon(Icons.message),
              ),
              //Text("${d.phone}"),
            ]
        ),

      ],
    ),
  );
}