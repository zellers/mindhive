//import heronarts.lx.LX;
//import heronarts.lx.LXPattern;
//import heronarts.lx.modulator.SawLFO;
//import heronarts.lx.parameter.CompoundParameter;
//import heronarts.lx.parameter.FunctionalParameter;

//public class MEMTest extends LXPattern{
//    public final CompoundParameter m0 = 
//                new CompoundParameter("Ring 0 mod", 1,1,5);
//    public final CompoundParameter r0 = 
//                new CompoundParameter("Ring 0 rot", 0,11);

//    public final CompoundParameter m1 = 
//                new CompoundParameter("Ring 1 mod", 1,1,5);
//    public final CompoundParameter r1 = 
//                new CompoundParameter("Ring 1 rot", 0,11);

//    public final CompoundParameter m2 = 
//                new CompoundParameter("Ring 2 mod", 1,1,5);
//    public final CompoundParameter r2 = 
//                new CompoundParameter("Ring 2 rot", 0,11);

//    public final CompoundParameter m3 = 
//                new CompoundParameter("Ring 3 mod", 1,1,5);
//    public final CompoundParameter r3 = 
//                new CompoundParameter("Ring 3 rot", 0,11);

//    public final CompoundParameter m4 = 
//                new CompoundParameter("Ring 4 mod", 1,1,5);
//    public final CompoundParameter r4 = 
//                new CompoundParameter("Ring 4 rot", 0,11);


//    public MEMTest(LX lx){
//        super(lx);

//        addParameter("Ring 0 mod", this.m0);
//        addParameter("Ring 0 rot", this.r0);
//        addParameter("Ring 1 mod", this.m1);
//        addParameter("Ring 1 rot", this.r1);
//        addParameter("Ring 2 mod", this.m2);
//        addParameter("Ring 2 rot", this.r2);
//        addParameter("Ring 3 mod", this.m3);
//        addParameter("Ring 3 rot", this.r3);
//        addParameter("Ring 4 mod", this.m4);
//        addParameter("Ring 4 rot", this.r4);

//    }

//    public void run(double deltaMs){
//        double m0 = this.m0.getValue();
//        double r0 = this.r0.getValue();
//        double m1 = this.m1.getValue();
//        double r1 = this.r1.getValue();
//        double m2 = this.m2.getValue();
//        double r2 = this.r2.getValue();
//        double m3 = this.m3.getValue();
//        double r3 = this.r3.getValue();
//        double m4 = this.m4.getValue();
//        double r4 = this.r4.getValue();

//        int m0a = (int)Math.floor(m0);
//        int r0a = (int)Math.floor(r0);
//        int m1a = (int)Math.floor(m1);
//        int r1a = (int)Math.floor(r1);
//        int m2a = (int)Math.floor(m2);
//        int r2a = (int)Math.floor(r2);
//        int m3a = (int)Math.floor(m3);
//        int r3a = (int)Math.floor(r3);
//        int m4a = (int)Math.floor(m4);
//        int r4a = (int)Math.floor(r4);

//        int m0b = (int)Math.ceil(m0);
//        int r0b = (int)Math.ceil(r0);
//        int m1b = (int)Math.ceil(m1);
//        int r1b = (int)Math.ceil(r1);
//        int m2b = (int)Math.ceil(m2);
//        int r2b = (int)Math.ceil(r2);
//        int m3b = (int)Math.ceil(m3);
//        int r3b = (int)Math.ceil(r3);
//        int m4b = (int)Math.ceil(m4);
//        int r4b = (int)Math.ceil(r4);

//        if(m0a==5){
//            m0a=6;
//        }
//        if(m1a==5){
//            m1a=6;
//        }
//        if(m2a==5){
//            m2a=6;
//        }
//        if(m3a==5){
//            m3a=6;
//        }
//        if(m4a==5){
//            m4a=6;
//        }

//        if(m0b==5){
//            m0b=6;
//        }
//        if(m1b==5){
//            m1b=6;
//        }
//        if(m2b==5){
//            m2b=6;
//        }
//        if(m3b==5){
//            m3b=6;
//        }
//        if(m4b==5){
//            m4b=6;
//        }

////init brightness map 
//        HashMap<Integer, Double> brightness = new HashMap<Integer, Double>();

//        brightness.put(0, net_brightness(m0,r0));
//        brightness.put(1, net_brightness(m1,r1));
//        brightness.put(2, net_brightness(m2,r2));
//        brightness.put(3, net_brightness(m3,r3));
//        brightness.put(4, net_brightness(m4,r4));

////init points_a/points_b
//        HashMap<Integer, ArrayList<LXPoint>> points_a = new HashMap<Integer, ArrayList<LXPoint>>();
//        HashMap<Integer, ArrayList<LXPoint>> points_b = new HashMap<Integer, ArrayList<LXPoint>>();

