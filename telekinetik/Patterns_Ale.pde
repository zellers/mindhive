//// //this code is written for use during the event Melburners Decom After Party , running on 17 November 2018 in Melbourne, Australia.
//// //Use of the code for another project/event/purpose may be granted after informing the author about type and purpose of the project. 

//// public class A4 extends LXPattern { //pattern is split in subpatterns affecting individual features 

////    public String getAuthor() {
////     return "Alessandro Cesana,  https://github.com/alecesana , cesaless@gmail.com ";
////   }

 

////     //------------- Parameters affecting grayscale pattern
////    public final CompoundParameter A= (CompoundParameter)
////     new CompoundParameter("A",1, 1, 50) 
////     .setDescription(" A");
    
////        public final CompoundParameter B = (CompoundParameter)
////     new CompoundParameter("B",2, 1, 70) 
////     .setDescription(" B");
    
////        public final CompoundParameter C = (CompoundParameter)
////     new CompoundParameter("C",1, 1, 200) 
////     .setDescription(" C");
    
////     public final CompoundParameter D = (CompoundParameter)
////     new CompoundParameter("D",1, -10, 10) 
////     .setDescription("D");
    
////     //----------------------------------------
    
////        public final CompoundParameter s1R= (CompoundParameter)
////     new CompoundParameter("s1R",1, 0, 4) 
////     .setDescription(" Diamond radius");
    
 
    
////        public final CompoundParameter s1p = (CompoundParameter)
////     new CompoundParameter("s1p",1, 1, 20) 
////     .setDescription(" Diamond oscillation period(everything else oscillates with it when Olink set to true) ");
    
////        public final CompoundParameter s1t = (CompoundParameter)
////     new CompoundParameter("s1 thickness",1, 0.1, 4) 
////     .setDescription(" Diamond thickness");
    
////     //----------------------------------------
////     public final CompoundParameter s2R = (CompoundParameter)
////     new CompoundParameter("s2R",2, 0.01, 4) 
////     .setDescription("Mem Panels sphere radius");
    
////        public final CompoundParameter s2p = (CompoundParameter)
////     new CompoundParameter("s2p",1, 1, 5) 
////     .setDescription(" Mem Panels oscillation period");
    
////     public final CompoundParameter s2t = (CompoundParameter)
////     new CompoundParameter("s2 thickness",0.29, 0.01, 6) 
////     .setDescription(" Mem Panels thickness");
    
////     //----------------------------------------
    
////         //------------------------------------------------------
        
////     public final CompoundParameter s3R = (CompoundParameter)
////     new CompoundParameter("s3R",20, 0.01, 28) 
////     .setDescription(" floor radius");
    
////        public final CompoundParameter s3p = (CompoundParameter)
////     new CompoundParameter("s3p",1, 1, 2.5) 
////     .setDescription(" floor oscillation period");
    
////     public final CompoundParameter s3t = (CompoundParameter)
////     new CompoundParameter("s3 thickness",10, 1, 200) 
////     .setDescription(" floor thickness");
    
//// ///------------------------------------------------------------
        
////     public final CompoundParameter s4R = (CompoundParameter)
////     new CompoundParameter("s4R",5, 0.1, 10.45)
////     .setDescription(" wings radius");
    
////        public final CompoundParameter s4p = (CompoundParameter)
////     new CompoundParameter("s4p",1, 1, 2.5) 
////     .setDescription(" wings oscillation period");
    
////     public final CompoundParameter s4t = (CompoundParameter)
////     new CompoundParameter("s4 thickness",10, 1, 70) 
////     .setDescription(" wings thickness");
    
////     ///------------------------------------------------------------
        
////     public final CompoundParameter s5R = (CompoundParameter)
////     new CompoundParameter("s5R",5, 0.5, 12) 
////     .setDescription(" circle 4 radius");
    
////        public final CompoundParameter s5p = (CompoundParameter)
////     new CompoundParameter("s5p",1, 1, 2.5) 
////     .setDescription(" circle 4 radius oscillation period");
    
////     public final CompoundParameter s5t = (CompoundParameter)
////     new CompoundParameter("s5 thickness",10, 3, 200) 
////     .setDescription(" circle 5 thickness");
    
        
////      //------------------------------------------------------
            
////                 public final CompoundParameter s6R = (CompoundParameter)
////     new CompoundParameter("s6R",20, 1, 28) 
////     .setDescription(" Chandelier radius");
    
   
    
////        public final CompoundParameter s6p = (CompoundParameter)
////     new CompoundParameter("s6p",1, 1, 2.5) 
////     .setDescription(" chandelier oscillator period");
    
////     public final CompoundParameter s6t = (CompoundParameter)
////     new CompoundParameter("s6 thickness",10, 3, 200) 
////     .setDescription(" chandelier thickness");
    
//// public final BooleanParameter OLink = (BooleanParameter)
////     new BooleanParameter("OLink", true)
////     .setDescription("True =  all oscillators are made equak to s1rsinP");
    
////     public final BooleanParameter floorSwitch = (BooleanParameter)
////     new BooleanParameter("floorswitch", false)
////     .setDescription("false = three cirlces pattern on");
    
    
////             //------------------------------------------------------
    
