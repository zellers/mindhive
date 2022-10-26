//public class BananaElement {
//  Bananas master;
//  List<MEMPanel> panels;
//  private int[] colorArray;
//  double[] timeBuckets;
//  private double prevDuty = -1;
//  private int nCol = -1;
//  private int checkCol = -1;
//  private double timeFrac = -1.0;
//  private double rot = 0.0;
//  private double hue = 0.0;
//  private int ctrlnCol = 4;
//  private double ctrlDuty = 0.89;
//  private double ctrlRange = 360.0;

//  public BananaElement(Bananas master, MEMPanel[] panels) {
//    this.master = master;
//    this.panels = new ArrayList<MEMPanel>();
    
//    for (MEMPanel pnl : panels) {
//      this.panels.add(pnl);
//    }
//  }

//  public BananaElement(Bananas master, List<MEMPanel> panels) {
//    this.master = master;
//    this.panels = new ArrayList<MEMPanel>();
    
//    for (MEMPanel pnl : panels) {
//      this.panels.add(pnl);
//    }
//  }
  
//  public void setRot(double rot) {
//    this.rot = rot;
//  }
  
//  public void setHue(double hue) {
//    this.hue = hue;
//  }

//  public void setNCol(int num) {
//    this.ctrlnCol = num;
//  }

//  public void setRange(double range) {
//    this.ctrlRange = range;
//  }
  
//  public void setDuty(double duty) {
//    this.ctrlDuty = duty;
//  }

//  public void render() {
//    updateOnParameterChange();
//    for (MEMPanel pnl : panels) {
//      display_pattern(pnl);
//    }
//  }

//  public void updateOnParameterChange() {
//    if ( (ctrlDuty != this.prevDuty) || (((int)ctrlnCol) != checkCol) ) {
//      this.nCol = ((int) ctrlnCol==5)?6:(int) ctrlnCol;
//      this.colorArray = new int[this.nCol];
//      this.timeBuckets = new double[2*this.nCol+1];
//      this.prevDuty = ctrlDuty;
//      this.checkCol = (int) ctrlnCol;

//      double maxVal = this.nCol * this.prevDuty + this.nCol;
//      this.timeFrac = 1.0/maxVal;
//      timeBuckets[0] = 0;

//      for (int i=1; i<timeBuckets.length; ++i) {
//        timeBuckets[i] = timeBuckets[i-1] + (i%2==0?this.timeFrac:this.prevDuty*this.timeFrac);
//      }
//    }
//  }


//  public void display_pattern(MEMPanel mp) {
//    double rotval = 0.0;
//    for (int i=0; i < timeBuckets.length; ++i) {
//      if (timeBuckets[i] > rot) {
//        if (i%2 == 0) {
//          //this is increasing
//          rotval = (i-2)/2.0/this.nCol + (rot-this.timeBuckets[i-1])/(this.timeFrac) * 1.0/this.nCol;
//        } else {
//          rotval = (i-1)/2.0/this.nCol;
//        }
//        break;
//      }
//    }

//    for (int i=0; i<this.nCol; ++i) {
//      if (i==this.nCol-1) {
//        colorArray[i] = LXColor.hsb(Math.abs(this.hue+this.ctrlRange*i/this.nCol), 100, 0);
//      } else {
//        colorArray[i] = LXColor.hsb(Math.abs(this.hue+this.ctrlRange*i/this.nCol), 100, 100);
//      }
//    }

//    double alpha = rotval * this.nCol;
//    alpha -= Math.floor(alpha);

//    for (int ring=0; ring<5; ++ring) {
//      int led=0;
//      for (LXPoint pt : mp.getSymmetricPoints(ring, 1, 1)) {
//        int cPos = (int) Math.floor(rotval*this.nCol);        

//        if (ring == 0 || ring == 4) {
//          cPos += 2*led;
//        } else {
//          cPos += led;
//        }

//        cPos = cPos%this.nCol;

//        master.doColor(pt.index, LXColor.lerp(colorArray[cPos], colorArray[cPos+1>=this.nCol?0:cPos+1], alpha));

//        ++led;
//      }
//    }
//  }
//}

//public class HueElement {
//  public double startTime;
//  public double runtime;
//  public double startValue;
//  public double endValue;
  
//  HueElement(double startTime, double runtime, double startValue, double endValue) {
//    this.startTime = startTime;
//    this.runtime = runtime;
//    this.startValue = startValue;
//    this.endValue = endValue;
//  }
  
//  public void start(double startTime) {
//    this.startTime = startTime;
//  }
  
//  public double sample(double time) {
//    return Math.min(startValue + (time-startTime)/runtime * (endValue-startValue),endValue);
//  }
//}

//public class Bananas extends LXPattern {
//  private double msTotal = 0;
//  private List<BananaElement> elements;