//        for(int i=0;i<5;++i){
//            points_a.put(i, new ArrayList<LXPoint>());
//            points_b.put(i, new ArrayList<LXPoint>());
//        }
//// end of init

//// reset the panel
//        for(LXPoint p : model.points){
//            colors[p.index] = 0xFFFFFF;
//        }

////get the symmetric points from the panels and store them in pointsa/pointsb
//        for(MEMPanel mp : tcr.mem_panels){

//            points_a.get(0).addAll(mp.getSymmetricPoints(0,m0a,r0a));
//            points_a.get(1).addAll(mp.getSymmetricPoints(1,m1a,r1a));
//            points_a.get(2).addAll(mp.getSymmetricPoints(2,m2a,r2a));
//            points_a.get(3).addAll(mp.getSymmetricPoints(3,m3a,r3a));
//            points_a.get(4).addAll(mp.getSymmetricPoints(4,m4a,r4a));

//            points_b.get(0).addAll(mp.getSymmetricPoints(0,m0b,r0b));
//            points_b.get(1).addAll(mp.getSymmetricPoints(1,m1b,r1b));
//            points_b.get(2).addAll(mp.getSymmetricPoints(2,m2b,r2b));
//            points_b.get(3).addAll(mp.getSymmetricPoints(3,m3b,r3b));
//            points_b.get(4).addAll(mp.getSymmetricPoints(4,m4b,r4b));

//        }

//        for(int i=0;i<5;++i){
//            if(brightness.get(i) < 0.5){
//                for(LXPoint p : points_a.get(i)){
//                    setColor(p.index, LXColor.gray(127*brightness.get(i)));

//                }
//            }else{
//               for(LXPoint p : points_b.get(i)){
//                    // setColor(p.index, LXColor.gray(127*(1-(brightness.get(i))-0.5)));
//                }  
//            }
//            // System.out.println("i: "+brightness.get(i));

//        }

//    }

//    private double net_brightness(double modulo, double rotation){
//        double m = modulo - Math.floor(modulo);
//        double r = rotation - Math.floor(rotation);

//        return (m+r)/2.0;
//    }

//}

//public class RingTest extends LXPattern {
//  private final DiscreteParameter R0 = new DiscreteParameter("R0",0,0,6);
//  private final DiscreteParameter M0 = new DiscreteParameter("M0",0,0,6);
//  private final DiscreteParameter R1 = new DiscreteParameter("R1",0,0,12);
//  private final DiscreteParameter M1 = new DiscreteParameter("M1",0,0,12);
//  private final DiscreteParameter R2 = new DiscreteParameter("R2",0,0,12);
//  private final DiscreteParameter M2 = new DiscreteParameter("M2",0,0,12);
//  private final DiscreteParameter R3 = new DiscreteParameter("R3",0,0,12);
//  private final DiscreteParameter M3 = new DiscreteParameter("M3",0,0,12);
//  private final DiscreteParameter R4 = new DiscreteParameter("R4",0,0,6);
//  private final DiscreteParameter M4 = new DiscreteParameter("M4",0,0,6);
  
//  public RingTest (LX lx) {
//    super(lx);
    
//    addParameter("M0",this.M0);
//    addParameter("R0",this.R0);
//    addParameter("M1",this.M1);
//    addParameter("R1",this.R1);
//    addParameter("M2",this.M2);
//    addParameter("R2",this.R2);
//    addParameter("M3",this.M3);
//    addParameter("R3",this.R3);
//    addParameter("M4",this.M4);
//    addParameter("R4",this.R4);
//  }
  
//  public void run(double msPassed) {
//    for (MEMPanel panel : tcr.mem_panels) {
//       for (int i=0; i<5; ++i) {
//         for (LXPoint pt: panel.getSymmetricPoints(i,1,1)) {
//           setColor(pt.index,LXColor.BLACK);
//         }
//       }
       
//       for (LXPoint pt : panel.getSymmetricPoints(0,(int)this.R0.getValue(),(int)M0.getValue())) {
//         setColor(pt.index,LXColor.RED);
//       }
//       for (LXPoint pt : panel.getSymmetricPoints(1,(int)this.R1.getValue(),(int)M1.getValue())) {
//         setColor(pt.index,LXColor.RED);
//       }
//       for (LXPoint pt : panel.getSymmetricPoints(2,(int)this.R2.getValue(),(int)M2.getValue())) {
//         setColor(pt.index,LXColor.RED);
//       }
//       for (LXPoint pt : panel.getSymmetricPoints(3,(int)this.R3.getValue(),(int)M3.getValue())) {
//         setColor(pt.index,LXColor.RED);
//       }
//       for (LXPoint pt : panel.getSymmetricPoints(4,(int)this.R4.getValue(),(int)M4.getValue())) {
//         setColor(pt.index,LXColor.RED);
//       } 
//    }
//  }
//}




//public class FU extends LXPattern {
//    private final CompoundParameter lvar = new CompoundParameter("lvar",0,0,255);