////     //modulators to oscillate circles at different phases
////     //private final LXModulator sin1 = startModulator(new SinLFO(1, 15, millis())); ///add relationship between sin phases? add object oriented features( three sereis of circles)?
////     //private  List<LXPoint> = MEMChandelier.getPoints();
////        /* private final LXModulator s1rsinP = startModulator(new SinLFO(1, 20, s1RsinP)); ///add relationship between sin phases? add object oriented features( three sereis of circles)?
////         private final LXModulator s4p = startModulator(new SinLFO(1, 5, s4p));
////         private final LXModulator s3p = startModulator(new SinLFO(1, 5, s3p)); 
////         private final LXModulator s4p = startModulator(new SinLFO(1, 20, s4p)); ///add relationship between sin phases? add object oriented features( three sereis of circles)?
////         private final LXModulator s5p = startModulator(new SinLFO(1, 20, s5p)); ///add relationship between sin phases? add object oriented features( three sereis of circles)?
////         private final LXModulator s6p = startModulator(new SinLFO(1, 20, s6p)); ///add relationship between sin phases? add object oriented features( three sereis of circles)?
//// */

    



////   public A4(LX lx) {
////     super(lx);

////     addParameter("A", this.A);
////     addParameter("B", this.B);
////     addParameter("C", this.C);
////     addParameter("D", this.D);
    
////     addParameter("OLink", this.OLink);
////     addParameter("floorswitch", this.floorSwitch);
    
   
////      addParameter("s1R", this.s1R);
////     addParameter("s1P", this.s1p);
////     addParameter("s1t", this.s1t);
    
        
////     addParameter("s2R", this.s2R);
////     addParameter("s2p", this.s2p);
////     addParameter("s2t", this.s2t);
    
    
////     addParameter("s3R", this.s3R);
////     addParameter("s3p", this.s3p);
////     addParameter("s3t", this.s3t);
    
////     addParameter("s4R", this.s4R);
////     addParameter("s4p", this.s4p); //using it for wings
////     addParameter("s4t", this.s4t);
    
////     addParameter("s5R", this.s5R);
////     addParameter("s5p", this.s5p); //using it for wings
////     addParameter("s5t", this.s5t);
    
////      addParameter("s6R", this.s6R);
////     addParameter("s6p", this.s6p); //using it for wings
////     addParameter("s6t", this.s6t);
    
    
  
   

////   }
  
////   public void run(double deltaMs) {

////     float a = (this.A.getValuef());
////     float b = (this.B.getValuef());
////     float c = (this.C.getValuef());
////     float d = (this.D.getValuef());
////     boolean olink= (this.OLink.getValueb());
////     boolean floorswitch= (this.floorSwitch.getValueb());

////     //----------------------------------
////      float r1 = (this.s1R.getValuef());
////      float s1P = (this.s1p.getValuef()); 
     
////      float s1t = (this.s1t.getValuef());
    
////     float s2P,s3P,s4P,s5P, s6P;
////     float r2 = (this.s2R.getValuef());
////     float s2t = (this.s2t.getValuef());
    
////     float r3 = (this.s3R.getValuef());
////     float s3t = (this.s3t.getValuef());
    
////      float r4 = (this.s4R.getValuef());
////     float s4t = (this.s4t.getValuef());
    
////     float r5 = (this.s5R.getValuef());
////     float s5t = (this.s5t.getValuef());
    
////     float r6 = (this.s6R.getValuef());
////     float s6t = (this.s6t.getValuef());
    
////     float mem_panel_boundary = abs(tcr.mem_panels[0].xMax - tcr.mem_panels[0].xMin)/2; 
////     //might need to try with Ymax and Ymin
////    // print(mem_panel_boundary);
////    // print(tcr.mem_panels[0].yMax);
////     //print(tcr.mem_panels[0].yMin);
     
   

////     if (olink == true){
////       s2P = s1P;
////       s3P= s1P;
////       s4P= s1P;
////       s5P=s1P;
////       s6P=s1P;
      
////     }
////     else{
////       s2P = (this.s2p.getValuef());
////        s3P = (this.s3p.getValuef());
////        s4P = (this.s4p.getValuef());
////        s5P = (this.s5p.getValuef());
////        s6P = (this.s6p.getValuef());
       
////     }
      


//// //diamonds, s1
//// for (int i = 0; i<2;i++){
////     for  (LXPoint p : tcr.diamonds[i].getPoints()) {   //leftDiamond
////         if( 
  
////       ( 
      
////        (sqrt ( pow(abs( p.x  - tcr.diamonds[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.diamonds[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.diamonds[i].centrePoint[2]), 2))>= (s1P * r1) ) &&
////        (sqrt ( pow(abs( p.x  - tcr.diamonds[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.diamonds[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.diamonds[i].centrePoint[2]), 2))<=(s1P *(r1+s1t)))
    
////        ))
 
////       {

////         setColor(p.index, LXColor.gray(map
////                   (abs( (p.x+p.y)+a/(p.x+p.y)  - tcr.diamonds[i].centrePoint[0]), 
////                   (tcr.diamonds[i].xMin + tcr.diamonds[i].yMin)/a  , 
////                   (tcr.diamonds[i].xMax + tcr.diamonds[i].yMax)/a, 
////                   0,
////                   255) ));
////       }

////    else {setColor(p.index,#000000);}


//// }
//// }

////  //mem panels , s2
    
////    for(int i = 0; i<3; i++){
  
   
////      for  (LXPoint p : tcr.mem_panels[i].getPoints()) {
       
////        if( 
      
////        (sqrt ( pow(abs( p.x  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.mem_panels[i].centrePoint[2]), 2))>= ((s2P * r2  )) &&
               
////        (sqrt ( pow(abs( p.x  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.mem_panels[i].centrePoint[2]), 2))<=(s2P  *(r2 + s2t))
////        )
////        ))
   
      
////        {
         
////            setColor(p.index, LXColor.gray(
////                 map(sqrt ( pow(abs(i*p.x+a/pow(d,2)  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                            pow(abs(i*p.y+a/pow(d,2)  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                            pow(abs(i*p.z+a/pow(d,2)  - tcr.mem_panels[i].centrePoint[2]), 2) ), 
                           
