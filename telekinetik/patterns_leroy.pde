//import heronarts.lx.LX;
//import heronarts.lx.LXPattern;
//import heronarts.lx.modulator.SawLFO;
//import heronarts.lx.parameter.CompoundParameter;
//import heronarts.lx.parameter.FunctionalParameter;

//public class WhereTheDickAt extends BlendPattern {
//    public WhereTheDickAt(LX lx) {
//        super(lx);
//        for(Integer i=0;i<20;++i){
//            layers.put(i, new OldProbabilityFadeLayer(lx, WhereTheDickAt.this, i,i*333));
//        }
//        instantiate();
//    }
//}

///*
//Generates a probabilistically determined symmetrical pattern for each target
//*/
//protected class OldProbabilityFadeLayer extends FadeLayer{
//    //Used for scaling the ring activation probability
//    private int activeRings;

//    private OldProbabilityFadeLayer(LX lx, BlendPattern pattern, int layer_num, float delay){
//        super(lx,pattern,layer_num,delay);
//        this.activeRings = 0;
//    }

//    /*
//    Probabilistically generates a target set of LXPoints
//    TODO: Refine probability function and parameterise
//    */
//    protected void generateTarget(){
//        target = new ArrayList<LXPoint>();
//        for(int ring = 0;ring < 5; ++ring){
//            if((int)random(0,100)>(50+10*activeRings)){
//                addTargetRing(ring);
//            }
//        }
//        //Prevent completely dark layers
//        if(activeRings == 0){
//            generateTarget();
//            return;
//        }
//        activeRings = 0;
//    }

//    //Adds a symmetrical subset of a ring to the target, chance of ring not being added
//    private void addTargetRing(int ring){
//        int mod;
//        mod = (ring==0||ring==4)?(int)random(0,3):(int)random(0,5);
//        if(mod==0){
//            return;
//        }
//        if(mod==5){
//            mod=6;
//        }
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();
//        int rot = (int)random(1,6);
//        //TODO: Parameterise to create different symmetries for different subsets of panels
//        for(MEMPanel mp : tcr.mem_panels){
//            temp.addAll(mp.getSymmetricPoints(
//                ring,
//                mod,
//                rot
//            ));
//        }
//        this.target.addAll(temp);
//        activeRings++;
//    }
//}

//public class VividSetSelector extends LXPattern{
//    private HashMap<Integer, int[]> panel_set = new HashMap<Integer, int[]>();
//    CompoundParameter group = new CompoundParameter("Group",0,0,23);
//    private CompoundParameter period = new CompoundParameter("Transition period",1000, 300, 5000);
//    private LXModulator lfo;

//    private int previous=0, next=0;
//    private boolean selector_lock = false;
//    public VividSetSelector(LX lx){
//        super(lx);
//        addParameter("Group",this.group);
//        addParameter("transition period", this.period);

//        panel_set.put(0,new int[]{0,1,2,3,4,5,6,7,8});
//        panel_set.put(1,new int[]{1,2,3,4,5,6,7,8});
//        panel_set.put(2,new int[]{0});
//        panel_set.put(3,new int[]{1,6,3,4});
//        panel_set.put(4,new int[]{0,2,5,7,8});
//        panel_set.put(5,new int[]{2,5,7,8});
//        panel_set.put(6,new int[]{0,1,3,4,6});
//        panel_set.put(7,new int[]{7,1,2});
//        panel_set.put(8,new int[]{6,0,3});
//        panel_set.put(9,new int[]{1,2,4,5,7,8});
//        panel_set.put(10,new int[]{5,4,8});
//        panel_set.put(11,new int[]{7,6,5});
//        panel_set.put(12,new int[]{1,0,4});
//        panel_set.put(13,new int[]{2,3,5,6,7,8});
//        panel_set.put(14,new int[]{2,3,8});
//        panel_set.put(15,new int[]{0});
//        panel_set.put(16,new int[]{1});
//        panel_set.put(17,new int[]{2});
//        panel_set.put(18,new int[]{3});
//        panel_set.put(19,new int[]{4});
//        panel_set.put(20,new int[]{5});
//        panel_set.put(21,new int[]{6});
//        panel_set.put(22,new int[]{7});
//        panel_set.put(23,new int[]{8});
//    }

//    private boolean newTarget(){
//        int selected = (int)Math.round(this.group.getValuef());
//        if(next == selected){
//            return false;
//        }
//        previous = next;
//        next = selected;

//        return true;
//    }

