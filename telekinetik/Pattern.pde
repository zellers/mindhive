// Very simple pattern, just has one parameter and one LFO

import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

public class SimpleColour extends LXPattern {
  
  public SimpleColour(LX lx) {
    super(lx);
  }
  
  public void run(double deltaMs) {
    for (LXPoint p : model.points) {
      colors[p.index] = palette.getColor();
    }
  }
}

public class SimpleStripe extends LXPattern {
  
  public final CompoundParameter period = (CompoundParameter)
    new CompoundParameter("Period", 1000, 500, 10000)
    .setExponent(2)
    .setDescription("Period of oscillation of the stripe");
    
    public final CompoundParameter size = (CompoundParameter)
    new CompoundParameter("Size", 3*FEET, 1*FEET, 10*FEET)
    .setDescription("Size of the stripe");
  
  private final LXModulator xPos = startModulator(new SinLFO(model.xMin, model.xMax, period));

  
  public SimpleStripe(LX lx) {
    super(lx);
    
    // Parameters automatically appear in UI and are saved in project file
    addParameter("period", this.period);
    addParameter("size", this.size);
  }
  
  public void run(double deltaMs) {
    float xPos = this.xPos.getValuef();
    float falloff = 100 / this.size.getValuef();
    for (LXPoint p : model.points) {
      // Render each point based on its distance from a moving target position in the x axis 
      colors[p.index] = palette.getColor((double)max(0, 100 - falloff * abs(p.x - xPos)));
    }
  }
}
  
// This pattern makes use of the layer construct
public class LayerDemoPattern extends LXPattern {
  
  private final CompoundParameter numStars = (CompoundParameter)
    new CompoundParameter("Stars", 100, 0, 100)
    .setDescription("Number of star layers");
  
  public LayerDemoPattern(LX lx) {
    super(lx);
    addParameter("numStars", this.numStars);
    
    // Layers are automatically rendered on every pass
    addLayer(new CircleLayer(lx));
    addLayer(new RodLayer(lx));
    for (int i = 0; i < 200; ++i) {
      addLayer(new StarLayer(lx));
    }
  }
  
  public void run(double deltaMs) {
    // Blank everything out first
    setColors(#000000);
    
    // The added layers are automatically called after our
    // run() method, no need to manually call them
  }
  
  private class CircleLayer extends LXLayer {
    
    private final SinLFO xPeriod = new SinLFO(3400, 7900, 11000); 
    
    // Note how one LFO can be a parameter to another LFO!
    private final SinLFO brightnessX = new SinLFO(model.xMin, model.xMax, xPeriod);
  
    private CircleLayer(LX lx) {
      super(lx);
      startModulator(this.xPeriod);
      startModulator(this.brightnessX);
    }
    
    public void run(double deltaMs) {
      float falloff = 100 / (4*FEET);
      float brightnessX = this.brightnessX.getValuef();
      for (LXPoint p : model.points) {
        float yWave = model.yRange/2 * sin(p.x / model.xRange * PI); 
        float distanceFromBrightness = dist(p.x, abs(p.y - model.cy), brightnessX, yWave);
        colors[p.index] = palette.getColor((double) max(0, 100 - falloff*distanceFromBrightness));
      }
    }
  }
  
  private class RodLayer extends LXLayer {
    
    private final SinLFO zPeriod = new SinLFO(2000, 5000, 9000);
    private final SinLFO zPos = new SinLFO(model.zMin, model.zMax, zPeriod);
    
    private RodLayer(LX lx) {
      super(lx);
      startModulator(this.zPeriod);
      startModulator(this.zPos);
    }
    
    public void run(double deltaMs) {
      float zPos = this.zPos.getValuef();
      for (LXPoint p : model.points) {
        double b = 100 - dist(p.x, p.y, model.cx, model.cy) - abs(p.z - zPos);
        if (b > 0) {
          addColor(p.index, palette.getColor( b));
        }
      }
    }
  }
  
  private class StarLayer extends LXLayer {
    
    private final TriangleLFO maxBright = new TriangleLFO(0, numStars, random(2000, 8000));
    private final SinLFO brightness = new SinLFO(-1, maxBright, random(3000, 9000)); 
    
    private int index = 0;
    
    private StarLayer(LX lx) { 
      super(lx);
      startModulator(this.maxBright);
      startModulator(this.brightness);
      pickStar();
    }
    
    private void pickStar() {
      index = (int) random(0, model.size-1);
    }
    
    public void run(double deltaMs) {
      double brightness = this.brightness.getValuef(); 
      if (brightness <= 0) {
        pickStar();
      } else {
        addColor(index, palette.getColor( 50, brightness));
      }
    }
  }
}

public class PatternTumbler extends TenerePattern {
  public String getAuthor() {
    return "Mark C. Slee";
  }
  