////                    (sqrt ( pow(abs( tcr.mem_panels[i].xMin  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                            pow(abs( tcr.mem_panels[i].yMin  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                            pow(abs( tcr.mem_panels[i].zMin  - tcr.mem_panels[i].centrePoint[2]), 2) )), 
                           
////                    (sqrt ( pow(abs( tcr.mem_panels[i].xMax  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                            pow(abs( tcr.mem_panels[i].yMax  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                            pow(abs( tcr.mem_panels[i].zMax  - tcr.mem_panels[i].centrePoint[2]), 2) ))  , 0,255)  
////                 ));}

////    else {setColor(p.index,#000000);}
   
////     }
    
////    }
   
////     for(int i = 3; i<6; i++){
 
////      for  (LXPoint p : tcr.mem_panels[i].getPoints()) {
       
////        if( 
      
////        (sqrt ( pow(abs( p.x  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.mem_panels[i].centrePoint[2]), 2))>= ((s2P ) * r2) ) &&
               
////        (sqrt ( pow(abs( p.x  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.mem_panels[i].centrePoint[2]), 2))<=((s2P ) *(r2 + s2t)))
////        )

      
////        {
         
////        setColor(p.index, LXColor.gray(map(sqrt
////              ( pow(abs(i*p.x+a/pow(d,2)  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs(i*p.y+a/pow(d,2)  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs(i*p.z+a/pow(d,2) - tcr.mem_panels[i].centrePoint[2]),2) ),
               
////          (sqrt(pow(abs( tcr.mem_panels[i].xMin  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( tcr.mem_panels[i].yMin  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( tcr.mem_panels[i].zMin  - tcr.mem_panels[i].centrePoint[2]), 2) )), 
////          (sqrt(pow(abs( tcr.mem_panels[i].xMax  - tcr.mem_panels[i].centrePoint[0]), 2) + 
////                pow(abs( tcr.mem_panels[i].yMax  - tcr.mem_panels[i].centrePoint[1]), 2) + 
////                pow(abs( tcr.mem_panels[i].zMax  - tcr.mem_panels[i].centrePoint[2]), 2) )),0,255)  
////             ));}
  

////    else {setColor(p.index,#000000);}
   
////     }
    
////    }
   
 
////   /////floor, s3
////     for  (LXPoint p : tcr.floor.getPoints()) {
 
 
////        if(floorswitch == true){
////               setColor(p.index, LXColor.gray(map( p.x*(s3P)/(s3t/(p.y+0.00001))  , tcr.floor.xMin  , tcr.floor.xMax  , 0,255) ));
////             }

////        else 
////        {
////         //circle 1
////         if((sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )>= s3P*r3 ) &&
////         (   sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )<=((s3P *r3)+s3t)) ){
              
      
////                    setColor(p.index, LXColor.gray( (map(pow(p.x+p.y,2),model.yMin,model.yMax,0,255))));
                                           
////         }
////         ////circle 2
////         else if((sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )>=s3P*r3 )&&
////         (        sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )<= ((s3P*r3) + s3t)) ){
////           //setColor(p.index, LXColor.gray(#D216E8  ));
          
////                            setColor(p.index, LXColor.gray( (map(pow(p.x+p.y,2),model.yMin,model.yMax,0,255))));

////         }
////         ///circle 3
////         else if((sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )>=s3P*r3 )&&
////         (        sqrt (pow(abs( p.x  - tcr.floor.centrePoint[0]), 2)+ pow(abs( p.y  - tcr.floor.centrePoint[1]), 2) )<= ((s3P*r3) + s3t)) ){
////           //setColor(p.index, LXColor.gray(#A8E816  ));
////                              setColor(p.index, LXColor.gray( 255));

////         }
////         else {setColor(p.index, LXColor.gray( 0));}

////       }

////   //else {setColor(p.index,#000000);}


////     }




//// //wings, s4
////   for  (LXPoint p : tcr.leftwing.getPoints()) {
      
     
////   if( 
////        (sqrt ( pow(abs( p.x  - tcr.leftwing.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.leftwing.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.leftwing.centrePoint[2]), 2) )>= (s4P * r4) ) &&
////        (sqrt ( pow(abs( p.x  - tcr.leftwing.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.leftwing.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.leftwing.centrePoint[2]), 2) )<= (s4P *(r4+s4t)
////       ))){
        
////                 setColor(p.index, LXColor.gray(
////                 map(sqrt ( pow(abs( p.x +a/(p.x+p.y)  - tcr.leftwing.centrePoint[0]), 2) + 
////                            pow(abs( p.y +a/(p.y)  - tcr.leftwing.centrePoint[1]), 2) + 
////                            pow(abs( p.z +a/(p.z)  - tcr.leftwing.centrePoint[2]), 2) ), 
                           
////                           (sqrt ( pow(abs( tcr.leftwing.xMin  - tcr.leftwing.centrePoint[0]), 2) + 
////                                   pow(abs( tcr.leftwing.yMin  - tcr.leftwing.centrePoint[1]), 2) + 
////                                   pow(abs( tcr.leftwing.zMin  - tcr.leftwing.centrePoint[2]), 2) ))  , 
////                           (sqrt ( pow(abs( tcr.leftwing.xMax  - tcr.leftwing.centrePoint[0]), 2) + 
////                                   pow(abs( tcr.leftwing.yMax  - tcr.leftwing.centrePoint[1]), 2) + 
////                                   pow(abs( tcr.leftwing.zMax  - tcr.leftwing.centrePoint[2]), 2) ))  , 255,0)  
////                 ));

////       }
////        else {setColor(p.index,#000000);}
   