//  public FU(LX lx) {
//    super(lx); 
//    addParameter("lvar",this.lvar);
//  }
  
//  public void run(double deltaMS) {
//    for(MEMPanel mp : tcr.mem_panels){
//      int i =0;
//      for (LXPoint pt : mp.getSymmetricPoints(0,1,1)) {
//        switch(i) {
          
//          case 0  :
//          case 1  : 
//          case 5  : setColor(pt.index,LXColor.RED); break;
//          default: break;
//        }
//        ++i;
//      }
      
//      i =0;
//      for (LXPoint pt : mp.getSymmetricPoints(1,1,1)) {
//        switch(i) {
          
//          case 0  :
//          case 1  : 
//          case 2  : 
//          case 11 : setColor(pt.index,LXColor.RED); break;
//          default: break;
//        }
//        ++i;
//      }
      
//      i=0;
//      for (LXPoint pt : mp.getSymmetricPoints(2,1,1)) {
//        switch(i) {
//          case 1  :
//          case 0  :
//          case 11 : setColor(pt.index,LXColor.RED); break;
//          case 10 : 
//          case 2  : setColor(pt.index,LXColor.rgb((int)lvar.getValue(),0,0)); break;
//          default: break;
//        }
//        ++i;
//      }
      
//      i=0;
//      for (LXPoint pt : mp.getSymmetricPoints(3,1,1)) {
//        switch(i) {
          
//          case 0  : 
//          case 1 : setColor(pt.index,LXColor.RED); break;
//          case 2 :
//          case 11 : setColor(pt.index,LXColor.rgb((int)lvar.getValue(),0,0)); break;
//          default: break;
//        }
//        ++i;
//      }
        
//      i=0;
//      for (LXPoint pt : mp.getSymmetricPoints(4,1,1)) {
//        switch(i) {
//          case 0 :
//          case 5 : setColor(pt.index,LXColor.rgb((int)lvar.getValue(),0,0)); break;
//          default : break;
//        }
//        i++;
//      }
//    }
//  }
//}


////this pattern has issues (no smooth swap)
//public class Swapper extends LXPattern{
  
//    /// parameters to control smooth transition
//    public final CompoundParameter Fade = 
//                new CompoundParameter("fade between a and b", 0,0,0.3);
                
//    public final BooleanParameter nextFrame = (BooleanParameter)
//      new BooleanParameter("nextFrame", true)
//      .setDescription("false =  A , true = B");            
    
//    public final CompoundParameter modulatorPeriod = 
//                new CompoundParameter("modulator Period", 1,0,10000);
                
//    private final LXModulator swapModulator = startModulator(new SinLFO(0, 1, modulatorPeriod));
    
//    boolean editA = false;
//    boolean editB = true;    
//    int m0A, r0A, m1A, r1A, m2A , r2A , m3A , r3A ,  m4A , r4A , m0B, r0B, m1B, r1B, m2B , r2B , m3B , r3B ,  m4B , r4B ;

//    public Swapper(LX lx){

//        super(lx);
        
//        //----switching parameters
//        addParameter("nextFrame", this.nextFrame);
//        addParameter("fade between ad and b", this.Fade);
//        addParameter("modulator Period", this.modulatorPeriod);
        
//    }
    
    
//        //init points_a/points_b
//        HashMap<Integer, ArrayList<LXPoint>> points_a = new HashMap<Integer, ArrayList<LXPoint>>();
//        HashMap<Integer, ArrayList<LXPoint>> points_b = new HashMap<Integer, ArrayList<LXPoint>>();



//    public void run(double deltaMs){
//            //----A
     
        
//        //added fade parameter
        
//        double fade = this.Fade.getValue();
//        double fadeFromModulator = this.swapModulator.getValuef();
   
//        for(int i=0;i<5;++i){
//            points_a.put(i, new ArrayList<LXPoint>());
//            points_b.put(i, new ArrayList<LXPoint>());
//        }
//        for(LXPoint p : model.points){
//            colors[p.index] = 0x000000;
//        }

   
//        //editing background frame
//        if((fadeFromModulator <= 0.0001)&&(editB)&&(editA == false)){
//            //editB  
//           // println(editB);
//           // println(" editing  B ");
//           // println(fadeFromModulator);
//           // println(millis());
//           // println("-----");
             
//            m0B = (int)random(1,5);
//            r0B = (int)random(0,11);
//            m1B = (int)random(1,5);
//            r1B = (int)random(0,11);
//            m2B = (int)random(1,5);
//            r2B = (int)random(0,11);
//            m3B = (int)random(1,5);
//            r3B = (int)random(0,11);
//            m4B = (int)random(1,5);
//            r4B = (int)random(0,11);
            
            
//            if(m0B==5){
//            m0B=6;
//            }
//            if(m1B==5){
//                m1B=6;
//            }
//            if(m2B==5){
//                m2B=6;
//            }
//            if(m3B==5){
//                m3B=6;
//            }
//            if(m4B==5){
//                m4B=6;
//            }
            
            
      