//    public void run(double deltams){
//        setColors(#000000);
//        if(selector_lock){
//            for(int i=0;i<panel_set.get(next).length;++i){
//                MEMPanel mp = tcr.vivid.panels.get(panel_set.get(next)[i]);
//                for(LXPoint p :  mp.getPoints()){
//                    setColor(p.index, LXColor.gray(lfo.getValuef()));
//                }
//            }
//            for(int i=0;i<panel_set.get(previous).length;++i){
//                MEMPanel mp = tcr.vivid.panels.get(panel_set.get(previous)[i]);
//                for(LXPoint p :  mp.getPoints()){
//                    setColor(p.index, LXColor.gray(100.0-lfo.getValuef()));
//                }
//            }
            
//            //Set at low enough value so run frame wont overshoot window
//            if(lfo.getValuef() > 97.0){
//                selector_lock = false;
//            }else{
//                return;
//            }
//        }

//        if(!newTarget()){
//            for(int i=0;i<panel_set.get(next).length;++i){
//                MEMPanel mp = tcr.vivid.panels.get(panel_set.get(next)[i]);
//                for(LXPoint p :  mp.getPoints()){
//                    setColor(p.index, #FFFFFF);
//                }
//            }
//            return;
//        }else{
//            selector_lock = true;
//            lfo = startModulator(
//            new SinLFO(
//                0, 
//                100.0, 
//                period
//                )
//            );
//        }
//    }
//}

//public class ExamplePattern extends BlendPattern {
//    CompoundParameter extra_parameter = new CompoundParameter("some thing random",5,0,10.0);

//    public ExamplePattern(LX lx) {
//        super(lx);
//        addParameter("extra", this.extra_parameter);
//        // this.layers 
//        for(int i=0;i<5;++i){
//            layers.put(i, new ExampleLayer(lx, ExamplePattern.this, i,i*333, extra_parameter));
//        }
//        instantiate();
//    }
//    public String proofOfLife(){
//        return "This works";
//    }
//}

//protected class ExampleLayer extends FadeLayer{

//    protected ExamplePattern new_pattern;
//    CompoundParameter extra_parameter;

//    private ExampleLayer(LX lx, ExamplePattern pattern, int layer_num, int delay, CompoundParameter extra){
//        super(lx,pattern,layer_num,delay);
//        this.new_pattern = pattern;
//        this.extra_parameter = extra;
//    }
//    protected void generateTarget(){
//        this.target.addAll(model.getPoints());
//        float p=0;
//        int n = 0;
//        int access =0;
//        String pol = "";
//        //Seems generateTarget is called prior to some instantiation somehow
//        try{
//            p = this.extra_parameter.getValuef();
//            n =  this.getLayerNum();
//            access = this.new_pattern.layers.get(3).getLayerNum();
//            pol = this.new_pattern.proofOfLife();

//        }catch(NullPointerException e){}
//        println(
//            "This active layer is: \t"+
//            n+
//            "\nThe 3rd layer's number is: \t"+
//            access+
//            "\nProof of custom method call: \t"+pol+
//            "\nNew parameter value: \t"+p
//            );
//    }
//}

//public class RingFader extends BlendPattern {
//    public RingFader(LX lx) {
//        super(lx);
//        for(Integer i=0;i<4;++i){
//            layers.put(i, new RingFadeLayer(lx, RingFader.this, i,i*333));
//        }
//        instantiate();
//    }
//}
//protected class RingFadeLayer extends FadeLayer{
//    private int previous_ring_target=0;
//    private boolean active_flag = false;
//    private boolean reverse_flag = false;
//    private RingFadeLayer(LX lx, BlendPattern pattern, int layer_num, float delay){
//        super(lx,pattern,layer_num,delay);
//        for(LXPoint p : model.points){
//            colourBuffer.put(p,0);
//        }
//    }
//    protected void generateTarget(){
//        // println("Getting called, layer num :\t"+getLayerNum());
//        this.target = new ArrayList<LXPoint>();
//        if(active_flag){
//            return;
//        }
//        // active_flag = true;
//        for(MEMPanel mp : tcr.mem_panels){
//            this.target.addAll(mp.getSymmetricPoints(
//                this.previous_ring_target + getLayerNum(),
//                1,
//                0
//            ));
//        }

//        if(previous_ring_target==4){
//            reverse_flag=true;
//        }
//        if(previous_ring_target==0){
//            reverse_flag=false;
//        }
//        if(reverse_flag){
//            previous_ring_target--;
//        }else{
//            previous_ring_target++;
//        }

//    }
//    //potentially irrelevant 
//    public void run(double deltams){
//        //Delay the start of the oscillator\
//        if(deltams < delay){
//            this.delay-=deltams;
//            return;
//        }
//        //Start the oscillator
//        if(!this.start_flag){
//            this.start_flag = true;
//            startLFO();
//        }
//        for(LXPoint p : getTarget()){
//            updateColourBuffer(p);
//        }
//        if(fadeModulator.getValuef()>90){
//            active_flag = false;
//        }
//        if(fadeModulator.getValuef()<1){
//            if(!active_flag){
//                for(LXPoint p : model.points){
//                    colourBuffer.put(p,0);
//                }
//                generateTarget();
//                active_flag = true;
//            }     
//        }
//    }
//}