//// }

////   for  (LXPoint p : tcr.rightwing.getPoints()) {
      
     
////   if( 
////        (sqrt ( pow(abs( p.x  - tcr.rightwing.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.rightwing.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.rightwing.centrePoint[2]), 2))>= (s4P * r4) ) &&
////        (sqrt ( pow(abs( p.x  - tcr.rightwing.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.rightwing.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.rightwing.centrePoint[2]), 2))<=(s4P *(r4+s4t)
////       ))){
        
////         setColor(p.index, LXColor.gray(map (sqrt ( pow(abs( p.x  - tcr.rightwing.centrePoint[0]), 2) + 
////                                                    pow(abs( p.y  - tcr.rightwing.centrePoint[1]), 2) + 
////                                                    pow(abs( p.z  - tcr.rightwing.centrePoint[2]), 2) ), 
                                                   
////                                             (sqrt ( pow(abs( tcr.leftwing.xMin  - tcr.rightwing.centrePoint[0]), 2) + 
////                                                     pow(abs( tcr.rightwing.yMin  - tcr.rightwing.centrePoint[1]), 2) + 
////                                                     pow(abs( tcr.rightwing.zMin  - tcr.rightwing.centrePoint[2]), 2) )), 
////                                             (sqrt ( pow(abs( tcr.leftwing.xMax  - tcr.leftwing.centrePoint[0]), 2) + 
////                                                     pow(abs( tcr.leftwing.yMax  - tcr.leftwing.centrePoint[1]), 2) + 
////                                                     pow(abs( tcr.leftwing.zMax  - tcr.leftwing.centrePoint[2]), 2) )), 0,255) ));

               

   
////       }
      
////        else {setColor(p.index,#000000);}

//// }


//// ///djbooth, s5
////   for  (LXPoint p : tcr.djbooth.getPoints()) {
////       if( 
////        (sqrt ( pow(abs( p.x  - tcr.djbooth.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.djbooth.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.djbooth.centrePoint[2]), 2))>= (s5P * r5) ) &&
////        (sqrt ( pow(abs( p.x  - tcr.djbooth.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.djbooth.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.djbooth.centrePoint[2]), 2))<=(s5P *(r5+s5t)
////       ))){
////      setColor(p.index, LXColor.gray(
////                 map(sqrt ( pow(abs( p.x +a/(c*b)  - tcr.djbooth.centrePoint[0]), 2) + 
////                            pow(abs( p.y +a/(c*b) - tcr.djbooth.centrePoint[1]), 2) + 
////                            pow(abs( p.z +a/(c*b) - tcr.djbooth.centrePoint[2]), 2) ), 
                           
////                    (sqrt ( pow(abs( tcr.djbooth.xMin  - tcr.djbooth.centrePoint[0]), 2) + 
////                            pow(abs( tcr.djbooth.yMin  - tcr.djbooth.centrePoint[1]), 2) + 
////                            pow(abs( tcr.djbooth.zMin  - tcr.djbooth.centrePoint[2]), 2) )), 
////                    (sqrt ( pow(abs( tcr.djbooth.xMax  - tcr.djbooth.centrePoint[0]), 2) + 
////                            pow(abs( tcr.djbooth.yMax  - tcr.djbooth.centrePoint[1]), 2) + 
////                            pow(abs( tcr.djbooth.zMax  - tcr.djbooth.centrePoint[2]), 2) ))  , 0,255)  
////                 ));

    
////       }
////    else {setColor(p.index,#000000);}


//// }
//// //chandelier, s6
////   for  (LXPoint p : tcr.chandelier.getPoints()) {
    
////     if( 
    
////     //sphere option, quite uneventful
////        (sqrt ( pow(abs( p.x  - tcr.chandelier.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.chandelier.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.chandelier.centrePoint[2]), 2))>= (s6P * r6) ) &&
////        (sqrt ( pow(abs( p.x  - tcr.chandelier.centrePoint[0]), 2) + 
////                pow(abs( p.y  - tcr.chandelier.centrePoint[1]), 2) + 
////                pow(abs( p.z  - tcr.chandelier.centrePoint[2]), 2))<= (s6P *(r6+s6t)
////       )))
      
      
////       {

////                setColor(p.index, LXColor.gray(
////                 map(sqrt ( pow(abs( p.x + pow(a,2)/(c*b) - tcr.chandelier.centrePoint[0]), 2) + 
////                            pow(abs( p.y + +pow(a,2)/(c*b) - tcr.chandelier.centrePoint[1]), 2) + 
////                            pow(abs( p.z + +pow(a,2)/(c*b) - tcr.chandelier.centrePoint[2]), 2) ), 
                           
////                    (sqrt ( pow(abs( tcr.chandelier.xMin  - tcr.chandelier.centrePoint[0]), 2) + 
////                            pow(abs( tcr.chandelier.yMin  - tcr.chandelier.centrePoint[1]), 2) + 
////                            pow(abs( tcr.chandelier.zMin  - tcr.chandelier.centrePoint[2]), 2) )), 
////                    (sqrt ( pow(abs( tcr.chandelier.xMax  - tcr.chandelier.centrePoint[0]), 2) + 
////                            pow(abs( tcr.chandelier.yMax  - tcr.chandelier.centrePoint[1]), 2) + 
////                            pow(abs( tcr.chandelier.zMax  - tcr.chandelier.centrePoint[2]), 2) ))  , 0,255)  
////                 ));
////       }
////       else {setColor(p.index,#000000);}
//// }

//// }