//           editB = false;
//           editA = true;

//        }
//        if((fadeFromModulator >0.9999)&&(editA)){ ///this is fucking amazing, why???? it takes different time every time, need to lock it to a timer using millis()?. 
//          //editA
//          // println(editB);
//          // println(" editing A ");
//          // println(fadeFromModulator);
//          // println(millis());
//          // println("-----"); 
          

          
//            m0A = (int)random(1,5);
//            r0A = (int)random(0,11);
//            m1A = (int)random(1,5);
//            r1A = (int)random(0,11);
//            m2A = (int)random(1,5);
//            r2A = (int)random(0,11);
//            m3A = (int)random(1,5);
//            r3A = (int)random(0,11);
//            m4A = (int)random(1,5);
//            r4A = (int)random(0,11);
            
            
//            if(m0A==5){
//            m0A=6;
//            }
//            if(m1A==5){
//                m1A=6;
//            }
//            if(m2A==5){
//                m2A=6;
//            }
//            if(m3A==5){
//                m3A=6;
//            }
//            if(m4A==5){
//                m4A=6;
//            }
                      
//              editB = true; 
//              editA = false;
        
//            }
     
       
//           for(MEMPanel mp : tcr.mem_panels){

//            points_a.get(0).addAll(mp.getSymmetricPoints(0,m0A,r0A));
//            points_a.get(1).addAll(mp.getSymmetricPoints(1,m1A,r1A));
//            points_a.get(2).addAll(mp.getSymmetricPoints(2,m2A,r2A));
//            points_a.get(3).addAll(mp.getSymmetricPoints(3,m3A,r3A));
//            points_a.get(4).addAll(mp.getSymmetricPoints(4,m4A,r4A));
 
//            points_b.get(0).addAll(mp.getSymmetricPoints(0,m0B,r0B));
//            points_b.get(1).addAll(mp.getSymmetricPoints(1,m1B,r1B));
//            points_b.get(2).addAll(mp.getSymmetricPoints(2,m2B,r2B));
//            points_b.get(3).addAll(mp.getSymmetricPoints(3,m3B,r3B));
//            points_b.get(4).addAll(mp.getSymmetricPoints(4,m4B,r4B));
            
//            }
     
//        //fading
//          for(int i=0;i<5;++i){            
//              for(LXPoint p : points_b.get(i)){
//                  setColor(p.index, LXColor.gray(100* fadeFromModulator));
//              }
//              // for(LXPoint p : points_a.get(i)){
//              //    setColor(p.index, LXColor.gray(100* (fadeFromModulator))); 
//              // }
//          }
          
//       }  

//}

//public class RingSwapper extends LXPattern{
  
//  /*
//   //---A is the first state
//    public final CompoundParameter m0A = 
//                new CompoundParameter("0A mod", 1,1,5);
//    public final CompoundParameter r0A = 
//                new CompoundParameter(" 0A rot", 0,11);

//    public final CompoundParameter m1A = 
//                new CompoundParameter(" 1A mod", 1,1,5);
//    public final CompoundParameter r1A = 
//                new CompoundParameter(" 1A rot", 0,11);

//    public final CompoundParameter m2A = 
//                new CompoundParameter(" 2A mod", 1,1,5);
//    public final CompoundParameter r2A = 
//                new CompoundParameter(" 2A rot", 0,11);

//    public final CompoundParameter m3A = 
//                new CompoundParameter(" 3A mod", 1,1,5);
//    public final CompoundParameter r3A = 
//                new CompoundParameter(" 3A rot", 0,11);

//    public final CompoundParameter m4A = 
//                new CompoundParameter(" 4A mod", 1,1,5);
//    public final CompoundParameter r4A = 
//                new CompoundParameter(" 4A rot", 0,11);

//  ///B is the next state to transition to
//   public final CompoundParameter m0B = 
//                new CompoundParameter(" 0B mod", 1,1,5);
//    public final CompoundParameter r0B = 
//                new CompoundParameter(" 0B rot", 0,11);

//    public final CompoundParameter m1B = 
//                new CompoundParameter(" 1B mod", 1,1,5);
//    public final CompoundParameter r1B = 
//                new CompoundParameter(" 1B rot", 0,11);

//    public final CompoundParameter m2B = 
//                new CompoundParameter(" 2B mod", 1,1,5);
//    public final CompoundParameter r2B = 
//                new CompoundParameter(" 2B rot", 0,11);

//    public final CompoundParameter m3B = 
//                new CompoundParameter(" 3B mod", 1,1,5);
//    public final CompoundParameter r3B = 
//                new CompoundParameter(" 3B rot", 0,11);