  private LXModulator azimuthRotation = startModulator(new SawLFO(0, 1, 15000).randomBasis());
  private LXModulator thetaRotation = startModulator(new SawLFO(0, 1, 13000).randomBasis());
  
  public PatternTumbler(LX lx) {
    super(lx);
  }
    
  public void run(double deltaMs) {
    float azimuthRotation = this.azimuthRotation.getValuef();
    float thetaRotation = this.thetaRotation.getValuef();
    for (LXPoint leaf : model.points) {
      float tri1 = trif(azimuthRotation + leaf.azimuth / PI);
      float tri2 = trif(thetaRotation + (PI + leaf.theta) / PI);
      float tri = max(tri1, tri2);
      setColor(leaf.index, LXColor.gray(100 * tri * tri));
    }
  }
  private float trif(double t){
    t =t -Math.floor(t);
    if(t<0.25){
      return (float) t*4;
    }else if(t<0.75){
      return (float)(1-4*(t-0.25));
    }else{
      return (float) (-1+4*(t-0.75));
    }

  }
}
public class PatternScanner extends TenerePattern {
  public String getAuthor() {
    return "Mark C. Slee";
  }
  
  public final CompoundParameter speed = (CompoundParameter)
    new CompoundParameter("Speed", .5, -1, 1)
    .setPolarity(LXParameter.Polarity.BIPOLAR)
    .setDescription("Speed that the plane moves at");
    
  public final CompoundParameter sharp = (CompoundParameter)
    new CompoundParameter("Sharp", 0, -50, 150)
    .setDescription("Sharpness of the falling plane")
    .setExponent(2);
    
  public final CompoundParameter xSlope = (CompoundParameter)
    new CompoundParameter("XSlope", 0, -1, 1)
    .setDescription("Slope on the X-axis");
    
  public final CompoundParameter zSlope = (CompoundParameter)
    new CompoundParameter("ZSlope", 0, -1, 1)
    .setDescription("Slope on the Z-axis");
  
  private float basis = 0;
  
  public PatternScanner(LX lx) {
    super(lx);
    addParameter("speed", this.speed);
    addParameter("sharp", this.sharp);
    addParameter("xSlope", this.xSlope);
    addParameter("zSlope", this.zSlope);
  }
  
  public void run(double deltaMs) {
    float speed = this.speed.getValuef();
    speed = speed * speed * ((speed < 0) ? -1 : 1);
    float sharp = this.sharp.getValuef();
    float xSlope = this.xSlope.getValuef();
    float zSlope = this.zSlope.getValuef();
    this.basis = (float) (this.basis - .001 * speed * deltaMs) % 1.;
    for (LXPoint leaf : model.points) {
      setColor(leaf.index, LXColor.gray(max(0, 50 - sharp + (50 + sharp) * LXUtils.trif(leaf.yn + this.basis + (leaf.xn-.5) * xSlope + (leaf.zn-.5) * zSlope))))  ;
    }
  }
}


public class AtomPattern extends TenerePattern {
  // by Justin Belcher
  //
  // Note: The fun parameters are at the end.  Check out Wobble Width, Wobble Frequency, and Wander.
   
  private static final float RADIANS_PER_REVOLUTION = 2.0f;
  private static final int NUMBER_OF_ELECTRONS = 2;

  //Overall parameters
  public final CompoundParameter nucleusSize =
    new CompoundParameter("SizeNucleus", 0.45, 0, 1)
    .setDescription("Size of the nucleus, relative to structure");
  public final CompoundParameter nucleusHue = 
    new CompoundParameter("HueNucleus", LXColor.h(LXColor.RED), 0, 360)
    .setDescription("Color hue of nucleus");
  
  LXTransform transform1;
  float structureRadius;
    