//public class Jenkins extends BlendPattern {
//    CompoundParameter active_layers = new CompoundParameter("Density",15,0,100);
//    public Jenkins(LX lx) {
//        super(lx);
//        addParameter("Density", this.active_layers);
//        for(Integer i=0;i<100;++i){
//            layers.put(i, new ProbabilityFadeLayer(lx, Jenkins.this, i,i*333));
//        }
//        instantiate();
//    }
//    protected int numberLayersOff(){
//        return (int)Math.round(this.active_layers.getValuef());
//    }
//}

///*
//Generates a probabilistically determined symmetrical pattern for each target
//*/
//protected class ProbabilityFadeLayer extends FadeLayer{
//    //Used for scaling the ring activation probability
//    private int activeRings;
//    int active_panels = 0;
//    private ArrayList<MEMPanel> panels;
//    private boolean render_flag = true;


//    private ProbabilityFadeLayer(LX lx, BlendPattern pattern, int layer_num, float delay){
//        super(lx,pattern,layer_num,delay);
//        this.activeRings = 0;
//        this.active_panels = 0;
//        this.panels = new ArrayList<MEMPanel>();
//    }

//    /*
//    Probabilistically generates a target set of LXPoints
//    TODO: Refine probability function and parameterise
//    */
//    protected void generateTarget(){
//        Jenkins pattern = (Jenkins)this.pattern;
//        int number_off = (int)pattern.numberLayersOff();
//        //Determine which layers to avoid rendering
//        if(this.layer_number>number_off){
//            this.render_flag = false;
//            return;
//        } else {
//            this.render_flag = true;
//        }
//        target = new ArrayList<LXPoint>();

//        for(int i=0;i<3;++i){
//            if((int)random(0,100)>(50+10*active_panels)){
//                addPanel(i);
//            }
//        }

//        for(int ring = 0;ring < 5; ++ring){
//            if((int)random(0,100)>(50+10*activeRings)){
//                addTargetRing(ring);
//            }
//        }
//        //Prevent completely dark layers
//        if(activeRings == 0){
//            generateTarget();
//            return;
//        }
//        activeRings = 0;
//        active_panels = 0;
//        this.panels = new ArrayList<MEMPanel>();
//    }
//    //Adds a symmetrical subset of a panel array to the target panel set, chance of "ring" not being added
//    private void addPanel(int ring){
//        int mod=0, rot=0;

//        switch(ring){
//            case 0: mod = (int)random(0,2); break;
//            case 1: mod = (int)random(0,4); break;
//            case 2: mod = (int)random(0,2); break;
//        }

//        if(mod==0){
//            return;
//        }

//        ArrayList<MEMPanel> temp = new ArrayList<MEMPanel>();
//        rot = (ring==1)?(int)random(1,3):0;
//        try{
//            this.panels.addAll(tcr.vivid.getSymmetricPanels(
//                ring,
//                mod,
//                rot
//            ));
//        }catch(NullPointerException e){}
//        active_panels++;
//    }

//    //Adds a symmetrical subset of a ring to the target, chance of ring not being added
//    private void addTargetRing(int ring){
//        int mod;
//        mod = (ring==0||ring==4)?(int)random(0,4):(int)random(0,7);
//        if(mod==0){
//            return;
//        }
//        if(mod==5){
//            mod=6;
//        }
//        ArrayList<LXPoint> temp = new ArrayList<LXPoint>();
//        int rot = (int)random(1,6);
//        if(this.panels != null){
//            for(MEMPanel mp : this.panels){
//                temp.addAll(mp.getSymmetricPoints(
//                    ring,
//                    mod,
//                    rot
//                ));
//            }
//        }
//        this.target.addAll(temp);
//        activeRings++;
//    }

//    protected void updateColourBuffer(LXPoint p){
//        if(!this.render_flag){
//            this.colourBuffer.put(p,#000000);
//        } else{
//            this.colourBuffer.put(
//                p,
//                LXColor.hsba(
//                    getHue(),
//                    pattern.saturation.getValuef(),
//                    fadeModulator.getValuef(),
//                    pattern.alpha.getValuef()
//                )
//            );
//        }
//    }
//}

///*
//Extend the Blend pattern and add FadeLayers to the layers hashmap. Call the instatiate() method after doing so. See Jenkins pattern for implementation example.
//*/
//protected abstract class BlendPattern extends LXPattern{
//    public HashMap<Integer, FadeLayer> layers 
//                = new HashMap<Integer, FadeLayer>();
//    public final CompoundParameter modulator_period 
//                = new CompoundParameter("modulator Period", 3000,200,10000);
//    public final CompoundParameter hue
//                = new CompoundParameter("hue", 265,0,360);
//    public final CompoundParameter hue_spread 
//                = new CompoundParameter("hue spread",90,0,360);
//    //TODO: Play with variance of saturation values across layers
//    public final CompoundParameter saturation 
//                = new CompoundParameter("saturation", 100,0,100);
//    //TODO: Play with variance of alpha values across layers
//    public final CompoundParameter alpha 
//                = new CompoundParameter("alpha", 1.0,0,1.0);