//    public final CompoundParameter m4B = 
//                new CompoundParameter(" 4B mod", 1,1,5);
//    public final CompoundParameter r4B = 
//                new CompoundParameter(" 4B rot", 0,11);
//    */
//    /// parameters to control smooth transition
//    public final CompoundParameter Fade = 
//                new CompoundParameter("fade between a and b", 0,0,0.3);
                
//    public final BooleanParameter nextFrame = (BooleanParameter)
//      new BooleanParameter("nextFrame", true)
//      .setDescription("false =  A , true = B");            
    
//    public final CompoundParameter modulatorPeriod = 
//                new CompoundParameter("modulator Period", 1,0,10000);
                
//    private final LXModulator swapModulator = startModulator(new SinLFO(0, 1, modulatorPeriod));
    
//    boolean editA = false;
//    boolean editB = true;    
//    int m0A, r0A, m1A, r1A, m2A , r2A , m3A , r3A ,  m4A , r4A , m0B, r0B, m1B, r1B, m2B , r2B , m3B , r3B ,  m4B , r4B ;

//    public RingSwapper(LX lx){
//        super(lx);
//      /*
//           //----A
           
//        addParameter("0 A mod", this.m0A);
//        addParameter("0 A rot", this.r0A);
//        addParameter("1 A mod", this.m1A);
//        addParameter("1 A rot", this.r1A);
//        addParameter("2 A mod", this.m2A);
//        addParameter("2 A rot", this.r2A);
//        addParameter("3 A mod", this.m3A);
//        addParameter("3 A rot", this.r3A);
//        addParameter("4 A mod", this.m4A);
//        addParameter("4 A rot", this.r4A);
//        //----- B
//        addParameter("0 B mod", this.m0B);
//        addParameter("0 B rot", this.r0B);
//        addParameter("1 B mod", this.m1B);
//        addParameter("1 B rot", this.r1B);
//        addParameter("2 B mod", this.m2B);
//        addParameter("2 B rot", this.r2B);
//        addParameter("3 B mod", this.m3B);
//        addParameter("3 B rot", this.r3B);
//        addParameter("4 B mod", this.m4B);
//        addParameter("4 B rot", this.r4B);*/
        
//        //----switching parameters
//        addParameter("nextFrame", this.nextFrame);
//        addParameter("fade between ad and b", this.Fade);
//        addParameter("modulator Period", this.modulatorPeriod);
        

        
//    }
    
    
//        //init points_a/points_b
//        HashMap<Integer, ArrayList<LXPoint>> points_a = new HashMap<Integer, ArrayList<LXPoint>>();
//        HashMap<Integer, ArrayList<LXPoint>> points_b = new HashMap<Integer, ArrayList<LXPoint>>();



//    public void run(double deltaMs){
//            //----A
     
        
//        //added fade parameter
        
//        double fade = this.Fade.getValue();
//        double fadeFromModulator = this.swapModulator.getValuef();
   
//        for(int i=0;i<5;++i){
//            points_a.put(i, new ArrayList<LXPoint>());
//            points_b.put(i, new ArrayList<LXPoint>());
//        }
//        for(LXPoint p : model.points){
//            colors[p.index] = 0x000000;
//        }

   
//        //editing background frame
//        if((fadeFromModulator <= 0.0001)&&(editB)&&(editA == false)){
//            //editB  
//           println(editB);
//           println(" editing  B ");
//           println(fadeFromModulator);
//           println(millis());
//           println("-----");
             
//            m0B = (int)random(1,5);
//            r0B = (int)random(0,11);
//            m1B = (int)random(1,5);
//            r1B = (int)random(0,11);
//            m2B = (int)random(1,5);
//            r2B = (int)random(0,11);
//            m3B = (int)random(1,5);
//            r3B = (int)random(0,11);
//            m4B = (int)random(1,5);
//            r4B = (int)random(0,11);
            
            
//            if(m0B==5){
//            m0B=6;
//            }
//            if(m1B==5){
//                m1B=6;
//            }
//            if(m2B==5){
//                m2B=6;
//            }
//            if(m3B==5){
//                m3B=6;
//            }
//            if(m4B==5){
//                m4B=6;
//            }          
      
//           editB = false;
//           editA = true;

//        }
        
//        else if((fadeFromModulator >0.9999)&&(editA)&&(editB==false)){ ///this is fucking amazing, why???? it takes different time every time, need to lock it to a timer using millis()?. 
//          //editA
//          println(editB);
//          println(" editing A ");
//          println(fadeFromModulator);
//          println(millis());
//          println("-----");       

          
//            m0A = (int)random(1,5);
//            r0A = (int)random(0,11);
//            m1A = (int)random(1,5);
//            r1A = (int)random(0,11);
//            m2A = (int)random(1,5);
//            r2A = (int)random(0,11);
//            m3A = (int)random(1,5);
//            r3A = (int)random(0,11);
//            m4A = (int)random(1,5);
//            r4A = (int)random(0,11);            
            
