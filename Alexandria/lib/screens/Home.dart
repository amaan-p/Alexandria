import 'package:alexandria/screens/books.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        toolbarHeight: 80,titleSpacing: 25,
        backgroundColor: Colors.transparent,
        title: Text("Explore",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:45,fontFamily:'DavidLibre')),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 217,188,169),size: 40 ),
      ),
      endDrawer:Drawer(
        backgroundColor: Color.fromARGB(190, 00,00,00),
        width: 400,
        child:bookNav()

      ),

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child:Container(
        decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage("assets/images/Homeback.png"),
                fit:BoxFit.cover
            )
        ),
        child: Container(
          height:1460,
          child: Column(
            children: [
              SizedBox(child:Text(""),height: 10,width: 400),
             SizedBox(height: 55,width: 350,
               child: TextField(
                 textAlign: TextAlign.left,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Color.fromARGB(255, 217,188,169)  ,),

                    border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                    ),
                    enabledBorder:OutlineInputBorder(
                               borderSide: BorderSide(color:  Color.fromARGB(255, 217,188,169)  ),
                               borderRadius: BorderRadius.circular(50.0),
                    ),
                  focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:Color.fromARGB(255, 217,188,169)),
                                 borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintStyle: TextStyle(color: Color.fromARGB(255, 217,188,169),fontFamily: "DavidLibre",fontSize: 20),
                  hintText: "Search",
                ),
                 style: TextStyle(color:Color.fromARGB(255, 217,188,169),fontSize: 20,fontFamily:'DavidLibre'),
              )),
              SizedBox(height: 20,),
              Text("Most Popular",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:30,fontFamily:'DavidLibre',),textAlign: TextAlign.left,),
              SizedBox(height: 40,),
              Row(
                children:[
                  Expanded(
                child:CarouselSlider(
               items: [
                 Mostpopular("Pride and Prejudice.jpg","Jane Austen","Pride and Prejudice is an 1813 novel of manners by Jane Austen. The novel follows Elizabeth Bennet, "
                     " who learns about the repercussions of hasty judgments and comes to appreciate  superficial goodness and actual goodness."),
                 Mostpopular("Sherlock Holmes.jpg","Sir Arthur Conan Doyle","Holmes is known for his proficiency with observation, deduction, forensic science and logical reasoning that borders on the fantastic, which he employs when investigating cases for a wide variety of clients, including Scotland Yard"),
                 Mostpopular("Golden Compass.jpg","Philip Pullman","Set in a parallel universe, it features the journey of Lyra Belacqua to the Arctic in search of her missing friend, "
                     "Roger Parslow, and her imprisoned uncle"),
               ],
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.73,
                  aspectRatio: 1,
                  initialPage: 2,
                ),
              ),
              ),
                ]
              ),
              SizedBox(height: 50,child:Text("")),
              Row(
                children: [
                  Text("    Recommended",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:30,fontFamily:'DavidLibre',),textAlign: TextAlign.left,),

                ],
              ),Column(
                children: [
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 17,),
                  Recommended("1984.jpg","George Orwell","1984 is a dystopian novella by George Orwell published in 1949, which follows the life of Winston Smith, a low ranking member of ‘the Party’, who is frustrated by the omnipresent eyes of the party, and its ominous ruler Big Brother."),
                  Recommended("Casino Royale.jpg","Ian Fleming","The story concerns the British secret agent James Bond, gambling at the casino in Royale-les-Eaux to bankrupt Le Chiffre, the treasurer of a French union and a member of the Russian secret service.")
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 17,),
                  Recommended("Le Petit Prince.jpg","Antoine de Saint-Exupéry","The Little Prince is an honest and beautiful story about loneliness, friendship, sadness, and love. The prince is a small boy from a tiny planet (an asteroid to be precise), who travels the universe, planet-to-planet, seeking wisdom."),
                 Recommended("To Kill A Mockingbird.png","Harper Lee"," a young girl's coming-of-age story and a darker drama about the roots and consequences of racism and prejudice, probing how good and evil can coexist within a single community or individual.")
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 17,),
                  Recommended("Crime and Punishment.jpg","Fyodor Dostoevsky","Crime and Punishment follows the mental anguish and moral dilemmas of Rodion Raskolnikov, an impoverished ex-student in Saint Petersburg who plans to kill an unscrupulous pawnbroker, an old woman who stores money and valuable objects in her flat."),
                  Recommended("Murder on Orient Express.png","Agatha Christie","An American tycoon lies dead in his compartment, stabbed a dozen times, his door locked from the inside. Isolated and with a killer in their midst, detective Hercule Poirot must identify the murderer – in case he or she decides to strike again.")
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}


class Mostpopular extends StatelessWidget{
  Mostpopular(this.name,this.auth,this.desc);
  String name;
  String auth;
  String desc;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style:ButtonStyle(
        backgroundColor:  MaterialStatePropertyAll<Color>(Colors.transparent),
      ),
      onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context)=>Bookscreen(name,auth,desc)));
      },
        child:Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/book/$name'),
              fit: BoxFit.fill,
            )
        )));
  }
}





class Recommended extends StatelessWidget{
  Recommended(this.name,this.auth,this.desc);
  String name;
  String auth;
  String desc;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        style:ButtonStyle(
        backgroundColor:  MaterialStatePropertyAll<Color>(Colors.transparent),
    ),
    onPressed: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Bookscreen(name,auth,desc)));
    },
      child:Container(
      padding: EdgeInsets.all(20),
      height: 250,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          image:DecorationImage(image: AssetImage( 'assets/images/book/$name'),
              fit:BoxFit.cover
          )
      ),
    ));
  }
}

class bookNav extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        children: [
          //icon
          SizedBox(height: 170,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Explore",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:45,fontFamily:'DavidLibre')),

              SizedBox(height: 100,),
              Text("Genres",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:45,fontFamily:'DavidLibre')),

              SizedBox(height: 100,),
              Text("Authors",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:45,fontFamily:'DavidLibre')),

              SizedBox(height: 100,),
              Text("Favorites",style: TextStyle(color: Color.fromARGB(255, 217,188,169),fontSize:45,fontFamily:'DavidLibre')),
            ],
          ),]);
  }
}