//// }
////this pattern has rings rotating in opposite ways, localized to panels (first attempt at isolating panels groups), with (parameter 2)
////controlling rotation of rings on a group of panels. to generalize to select groups
//public class SequencerMultiPanelConstrained extends BlendPattern {
//    CompoundParameter parameter1 = new CompoundParameter("likelihood of adding ring to layer",1,0,80); //80 = 80%, 0 = 0%  reduced to 80 cause 100 is just too much in my opinion (rings always full)
//    CompoundParameter parameter2 = new CompoundParameter("p2",1,1,6); //correlation between panels patterns, 1== panels all the same, 6 == visible differences (a bit backwards but it works)
//    CompoundParameter parameter3 = new CompoundParameter("p3",1,1,6);
//    CompoundParameter parameter4 = new CompoundParameter("p4",1,1,6);
//    CompoundParameter parameter5 = new CompoundParameter("p5",1,1,6);  //currently 5 needs to be more than 1 for other parameters (p1..p4) to have an effect
//    CompoundParameter parameter6 = new CompoundParameter("p6",1,1,6);
//    CompoundParameter parameter7 = new CompoundParameter("p7",1,1,6); //correlation between panels patterns, 1== panels all the same, 6 == visible differences (a bit backwards but it works)
//    CompoundParameter parameter8 = new CompoundParameter("p8",1,1,6);
//    CompoundParameter parameter9 = new CompoundParameter("p9",1,1,6);
//    CompoundParameter parameter10= new CompoundParameter("p10",1,1,6);  //currently 5 needs to be more than 1 for other parameters (p1..p4) to have an effect
//    CompoundParameter parameter11= new CompoundParameter("p11",1,1,6);
//    CompoundParameter parameter12= new CompoundParameter("p12",1,1,6);


//    // this is franco's memory
//    //ring has to have a pastvalue mod and rot to appear like it is rotating
//    protected ArrayList<LXPoint>  pointsMemory = new ArrayList<LXPoint>(); //pointsMemory 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//    protected ArrayList<Integer>  symmetryParameters = new ArrayList<Integer>(Collections.nCopies(10, 0));  //symmetry parameters, still to implement
    
    
//    public SequencerMultiPanelConstrained(LX lx) {
//        super(lx);
//        addParameter("p1", this.parameter1);
//        addParameter("p2", this.parameter2); 
//        addParameter("p3", this.parameter3); 
//        addParameter("p4", this.parameter4); 
//        addParameter("p5", this.parameter5); 
//        addParameter("p6", this.parameter6); 
//        addParameter("p7", this.parameter7);
//        addParameter("p8", this.parameter8); 
//        addParameter("p9", this.parameter9); 
//        addParameter("p10", this.parameter10); 
//        addParameter("p11", this.parameter11); 
//        addParameter("p12", this.parameter12);


//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        ArrayList<LXPoint>  pM = this.pointsMemory;
//        ArrayList<Integer>  sP = this.symmetryParameters;
        
//        // ArrayList<Integer> arr=new ArrayList<Integer>(Collections.nCopies(10, 0));
//        for(int i=0;i<60;++i){
//            layers.put(i, new FLSPanel2(lx, SequencerMultiPanelConstrained.this,i,i*333, 
//                                        parameter1,parameter2,parameter3,
//                                        parameter4,parameter5,parameter6,
//                                        parameter7,parameter8,parameter9,
//                                        parameter10,parameter11,parameter12, pM, sP));
//        }
//        instantiate();
//    }
//    public String proofOfLife(){
//        return "This works";
//    }   
//}

//protected class FLSPanel2 extends FadeLayer{

//    protected SequencerMultiPanelConstrained new_pattern;
//    CompoundParameter parameter1;
//    CompoundParameter parameter2;
//    CompoundParameter parameter3;
//    CompoundParameter parameter4;
//    CompoundParameter parameter5;
//    CompoundParameter parameter6;
//    CompoundParameter parameter7;
//    CompoundParameter parameter8;
//    CompoundParameter parameter9;
//    CompoundParameter parameter10;
//    CompoundParameter parameter11;
//    CompoundParameter parameter12;


//    ArrayList<LXPoint> localPoints;
//    ArrayList<Integer> localSymNumbers;         

//    //Leroy's probabilityFadeLayer
//    private int activeRings;

//    private FLSPanel2(LX lx, SequencerMultiPanelConstrained pattern, int layer_num, int delay, 
//                        CompoundParameter p1, CompoundParameter p2, CompoundParameter p3, 
//                        CompoundParameter p4, CompoundParameter p5, CompoundParameter p6, 
//                        CompoundParameter p7, CompoundParameter p8, CompoundParameter p9,
//                        CompoundParameter p10, CompoundParameter p11, CompoundParameter p12,
                        
                        
//                         ArrayList<LXPoint> pM, ArrayList<Integer> sP ){
//        super(lx,pattern,layer_num,delay);
//        this.new_pattern = pattern;
//        //this is where extra parameters are added
//        this.parameter1 = p1;
//        this.parameter2 = p2;
//        this.parameter3 = p3;
//        this.parameter4 = p4;
//        this.parameter5 = p5;
//        this.parameter6 = p6;
//        this.parameter7 = p7;
//        this.parameter8 = p8;
//        this.parameter9 = p9;
//        this.parameter10 = p10;
//        this.parameter11= p11;
//        this.parameter12= p12;


//        this.activeRings = 0;
//        this.localPoints = pM;
//        this.localSymNumbers = sP;
//    }

//    protected void generateTarget(){ //this method generates the set of points
//            this.target.addAll(model.getPoints());
//            //p1 = likelihood to add ring to layer
//            float p1=0;
//            int n = 0;
//                try{
//                    p1 = this.parameter1.getValuef();
//                    n =  this.getLayerNum();
//                }catch(NullPointerException e){}   
            