//            if(m0A==5){
//            m0A=6;
//            }
//            if(m1A==5){
//                m1A=6;
//            }
//            if(m2A==5){
//                m2A=6;
//            }
//            if(m3A==5){
//                m3A=6;
//            }
//            if(m4A==5){
//                m4A=6;
//            }
                      
//              editB = true; 
//              editA = false;
        
//            }
           
       
//           for(MEMPanel mp : tcr.mem_panels){

//            points_a.get(0).addAll(mp.getSymmetricPoints(0,m0A,r0A));
//            points_a.get(1).addAll(mp.getSymmetricPoints(1,m1A,r1A));
//            points_a.get(2).addAll(mp.getSymmetricPoints(2,m2A,r2A));
//            points_a.get(3).addAll(mp.getSymmetricPoints(3,m3A,r3A));
//            points_a.get(4).addAll(mp.getSymmetricPoints(4,m4A,r4A));
 
//            points_b.get(0).addAll(mp.getSymmetricPoints(0,m0B,r0B));
//            points_b.get(1).addAll(mp.getSymmetricPoints(1,m1B,r1B));
//            points_b.get(2).addAll(mp.getSymmetricPoints(2,m2B,r2B));
//            points_b.get(3).addAll(mp.getSymmetricPoints(3,m3B,r3B));
//            points_b.get(4).addAll(mp.getSymmetricPoints(4,m4B,r4B));
            
//            }
     
//        //fading
//          for(int i=0;i<5;++i){ 
            
//              for(LXPoint p : points_b.get(i)){
//                  setColor(p.index, LXColor.gray(100* (fadeFromModulator)));
//              }
//              for(LXPoint p : points_a.get(i)){
//                  setColor(p.index, LXColor.gray(100* (1 -fadeFromModulator))); 
//              }
              
//          }
          
//       }  

//}


//// This pattern makes use of the layer construct
//public class VividLayered extends LXPattern {
  
//  //link layers timing (when A is full bright B is full off
//  //edit non visible layer with new random assignment
//  //fade betweemn two layers
//  //iterate to rings or individual points
//     public final CompoundParameter modulatorPeriod = 
//                new CompoundParameter("modulator Period", 1,0,10000);          
////gross, shall use an array but we'll think about it    
//    boolean editB = true; 
//    int m0A, r0A, m1A, r1A, m2A , r2A , m3A , r3A ,  m4A , r4A , m0B, r0B, m1B, r1B, m2B , r2B , m3B , r3B ,  m4B , r4B ;
  
//  public VividLayered(LX lx) {
//    super(lx);
//    addParameter("modulator Period", this.modulatorPeriod);
//    // Layers are automatically rendered on every pass
//    addLayer(new LayerA(lx));
//    addLayer(new LayerB(lx));
//  }
  
//   //init points_a/points_b
//        HashMap<Integer, ArrayList<LXPoint>> points_a = new HashMap<Integer, ArrayList<LXPoint>>();
//        HashMap<Integer, ArrayList<LXPoint>> points_b = new HashMap<Integer, ArrayList<LXPoint>>();
        
//  public void run(double deltaMs) {
//    // Blank everything out first
//    setColors(#000000);
    
//    // The added layers are automatically called after our
//    // run() method, no need to manually call them
//  }
  
  
//  private class LayerA extends LXLayer {
    
    
//    // Note how one LFO can be a parameter to another LFO!
//    private final SinLFO Amodulator = new SinLFO(0, 1, modulatorPeriod);
  
//    private LayerA(LX lx) {
//      super(lx);  
//      startModulator(this.Amodulator);
//    }
    
//    public void run(double deltaMs) {
       
//       double fadeFromModulator = this.Amodulator.getValuef();
//        //print(fadeFromModulator);
//      for(int i=0;i<5;++i){
//            points_a.put(i, new ArrayList<LXPoint>());
//        }
//        for(LXPoint p : model.points){
//            colors[p.index] = 0x000000;
//        }
        
//           //editing background frame
//        if((fadeFromModulator <= 0.0001)&&(editB==false)){
//          println(editB);
//          println(" editing A ");
//          println(fadeFromModulator);
//          println(millis());
//          println("-----");       

          
//            m0A = (int)random(1,5);
//            r0A = (int)random(0,11);
//            m1A = (int)random(1,5);
//            r1A = (int)random(0,11);
//            m2A = (int)random(1,5);
//            r2A = (int)random(0,11);
//            m3A = (int)random(1,5);
//            r3A = (int)random(0,11);
//            m4A = (int)random(1,5);
//            r4A = (int)random(0,11);            
            
//            if(m0A==5){
//            m0A=6;
//            }
//            if(m1A==5){
//                m1A=6;
//            }
//            if(m2A==5){
//                m2A=6;
//            }
//            if(m3A==5){
//                m3A=6;
//            }
//            if(m4A==5){
//                m4A=6;
//            }
                      