  public AtomPattern(LX lx) {
    super(lx);

    addParameter(nucleusSize);
    addParameter(nucleusHue);
    
    //Center the pattern in the middle of all points
    transform1=new LXTransform();
    transform1.translate(lx.cx, lx.cy, 0);
    
    //Calculate structure size, as size parameters in this pattern are a percentage of the entire structure
    structureRadius = Math.max(model.xRange, model.yRange) / 2;
    
    //Electrons
    for (int i = 1; i <= NUMBER_OF_ELECTRONS; i++) {
      
      ElectronLayer electronLayer = new ElectronLayer(lx, this, transform1); 
      addLayer(electronLayer);
      
      //Initialize electron parameters
      electronLayer.enableElectron.setValue((i == 1) ? true : false);      //Only one electron visible to start
      electronLayer.pathRadius.setValue(Math.max(1.0 - (0.25 * i), 0.2));  //Stagger the path radius
      electronLayer.hueShift.setValue(((i-1)*115)%360);                    //Offset the color of each electron
      electronLayer.velocity.setValue(i*110);                              //inner electrons run faster
      electronLayer.tilt.setValue(((i-1)*60)%180);                         //Offset the tilt of each electron
      electronLayer.orient.setValue(((i-1)*60)%360);                       //Offset the orientation of each electron
      
      //Add the electron parameters to the Atom pattern
      addParameter(electronLayer.enableElectron.getLabel() + i, electronLayer.enableElectron);
      addParameter(electronLayer.pathRadius.getLabel() + i, electronLayer.pathRadius);
      addParameter(electronLayer.electronSize.getLabel() + i, electronLayer.electronSize);
      addParameter(electronLayer.hueShift.getLabel() + i, electronLayer.hueShift);
      addParameter(electronLayer.tailLength.getLabel() + i, electronLayer.tailLength);
      addParameter(electronLayer.tailHueOffset.getLabel() + i, electronLayer.tailHueOffset);
      addParameter(electronLayer.velocity.getLabel() + i, electronLayer.velocity);
      addParameter(electronLayer.tilt.getLabel() + i, electronLayer.tilt);
      addParameter(electronLayer.spin.getLabel() + i, electronLayer.spin);
      addParameter(electronLayer.orient.getLabel() + i, electronLayer.orient);
      addParameter(electronLayer.wobbleWidth.getLabel() + i, electronLayer.wobbleWidth);
      addParameter(electronLayer.wobbleFrequency.getLabel() + i, electronLayer.wobbleFrequency);
      addParameter(electronLayer.wander.getLabel() + i, electronLayer.wander);
    }
  }
  
  public String getAuthor()
  {
    return "Justin Belcher";
  }  

  @Override
  protected void run(double deltaMs) {
        
    setColors(LXColor.BLACK);
    
    //Nucleus calculations
    float nucleusRadius = structureRadius * this.nucleusSize.getValuef();
    LXVector nucleusPos = this.transform1.vector();
    int nucleusColor = LXColor.hsb(this.nucleusHue.getValuef(), 100, 100);
    
    for (LXPoint p : model.points) {
      //Draw nucleus
      float distToNucleus = dist(nucleusPos, p);      
      if (distToNucleus<nucleusRadius) {
        //Point is within nucleus
        colors[p.index] = nucleusColor;
      }      
    }
    
    //Electrons will be drawn by the child layers
  }
  
  protected float dist(LXVector vector, LXPoint point) {
    float dx = vector.x - point.x;
    float dy = vector.y - point.y;
    float dz = vector.z - point.z;
    return (float) Math.sqrt(dx*dx + dy*dy + dz*dz);
  }
  
  //////////////////////////////////////////////////////////////////////////
  private class ElectronLayer extends LXLayer {
    
    private static final float MAX_TAIL_BRIGHTNESS = 0.85f;

    public AtomPattern parent;

    //Basic Electron Properties
    public final BooleanParameter enableElectron =
      new BooleanParameter("Enable")
      .setDescription("Turn this electron on/off")
      .setMode(BooleanParameter.Mode.TOGGLE);
    public final CompoundParameter pathRadius =
      new CompoundParameter("RadiusElectron", 0.8, 0, 1)
      .setDescription("Radius of electrons path");
    public final CompoundParameter electronSize =
      new CompoundParameter("SizeElectron", 0.2, 0, 1)
      .setDescription("Size of electron, relative to structure");
    public final CompoundParameter hueShift = 
      new CompoundParameter("HueShift", 0, 0, 360)
      .setDescription("Offset the electron's color from the global palette to distinguish it from the others");    
    public final CompoundParameter tailLength =
      new CompoundParameter("TailLength", 0.95, 0, 1.3)
      .setDescription("Duration of comet-like tail, in seconds");
    public final CompoundParameter tailHueOffset = 
      new CompoundParameter("TailHueShift", 60, 0, 360)
      .setDescription("Tail hue offset amount, relative to electron.");
    //Simple behavior
    public final CompoundParameter velocity =
      new CompoundParameter("RPM", 80, 0, 1000)
      .setDescription("Velocity (RPM) of electron on its primary path");
    public final CompoundParameter tilt = 
      new CompoundParameter("Tilt", 0, 0, 180)
      .setDescription("Tilt the overall animation.  Good for offsetting the positions of different electrons.");
    public final CompoundParameter spin =
      new CompoundParameter("Spin", 0, 0, 1000)
      .setDescription("Spin has the same effect as tilt but it is continuous. To change the electron speed use RPM.");  
    public final CompoundParameter orient = 
      new CompoundParameter("Orient", 0, 0, 360)
      .setDescription("Orient the path.  Effect is only visible when tilt is not flat.");
    //Fun behavior
    public final CompoundParameter wobbleWidth =
      new CompoundParameter("WobWid", 26, 0, 110)
      .setDescription("Width of the wobble in degrees. 0=no wobble.");
    public final CompoundParameter wobbleFrequency =
      new CompoundParameter("WobFreq", 0.05, 0, 0.5)
      .setDescription("Frequency of wobble, relative to electron revolutions"); 
    public final CompoundParameter wander =
      new CompoundParameter("Wander", 0, 0, 180)
      .setDescription("How much would you wander if you were an electron right now?");
    