//    public BlendPattern(LX lx){
//        super(lx);
//        addParameter("modulator Period", this.modulator_period);
//        addParameter("hue", this.hue);
//        addParameter("hue spread", this.hue_spread);
//        addParameter("saturation", this.saturation);
//        addParameter("alpha", this.alpha);
//    }

//    protected void instantiate(){
//        for(FadeLayer l : layers.values()){
//            addLayer(l);
//        }
//    }

//    /*
//    Calculates the LXPoint colour from the buffers of the layers
//    return: int representing a colour value
//    */
//    protected int calcColour(LXPoint p){
//        ArrayList<Integer> layer_colours = new ArrayList<Integer>();
//        for(FadeLayer l : layers.values()){
//            int argb = l.getColour(p);
//            if(argb != 0){
//                layer_colours.add(argb);
//            }
//        }
//        switch(layer_colours.size()){
//            case 0: return 0;
//            case 1: return layer_colours.get(0);
//            default:
//        }
//        //Cumulative blend, Lightest blend option has best aesthetic
//        int accumulator = layer_colours.get(0);
//        for(int i=1;i<layer_colours.size();++i){
//            accumulator = LXColor.blend(
//                layer_colours.get(i),
//                accumulator, 
//                LXColor.Blend.LIGHTEST
//                );
//        }
//        return accumulator;
//    }

//    public void run(double deltaMs) {
//        setColors(#000000);
//        for(LXPoint p : model.points){
//            setColor(p.index,calcColour(p));
//        }
//    }
//}

///*
//When extending the fade layer, all that needs to be done is implement the generateTarget() method; i.e. update the target to be faded onto after a complete LFO oscillation in the layer. 
//*/
//protected abstract class FadeLayer extends LXLayer{
//    protected int layer_number;
//    //Pattern the layer sits in
//    protected BlendPattern pattern;
//    //The modulator driving the brightness of the layer
//    protected LXModulator fadeModulator = null;
//    //argb colour value for each LXPoint
//    protected HashMap<LXPoint, Integer> colourBuffer = new HashMap<LXPoint, Integer>();
//    //Offset the layers in time against one another
//    protected double delay;
//    protected boolean start_flag = false;
//    //The target set of LXPoints that we wish to drive onto
//    protected ArrayList<LXPoint> target = new ArrayList<LXPoint>();

//    private FadeLayer(LX lx, BlendPattern pattern, int layer_number, double delay ){
//        super(lx);
//        this.pattern        = pattern;
//        this.layer_number   = layer_number;
//        this.delay          = delay;
//        instantiate();
//    }

//    public void instantiate(){
//        generateTarget();
//        for(LXPoint p : model.points){
//            colourBuffer.put(p,0);
//        }
//    }

//    protected abstract void generateTarget();

//    /*
//    Hue is determined per layer based upon it's number with respect to the pattern's core hue value
//    */
//    protected float getHue(){
//        return (pattern.hue.getValuef()+(pattern.hue_spread.getValuef()/(getLayerNum()+1)))%360;
//    }

//    //Reimplement when extending Fadelayer if you want intra-layer colour manipulation
//    protected void updateColourBuffer(LXPoint p){
//        this.colourBuffer.put(
//            p,
//            LXColor.hsba(
//                getHue(),
//                pattern.saturation.getValuef(),
//                fadeModulator.getValuef(),
//                pattern.alpha.getValuef()/(layer_number+1)
//            )
//        );
//    }
//    protected int getColour(LXPoint p){
//        return colourBuffer.get(p);
//    }

//    public int getLayerNum(){
//        return layer_number;
//    }

//    /*
//    Called to offset the layers in time
//    TODO: Runtime modifiable LFO alteration
//    */
//    protected void startLFO(){
//        this.fadeModulator = startModulator(
//        new SinLFO(
//            0, 
//            100.0, 
//            pattern.modulator_period)
//        );
//    }

//    public List<LXPoint> getTarget(){
//        return this.target;
//    }

//    public void run(double deltams){
//        //Delay the start of the oscillator
//        if(deltams < delay){
//            this.delay-=deltams;
//            return;
//        }
//        //Start the oscillator
//        if(!this.start_flag){
//            this.start_flag = true;
//            startLFO();
//        }
//        for(LXPoint p : getTarget()){
//            updateColourBuffer(p);
//        }
//        if(fadeModulator.getValuef()<1){
//            generateTarget();
//        }
//    }
//}