//              editB = true; 
        
//            }
        
//         for(MEMPanel mp : tcr.mem_panels){
//            points_a.get(0).addAll(mp.getSymmetricPoints(0,m0A,r0A));
//            points_a.get(1).addAll(mp.getSymmetricPoints(1,m1A,r1A));
//            points_a.get(2).addAll(mp.getSymmetricPoints(2,m2A,r2A));
//            points_a.get(3).addAll(mp.getSymmetricPoints(3,m3A,r3A));
//            points_a.get(4).addAll(mp.getSymmetricPoints(4,m4A,r4A));
//         }
         
//         for(int i=0;i<5;++i){             
//              for(LXPoint p : points_a.get(i)){
//                  setColor(p.index, LXColor.gray(100* (fadeFromModulator)));
//              }
//         }
//      }
//  }
//  private class LayerB extends LXLayer {
    
    
//    // Note how one LFO can be a parameter to another LFO!
//    private final SinLFO Bmodulator = new SinLFO(0, 1, modulatorPeriod);
  
//    private LayerB(LX lx) {
//      super(lx);  
//      startModulator(this.Bmodulator);
//    }
    
//    public void run(double deltaMs) {
       
//       double fadeFromModulator = this.Bmodulator.getValuef();
//        //print(fadeFromModulator);
//      for(int i=0;i<5;++i){
//            points_b.put(i, new ArrayList<LXPoint>());
//        }
//        for(LXPoint p : model.points){
//            colors[p.index] = 0x000000;
//        }
        
//           //editing background frame
//        if((fadeFromModulator >= 0.9999)&&(editB)){
//      //editB  
//           println(editB);
//           println(" editing  B ");
//           println(fadeFromModulator);
//           println(millis());
//           println("-----");
             
//            m0B = (int)random(1,5);
//            r0B = (int)random(0,11);
//            m1B = (int)random(1,5);
//            r1B = (int)random(0,11);
//            m2B = (int)random(1,5);
//            r2B = (int)random(0,11);
//            m3B = (int)random(1,5);
//            r3B = (int)random(0,11);
//            m4B = (int)random(1,5);
//            r4B = (int)random(0,11);
            
            
//            if(m0B==5){
//            m0B=6;
//            }
//            if(m1B==5){
//                m1B=6;
//            }
//            if(m2B==5){
//                m2B=6;
//            }
//            if(m3B==5){
//                m3B=6;
//            }
//            if(m4B==5){
//                m4B=6;
//            }          
      
//           editB = false;
        
//            }
        
//         for(MEMPanel mp : tcr.mem_panels){
//            points_b.get(0).addAll(mp.getSymmetricPoints(0,m0B,r0B));
//            points_b.get(1).addAll(mp.getSymmetricPoints(1,m1B,r1B));
//            points_b.get(2).addAll(mp.getSymmetricPoints(2,m2B,r2B));
//            points_b.get(3).addAll(mp.getSymmetricPoints(3,m3B,r3B));
//            points_b.get(4).addAll(mp.getSymmetricPoints(4,m4B,r4B));
//         }
         
//         for(int i=0;i<5;++i){             
//              for(LXPoint p : points_b.get(i)){
//                  setColor(p.index, LXColor.gray(100* (1-fadeFromModulator)));
//              }
//         }
//      }
//  }
 
//}
//public class CollectionsTest extends LXPattern {

//    public final CompoundParameter h = 
//                new CompoundParameter("Hue", 0, 360);

//    public final CompoundParameter s = 
//                new CompoundParameter("Sat", 0, 100);

//    public final CompoundParameter b = 
//                new CompoundParameter("Brt", 100, 100);

//    public final CompoundParameter p_num = 
//                new CompoundParameter("Polygon",0,38);


//    // public final CompoundParameter c_num = 
//    //             new CompoundParameter("Cube",0,6);

//    // public final CompoundParameter o_num = 
//    //             new CompoundParameter("Output",0,22);

//    // public final CompoundParameter ds_num = 
//    //             new CompoundParameter("DStrip",0,71);

//    // public final CompoundParameter cv_num = 
//    //             new CompoundParameter("CubeVert",0,3);

//    // public final CompoundParameter cve_num = 
//    //             new CompoundParameter("VertEdge",0,2);
//    // public final CompoundParameter v_num = 
//    //             new CompoundParameter("Vertex",0,2);


//    // public final BooleanParameter enableDiagonals =
//    //             new BooleanParameter("Enable")
//    //             .setDescription("Turn diagonals on/off")
//    //             .setMode(BooleanParameter.Mode.TOGGLE);

//    // public final BooleanParameter enableCubes =
//    //             new BooleanParameter("Enable")
//    //             .setDescription("Turn cubes on/off")
//    //             .setMode(BooleanParameter.Mode.TOGGLE);