    //To-Do: For very slow electron speed, we need the period to be a lot longer. Use FunctionalParameter for period.
    //x=200, y=1600.  x=5, y=4000?
    private final LXModulator wanderLFO = startModulator(new TriangleLFO(0, this.wander, 1600));
        
    LXTransform transform1;
    private float positionElectron = 0;
    private float positionSpin = 0;
    private float positionWobble = 0;
    private HashMap<LXPoint, TailPoint> tailPoints = new HashMap<LXPoint, TailPoint>();
    
    private ElectronLayer(LX lx, AtomPattern parent, LXTransform transform) { 
      super(lx);
      this.parent = parent;
      this.transform1 = transform;
    }
    
    protected double previousFrame = 0;
    
    public void run(double deltaMs) {
      
      if (!this.enableElectron.getValueb())
        return;
      
      //Electron calculations
      float tilt = this.tilt.getValuef();
      float spin = this.spin.getValuef();
      float orient = this.orient.getValuef();
      float pRadius = this.parent.structureRadius * this.pathRadius.getValuef();
      float eSize = this.parent.structureRadius * this.electronSize.getValuef();
      float hueShift = this.hueShift.getValuef();
      float velocity = this.velocity.getValuef();
      //WobbleWidth: Theoretical parameter range is 0-180 but we divide that by two because for every degree we tilt the effect is doubled.
      //  In practice the max value is limited on input because the electron behavior gets weird (turns into a sine wave) at high values.
      double wobbleWidthRadians = Math.toRadians((180 - this.wobbleWidth.getValuef()) / 2.0);
      float wobbleVelocity = velocity * (this.wobbleFrequency.getValuef());
      //Reduce electron velocity to compensate for speed added by wobble velocity.
      velocity -= (Math.sin(wobbleWidthRadians)*wobbleVelocity);
      float tailLength = this.tailLength.getValuef();
      float tailHueOffset = this.tailHueOffset.getValuef();
      //"Wander" is created by oscillating a pre-position rotation around the Z-axis.  Why does it work?  Magic.
      float wanderLFO = this.wanderLFO.getValuef();        
      
      //Increment positions for the speed parameters
      this.positionElectron += velocity*RADIANS_PER_REVOLUTION/60.0/1000.0*deltaMs;
      this.positionSpin += spin*RADIANS_PER_REVOLUTION/60.0/1000.0*deltaMs;
      this.positionWobble += wobbleVelocity*RADIANS_PER_REVOLUTION/60.0/1000.0*deltaMs;
      //These positions can run for a long time without mod but they would probably eventually overflow.
      this.positionElectron %= 360.0;
      this.positionSpin %= 360.0;
      this.positionWobble %= 360.0;
      
      //Calculate position of electron through a series of nested rotations.
      //*This might run faster by keeping multiple transforms and multiplying their
      // matrices together, instead of using multiple push/pop layers for each frame.
      // However the run speed is fine for now.
      
      //Pre-spinning orientation.  Includes the wander effect.
      this.transform1.push();
      this.transform1.rotateY(Math.toRadians(orient));
      this.transform1.rotateZ(Math.toRadians(tilt));
      this.transform1.rotateZ(Math.toRadians(this.positionSpin));
      this.transform1.rotateZ(Math.toRadians(wanderLFO));
      //Wobble speed.
      this.transform1.push();
      this.transform1.rotateY(this.positionWobble);
      //WobbleWidth.
      this.transform1.push();
      this.transform1.rotateZ(wobbleWidthRadians);
      //Electron position, determined by electron velocity divided by elapsed time.
      this.transform1.push();
      this.transform1.rotateX(this.positionElectron);
      //Radius of electron's path
      this.transform1.push();
      this.transform1.translate(0, pRadius, 0);
          
      //Center of electron
      LXVector ePos = this.transform1.vector();

      //Draw tail 
      Iterator<Map.Entry<LXPoint, TailPoint>> tailIterator = this.tailPoints.entrySet().iterator();
      while(tailIterator.hasNext()) {
        Map.Entry<LXPoint, TailPoint> entry = tailIterator.next();
        double remainingPercent = (entry.getValue().endTime - this.parent.runMs) / entry.getValue().lifeTime;
        if (remainingPercent <= 0) {
          //Tail point has exceeded lifetime.  Remove from collection.
          tailIterator.remove();
        } else {
          //Render tail with its original color, not the current color for that position.
          colors[entry.getKey().index] = LXColor.scaleBrightness(entry.getValue().c, (float)remainingPercent * MAX_TAIL_BRIGHTNESS);
        }
      }
      
      for (LXPoint p : model.points) {
            
        //Draw electron
        float distToElectron = dist(ePos, p);
        if (distToElectron<eSize) {
          
          //Point is within the electron
          //Fade the outer 10% to make a soft edge.
          float pointPercentile = (eSize - distToElectron) / eSize;
          double brightness = (pointPercentile > 0.1f) ? 100f : pointPercentile / 0.1f * 100f;
          int pointColor = OffsetColor(palette.getColor( brightness), hueShift); 
          colors[p.index] = pointColor;
          
          //Add point to list of TailPoints so it can be faded out gradually
          if (this.tailPoints.containsKey(p)) {
            TailPoint thisTailPoint = this.tailPoints.get(p);
            
            //Tailpoint is already lit.  But is it from this pass or did the electron catch its tail?          
            if (thisTailPoint.mostRecentFrame == this.previousFrame) {
              //Tailpoint is from this pass, ie it has never left electron.
              thisTailPoint.mostRecentFrame = this.previousFrame;
              //If it is closer to center than the last frame, then recalculate its lifetime to last longer.
              //This creates the tapered tail effect.
              if (distToElectron<thisTailPoint.distToElectron) {
                thisTailPoint.distToElectron = distToElectron;
                thisTailPoint.lifeTime = CalcTailLifetime(eSize, tailLength, distToElectron);
                thisTailPoint.endTime = this.parent.runMs + thisTailPoint.lifeTime;
              }
            } else {
              //Tailpoint is from a previous pass.  Make a new one.
              TailPoint newTailPoint = new TailPoint(OffsetColor(pointColor, tailHueOffset), distToElectron, this.parent.runMs, CalcTailLifetime(eSize, tailLength, distToElectron));
              this.tailPoints.put(p, newTailPoint);            
            }
          } else {
            //No tailpoint existed for this point.
              TailPoint newTailPoint = new TailPoint(OffsetColor(pointColor, tailHueOffset), distToElectron, this.parent.runMs, CalcTailLifetime(eSize, tailLength, distToElectron));
              this.tailPoints.put(p, newTailPoint);
          }          
          
        } 
      }  
      
      //Undo all positioning except for original center location
      this.transform1.pop();
      this.transform1.pop();
      this.transform1.pop();
      this.transform1.pop();
      this.transform1.pop();
      
      //Track the previous frame for use in tapered tail calculations.
      //Use runMs as an ID for the frame.
      this.previousFrame = this.parent.runMs;
    }
    
    protected int OffsetColor(int pointColor, float hueOffset) {
      return LXColor.hsb((LXColor.h(pointColor) + hueOffset) % 360, LXColor.s(pointColor), LXColor.b(pointColor));  
    }
    
    protected double CalcTailLifetime(float eSize, float tailLength, float distToElectron) {
      //Points closer to the center of the electron will have a longer lifetime.
      //This creates a tapered tail.
      return tailLength * 1000 * (eSize-distToElectron)/eSize;    
    }
    
  }
  
  //////////////////////////////////////////////////////////////////////////  
  private class TailPoint {
    protected int c;
    protected float distToElectron;
    protected double mostRecentFrame;
    protected double lifeTime;
    protected double endTime;
    
    TailPoint (int c, float distToElectron, double mostRecentFrame, double lifeTime) {
      this.c = c;
      this.distToElectron = distToElectron;
      this.mostRecentFrame = mostRecentFrame;
      this.lifeTime = lifeTime;
      this.endTime = mostRecentFrame + lifeTime;      
    }
  }
}