//                this.target.addAll(model.getPoints());
//                    target = new ArrayList<LXPoint>();

//                for(int ring = 0;ring < 5; ++ring){
//                    if(random(0,100)<(p1)){
//                        addTargetRing(ring);
//                    }
//                }  
//            activeRings = 0;
//    }

//    private void addTargetRing(int ring){
//        int mod;
//        int rot;

//        //p1 being used in generateTarget()
//        float p2 = 1;
//        float p3 = 1;
//        float p4 = 1;
//        float p5 = 1;
//        float p6 = 1;
//        float p7 = 1;
//        float p8 = 1;
//        float p9 = 1;
//        float p10 = 1;
//        float p11 = 1;
//        float p12 = 1;

//        try{
//            p2 = this.parameter2.getValuef();//center
//            p3 = this.parameter3.getValuef();
//            p4 = this.parameter4.getValuef();//----------------
//            p5 = this.parameter5.getValuef();//mid 
//            p6 = this.parameter6.getValuef();
//            p7 = this.parameter7.getValuef();//----------------
//            p8 = this.parameter8.getValuef();//outer
//            p9 = this.parameter9.getValuef();
//            p10 = this.parameter10.getValuef();//--------
//            p11 = this.parameter11.getValuef();
//            p12 = this.parameter12.getValuef();
//        }
//        catch(NullPointerException e){}

//        //center panels ring
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();      
//        for(MEMPanel mp : tcr.vivid.getSymmetricPanels(0,1,0)){
//            //add parameter, swap modulo addressing
//                mod = (ring%p2==0)?(int)p2:(int)p3;           
//                rot = (ring%p12==0)?map(this.getLayerNum(), 1,60, 1,p4):map(this.getLayerNum(),1,60 ,p4, 1);                    
//                temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//                )); 
//        }

//        //mid panels ring        
//        for(MEMPanel mp : tcr.vivid.getSymmetricPanels(1,(int)p5,(int)p11)){ //add rotation to mid ring panel array
//                mod = (ring%p5==0)?(int)p5:(int)p6;     
//                rot = (ring%p10==0)?map(this.getLayerNum(), 1,60, 1,p7):map(this.getLayerNum(),1, 60, p7, 1);                        
//                temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            ));
//        }          
        
//        //external panels ring
//        for(MEMPanel mp : tcr.vivid.getSymmetricPanels(2,1,0)){
//                mod = (ring%p8==0)?(int)p3:(int)p2;                  
//                rot = (ring%p12==0)?map(this.getLayerNum(), 1,60, p10,1):map(this.getLayerNum(),1, 60,1, p10) ;                    
//                temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            )); 
//        }           

          
        
//        this.target.addAll(temp);
//        activeRings++;
//        }
        

//        //map functioon
//        private int map(double x, double in_min, double in_max, double out_min, double out_max) {
//        return (int)((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min);
//        }

//}
////this pattern has rings rotating in opposite ways, localized to panels (first attempt at isolating panels groups), with (parameter 2)
////controlling rotation of rings on a group of panels. to generalize to select groups
//public class SequencerPanelConstrained extends BlendPattern {
//    CompoundParameter parameter1 = new CompoundParameter("likelihood of adding ring to layer",1,0,100.0); //100 = 100%, 0 = 0%
//    CompoundParameter parameter2 = new CompoundParameter("rotation",1,1,6);
//    // this is franco's memory
//    //ring has to have a pastvalue mod and rot to appear like it is rotating
//    protected ArrayList<LXPoint>  pointsMemory = new ArrayList<LXPoint>(); //pointsMemory 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        protected ArrayList<Integer>  symmetryParameters = new ArrayList<Integer>(Collections.nCopies(10, 0));  //symmetry parameters
    
    
//    public SequencerPanelConstrained(LX lx) {
//        super(lx);
//        addParameter("p1", this.parameter1);
//        addParameter("p2", this.parameter2); 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        ArrayList<LXPoint>  pM = this.pointsMemory;
//        ArrayList<Integer>  sP = this.symmetryParameters;
        
//        // ArrayList<Integer> arr=new ArrayList<Integer>(Collections.nCopies(10, 0));
//        for(int i=0;i<6;++i){
//            layers.put(i, new FLSPanel(lx, SequencerPanelConstrained.this, i,i*333, parameter1, parameter2, pM, sP));
//        }
//        instantiate();
//    }
//    public String proofOfLife(){
//        return "This works";
//    }   
//}

//protected class FLSPanel extends FadeLayer{

//    protected SequencerPanelConstrained new_pattern;
//    CompoundParameter parameter1;
//    CompoundParameter parameter2;
//    ArrayList<LXPoint> localPoints;
//    ArrayList<Integer> localSymNumbers;         

//    //Leroy's probabilityFadeLayer
//    private int activeRings;

//    private FLSPanel(LX lx, SequencerPanelConstrained pattern, int layer_num, int delay, CompoundParameter p1, CompoundParameter p2, ArrayList<LXPoint> pM, ArrayList<Integer> sP ){
//        super(lx,pattern,layer_num,delay);
//        this.new_pattern = pattern;
//        //this is where extra parameters are added
//        this.parameter1 = p1;
//        this.parameter2 = p2;
//        this.activeRings = 0;
//        this.localPoints = pM;
//        this.localSymNumbers = sP;
//    }

//    protected void generateTarget(){ //this method generates the set of points
//            this.target.addAll(model.getPoints());
//            float p1=0;
//            float p2=0;
//            int n = 0;
//            int access =0;
//            String pol = "";
//                try{
//                    p1 = this.parameter1.getValuef();
//                    p2 = this.parameter2.getValuef();
//                    n =  this.getLayerNum();
//                }catch(NullPointerException e){}   
            