//    // public final BooleanParameter enableOutputs =
//    //             new BooleanParameter("Enable")
//    //             .setDescription("Turn cubes on/off")
//    //             .setMode(BooleanParameter.Mode.TOGGLE);

//    // public final BooleanParameter enableSingleStrip =
//    //             new BooleanParameter("Enable")
//    //             .setDescription("Turn single strips on/off")
//    //             .setMode(BooleanParameter.Mode.TOGGLE);
//    // public final BooleanParameter enableVertex =
//    //             new BooleanParameter("Enable")
//    //             .setDescription("Turn vertices on/off")
//    //             .setMode(BooleanParameter.Mode.TOGGLE);


//    public CollectionsTest(LX lx) {
//        super(lx);
//        addParameter("h", this.h);
//        addParameter("s", this.s);
//        addParameter("b", this.b);
//        // addParameter("diagonals toggle", this.enableDiagonals);
//        addParameter("polygons", this.p_num);
//        // addParameter("cubes toggle", this.enableCubes);
//        // addParameter("cubes", this.c_num);
//        // addParameter("outputs toggle", this.enableOutputs);
//        // addParameter("outputs", this.o_num);
//        // addParameter("strip toggle", this.enableSingleStrip);
//        // addParameter("diagonal strip", this.ds_num);
//        // addParameter("cube vertex", this.cv_num);
//        // addParameter("vertex edge", this.cve_num);
//        // addParameter("vertex toggle", this.enableVertex);
//        // addParameter("vertex number", this.v_num);
//    }

//    public void run(double deltaMs) {

//        // int poly = (int)this.p_num.getValue();
//        // // int cube = (int)this.c_num.getValue();
//        // // int output = (int)this.o_num.getValue();
//        // // int dstrip = (int)this.ds_num.getValue();
//        // // int c_vertex = (int)this.cv_num.getValue();
//        // // int edge = (int)this.cve_num.getValue();
//        // // int vertex = (int)this.v_num.getValue();


//        // ArrayList<Polygon> polys = new ArrayList();

//        // for(CellCollection c : cells){
//        // 	polys.addAll(c.getPolygons());
//        // }
//        // // List<LEDStrip> diagonals = structure.diagonals.strips;
//        // // HashMap<Integer, List<LEDStrip>> vertices = graph.map; 


//        // for(LXPoint point : model.getPoints()){
//        //     setColor(point.index, LXColor.hsb(0, 0, 0));
//        // }

//        // // for (LXPoint point : structure.diagonals.diagonal_points.get(diag)) {
//        // //     if (!this.enableDiagonals.getValueb()){
//        // //         break;
//        // //     }
//        // //     setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        // // }

//        // for (LXPoint point : polys.get(poly).getPoints()) {
//        //     // if (!this.enableCubes.getValueb()){
//        //     //     break;
//        //     // }
//        //     setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        // }

//        // for(LXFixture fixture : output_map.get(output)){
//        //     for (LXPoint point : fixture.getPoints()) {
//        //         if (!this.enableOutputs.getValueb()){
//        //             break;
//        //         }
//        //         setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        //     }
//        // }

//        // for(LXPoint point : diagonals.get(dstrip).getPoints()){
//        //     if (!this.enableSingleStrip.getValueb()){
//        //         break;
//        //     }
//        //     setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        // }
//        // for(LXPoint point : cubes[cube].vertex[c_vertex].strip[edge].getPoints()){
//        //     if (!this.enableSingleStrip.getValueb()){
//        //         break;
//        //     }
//        //     setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        // }

//        // for(LEDStrip strip : vertices.get(vertex)){
//        //     if (!this.enableVertex.getValueb()){
//        //         break;
//        //     }
//        //     for(LXPoint point : strip.getPoints()){
//        //         setColor(point.index, LXColor.hsb(this.h.getValue(), this.s.getValue(), this.b.getValue()));
//        //     }
//        // }
//    }
//}


//// /**
////  * Braindead simple test pattern that iterates through all the nodes turning
////  * them on one by one in fixed order.
////  */
//// public class CollectionsIterator extends LXPattern {

////   private final SawLFO index;
////   public final CompoundParameter speed = new CompoundParameter("Speed", 10, 1, 100);

////   private final FunctionalParameter period = new FunctionalParameter() {
////     @Override
////     public double getValue() {
////       return (1000 / speed.getValue()) * lx.total;
////     }
////   };

////   public CollectionsIterator(LX lx) {
////     super(lx);
////     addParameter(speed);
////     setAutoCycleEligible(false);
////     startModulator(this.index = new SawLFO(0, lx.total, period));
////   }

////   @Override
////   public void run(double deltaMs) {
////     int active = (int) Math.floor(this.index.getValue());
////     for (LXPoint point : structure.diagonals.diagonals.get(0)) {
////       int i = point.index;
////       System.out.println("i: "+i);
////       this.colors[i] = (i == active) ? 0xFFFFFFFF : 0xFF000000;
////     }
////   }
//// }