//  private final CompoundParameter ctrlhue = new CompoundParameter("hue", 0., 0., 360.);
//  private final CompoundParameter ctrlrot = new CompoundParameter("rotMS", 1000.0, 300.0, 10000.0);
//  private final CompoundParameter ctrlrange = new CompoundParameter("range", 360, 30, 360);
//  private final CompoundParameter ctrlduty = new CompoundParameter("duty", 1.0, 0.2, 10.);
//  private final DiscreteParameter ctrlnCol = new DiscreteParameter("NumberOfColors", 3, 2, 6);
  
//  private final SawLFO rotationForwardLFO = new SawLFO("Forward rotation",1,0,ctrlrot);
//  private final SawLFO rotationBackwardLFO = new SawLFO("Backward rotation",0,1,ctrlrot);  
//  private final SinLFO hueLFO = new SinLFO("hue",0,360,25000);
  
//  private HueElement [] hueElements = new HueElement[3];

//  private double [] nextChange = new double[3];
  
  
//  private void recordTime(double deltaMS) {
//    msTotal += deltaMS;
//  }
  
//  private void shuffle() {
//    for (int i=0; i < 3; ++i) {
//      if (msTotal > nextChange[i]) {
//        double transitionTime = random(4000.0,10000.0);
//        nextChange[i] = random((float)(msTotal + transitionTime),(float)(msTotal + transitionTime+10000.0));
//        double nextHue = random(0.0,360.0);
        
//        hueElements[i].startTime = msTotal;
//        hueElements[i].runtime = transitionTime;
//        hueElements[i].startValue = hueElements[i].endValue;
//        hueElements[i].endValue = nextHue;
//      }
//    }
//  }

//  public String getAuthor() {
//    return "Uwe Winter";
//  }

//  public Bananas(LX lx) {
//    super(lx);

//    for (int i=0; i<3; ++i) {
//      hueElements[i] = new HueElement(0,0,0,1);
//    }

//    addParameter("hue", this.ctrlhue);
//    addParameter("rot", this.ctrlrot);
//    addParameter("duty", this.ctrlduty);
//    addParameter("nCol", this.ctrlnCol);
//    addParameter("range", this.ctrlrange);
    
    
    
//    addModulator(rotationForwardLFO);
//    addModulator(rotationBackwardLFO);
//    addModulator(hueLFO);
    
//    hueLFO.start();
//    rotationForwardLFO.start();
//    rotationBackwardLFO.start();
    
//    this.elements = new ArrayList<BananaElement> ();
    
//    List<MEMPanel> innerOuter = new ArrayList<MEMPanel> ();
    
//    for (MEMPanel pnl : tcr.vivid.getSymmetricPanels(0,1,1)) {
//      innerOuter.add(pnl);
//    }
    
//    for (MEMPanel pnl : tcr.vivid.getSymmetricPanels(2,1,1)) {
//      innerOuter.add(pnl);
//    }
    
    
//    this.elements.add(new BananaElement(this,tcr.vivid.getSymmetricPanels(1,2,1)));
//    this.elements.add(new BananaElement(this,tcr.vivid.getSymmetricPanels(1,2,2)));
//    this.elements.add(new BananaElement(this,innerOuter));
//  }

//  public void swapPanels() {
//    BananaElement tmp = this.elements.get(0);
//    this.elements.set(0,this.elements.get(1));
//    this.elements.set(1,tmp);
//  }

//  public void run(double msPassed) {
//    this.recordTime(msPassed);
//    this.shuffle();
    
//    BananaElement elem = this.elements.get(0);
//    elem.setHue(hueElements[0].sample(msTotal));
//    elem.setRot(this.rotationForwardLFO.getValue());
//    elem.setDuty(this.ctrlduty.getValue());
//    elem.setRange(this.ctrlrange.getValue());
//    elem.setNCol((int)this.ctrlnCol.getValue());
//    elem.render();
    
//    elem = this.elements.get(1);
//    elem.setHue(hueElements[2].sample(msTotal));
//    elem.setRot(this.rotationForwardLFO.getValue());
//    elem.setDuty(this.ctrlduty.getValue());
//    elem.setRange(this.ctrlrange.getValue());
//    elem.setNCol((int)this.ctrlnCol.getValue());
//    elem.render();
    
//    elem = this.elements.get(2);
//    elem.setHue(hueElements[2].sample(msTotal));
//    elem.setRot(this.rotationBackwardLFO.getValue());
//    elem.setDuty(this.ctrlduty.getValue());
//    elem.setRange(this.ctrlrange.getValue());
//    elem.setNCol((int)this.ctrlnCol.getValue());
//    elem.render();
    
//    if (random(0.0,1.0) > .99) {
//      swapPanels();
//    }
    
//  }
  
//  public void doColor(int index, int col) {
//    setColor(index,col); 
//  }
//}