//                this.target.addAll(model.getPoints());
//                    target = new ArrayList<LXPoint>();

//                for(int ring = 0;ring < 5; ++ring){
//                    if(random(0,100)<(p1)){
//                        addTargetRing(ring);
//                    }
//                }  
//            activeRings = 0;
//    }

//    private void addTargetRing(int ring){
//        int mod;
//        int rot;

//        mod = (ring==0||ring==4)?3:4;
        
//        //rot = (int)random(1,6);

        
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();      
//        //for(MEMPanel mp : tcr.mem_panels){
//        for(int i = 0; i<4; i++){
//            MEMPanel mp = tcr.mem_panels[i];
//            if(i % 2 ==0){
//                if( this.getLayerNum() == 0){
//                //generate points and save them to memory
//                rot = 0;
//                }
//                else{ //assign rot  of some rings mapping layerNumber to 1,6
//                    rot = (ring%2==0)?map(this.getLayerNum(), 1,60, 1,6):map(this.getLayerNum(),1, 60,6, 1) ;
//                    //rot = map(this.getLayerNum(), 1,60, 1,6);
//                    //println(this.getLayerNum());
//                }
//            temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            ));         
//            }
//            else{
//                if( this.getLayerNum() == 0){
//            //generate points and save them to memory
//                rot = 0;
//                }
//                else{ //assign rot  of some rings mapping layerNumber to 1,6
//                    //rot = (ring%2==0)?map(this.getLayerNum(), 1,60, 6,1):map(this.getLayerNum(),1, 60,1, 6) ;
//                    //rot = map(this.getLayerNum(), 1,60, 1,6);
//                    //println((int)this.parameter2.getValuef());
//                    rot = (int)this.parameter2.getValuef();

//                    //println(this.getLayerNum());
//                }
//                temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            ));

//            }   
//        }    
        
//        this.target.addAll(temp);
//        activeRings++;
//        }
        

//        //map functioon
//        private int map(double x, double in_min, double in_max, double out_min, double out_max) {
//        return (int)((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min);
//        }

//}

/////________________________________________________________________________________________________________________________________________________
////this pattern has rings rotating in opposite ways, might be hard to see on lxstudio visual representation, to try on real panels 
//public class StaticSequencer extends BlendPattern {
//    CompoundParameter parameter1 = new CompoundParameter("likelihood of adding ring to layer",1,0,100.0); //100 = 100%, 0 = 0%
//    CompoundParameter parameter2 = new CompoundParameter("difference between rings",1,1,6);
//    // this is franco's memory
//    //ring has to have a pastvalue mod and rot to appear like it is rotating
//    protected ArrayList<LXPoint>  pointsMemory = new ArrayList<LXPoint>(); //pointsMemory 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        protected ArrayList<Integer>  symmetryParameters = new ArrayList<Integer>(Collections.nCopies(10, 0));  //symmetry parameters
    
    
//    public StaticSequencer(LX lx) {
//        super(lx);
//        addParameter("p1", this.parameter1);
//        addParameter("p2", this.parameter2); 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        ArrayList<LXPoint>  pM = this.pointsMemory;
//        ArrayList<Integer>  sP = this.symmetryParameters;
        
//        // ArrayList<Integer> arr=new ArrayList<Integer>(Collections.nCopies(10, 0));
//        for(int i=0;i<60;++i){
//            layers.put(i, new FadeLayerSequential(lx, StaticSequencer.this, i,i*333, parameter1, parameter2, pM, sP));
//        }
//        instantiate();
//    }
//    public String proofOfLife(){
//        return "This works";
//    }   
//}
//protected class FadeLayerSequential extends FadeLayer{

//    protected StaticSequencer new_pattern;
//    CompoundParameter parameter1;
//    CompoundParameter parameter2;
//    ArrayList<LXPoint> localPoints;
//    ArrayList<Integer> localSymNumbers;         

//    //Leroy's probabilityFadeLayer
//    private int activeRings;

//    private FadeLayerSequential(LX lx, StaticSequencer pattern, int layer_num, int delay, CompoundParameter p1, CompoundParameter p2, ArrayList<LXPoint> pM, ArrayList<Integer> sP ){
//        super(lx,pattern,layer_num,delay);
//        this.new_pattern = pattern;
//        //this is where extra parameters are added
//        this.parameter1 = p1;
//        this.parameter2 = p2;
//        this.activeRings = 0;
//        this.localPoints = pM;
//        this.localSymNumbers = sP;
//    }

//    protected void generateTarget(){ //this method generates the set of points
//            this.target.addAll(model.getPoints());
//            float p1=0;
//            float p2=0;
//            int n = 0;
//            int access =0;
//            String pol = "";
//                try{
//                    p1 = this.parameter1.getValuef();
//                    p2 = this.parameter2.getValuef();
//                    n =  this.getLayerNum();
//                }catch(NullPointerException e){}   
            
//                this.target.addAll(model.getPoints());
//                    target = new ArrayList<LXPoint>();

//                for(int ring = 0;ring < 5; ++ring){
//                    if(random(0,100)<(p1)){
//                        addTargetRing(ring);
//                    }
//                }  
//            activeRings = 0;
//    }

//    private void addTargetRing(int ring){
//        int mod;
//        int rot;

//        mod = (ring==0||ring==4)?3:3;
        
//        //rot = (int)random(1,6);

//        if( this.getLayerNum() == 0){
//            //generate points and save them to memory
//            rot = 0;
//            }
//        else{ //assign rot  of some rings mapping layerNumber to 1,6
//            rot = (ring%2==0)?map(this.getLayerNum(), 1,60, 1,6):map(this.getLayerNum(),1, 60,6, 1) ;
//            //rot = map(this.getLayerNum(), 1,60, 1,6);
//            //println(this.getLayerNum());
//        }
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();      
//        // for(MEMPanel mp : tcr.mem_panels){
//        //     temp.addAll(mp.getSymmetricPoints(
//        //         ring,
//        //         mod,
//        //         rot
//        //     ));         
//        // }  
//          for(MEMPanel mp : tcr.vivid.getSymmetricPanels(1,1,0)){
//            temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            ));         
//        }
        
//        // for(MEMPanel mp : tcr.vivid.getSymmetricPanels(1,2,0)){
//        //    temp.addAll(mp.getSymmetricPoints(
//        //        ring,
//        //        mod,
//        //        rot
//        //    ));         
//        //}
        
//        this.target.addAll(temp);
//        activeRings++;
//        }
        

//        //map functioon
//        private int map(double x, double in_min, double in_max, double out_min, double out_max) {
//        return (int)((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min);
//        }

//}

/////Franco  takes some parameters and passes them to a bunch of FadelayerEG666 objects it initializes, in this case fadeLayerEG
//public class Franco extends BlendPattern {
//    CompoundParameter parameter1 = new CompoundParameter("likelihood of adding ring to layer",1,0,100.0); //100 = 100%, 0 = 0%
//    CompoundParameter parameter2 = new CompoundParameter("difference between rings",1,1,6);
//    // this is franco's memory
//    //ring has to have a pastvalue mod and rot to appear like it is rotating
//    protected ArrayList<LXPoint>  pointsMemory = new ArrayList<LXPoint>(); //pointsMemory 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        protected ArrayList<Integer>  symmetryParameters = new ArrayList<Integer>(Collections.nCopies(10, 0));  //symmetry parameters
    
    
//    public Franco(LX lx) {
//        super(lx);
//        addParameter("p1", this.parameter1);
//        addParameter("p2", this.parameter2); 
//        //rot and mod of the ring we want to rotate (for all mem panels!! thsi willbe key to manipulate groups in rings) are saved to this data structure
//        ArrayList<LXPoint>  pM = this.pointsMemory;
//        ArrayList<Integer>  sP = this.symmetryParameters;
        
//        // ArrayList<Integer> arr=new ArrayList<Integer>(Collections.nCopies(10, 0));
//        for(int i=0;i<60;++i){
//            layers.put(i, new FadeLayerEG666(lx, Franco.this, i,i*333, parameter1, parameter2, pM, sP));
//        }
//        instantiate();
//    }
//    public String proofOfLife(){
//        return "This works";
//    }   
//}
////a fadelayerEG is a set of points on all MemPanels
//protected class FadeLayerEG666 extends FadeLayer{

//    protected Franco new_pattern;
//    CompoundParameter parameter1;
//    CompoundParameter parameter2;
//    ArrayList<LXPoint> localPoints;
//    ArrayList<Integer> localSymNumbers;         

//    //Leroy's probabilityFadeLayer
//    private int activeRings;

//    private FadeLayerEG666(LX lx, Franco pattern, int layer_num, int delay, CompoundParameter p1, CompoundParameter p2, ArrayList<LXPoint> pM, ArrayList<Integer> sP ){
//        super(lx,pattern,layer_num,delay);
//        this.new_pattern = pattern;
//        //this is where extra parameters are added
//        this.parameter1 = p1;
//        this.parameter2 = p2;
//        this.activeRings = 0;
//        this.localPoints = pM;
//        this.localSymNumbers = sP;
//    }

//    protected void generateTarget(){ //this method generates the set of points
//        this.target.addAll(model.getPoints());
//            float p1=0;
//            float p2=0;
//            int n = 0;
//            int access =0;
//            String pol = "";
//            try{
//                p1 = this.parameter1.getValuef();
//                p2 = this.parameter2.getValuef();
//                n =  this.getLayerNum();
//            }catch(NullPointerException e){}   
         
//    this.target.addAll(model.getPoints());
//        target = new ArrayList<LXPoint>();

//    for(int ring = 0;ring < 6; ++ring){
//        if(random(0,100)<(p1)){
//            addTargetRing(ring);
//        }
//    }  
//    activeRings = 0;
//    }

//    private void addTargetRing(int ring){
//        int mod;
//        int rot;
       
//        mod = (ring==0||ring==4)?(int)random(0,3):(int)random(0,5);
//        if(mod==0){
//            return;
//        }
//        if(mod==5){
//            mod=6;
//        }
//        rot = (int)random(1,6);
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();
//        //TODO: Parameterise to create different symmetries for different subsets of panels
//            //added parametrised randomness to make each ring different. currently quite randomized, 
//            //change  parameter2 to 6 to make panels completely different, 1 all equal. ideally I'd parametrize 
//            //to select number and affect groups of panels programmatically
//            /*
//            Syntax:

//            for (type var : array) 
//            { 
//                statements using var;
//            }
//            is equivalent to:

//            for (int i=0; i<arr.length; i++) 
//            { 
//                type var = arr[i];
//                statements using var;
//            }
//            */
//            for(MEMPanel mp : tcr.mem_panels){
//                if(random(1,6) >this.parameter2.getValuef()){
//                temp.addAll(mp.getSymmetricPoints(
//                    ring,
//                    mod,
//                    rot
//                ));
//                }
//            else{
//                temp.addAll(mp.getSymmetricPoints(
//                ring,
//                (ring==0||ring==4)?(int)random(0,3):(int)random(0,5),
//                (int)random(1,6)
//            ));
//            }
//        }
        
//        this.target.addAll(temp);
//        activeRings++;
//        }

//}