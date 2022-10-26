import java.util.List;
import java.util.HashSet;
import java.util.Arrays;

public class MEMPanel extends ImportFixture {

    private List<ArrayList<LXPoint>> rings = new ArrayList();

    public MEMPanel(List<int[]> mapping,float[] origin, float[] orient,float scale,int ppm){
        super(mapping, origin, orient, scale, ppm);
        
        JSONArray arr = loadJSONArray("vivid_rings.json");
        assert(arr.size() == 5);
        
        for(int i=0;i<5;++i){
            int [] ring = arr.getJSONArray(i).getIntArray();
            rings.add(new ArrayList());
            for (int j=0; j < ring.length; ++j) {
                rings.get(i).add(points.get(ring[j]));
            }
        }
    }

    public ArrayList<LXPoint> getSymmetricPoints(int[] ring, int[] modulo, int[] rotation){
        ArrayList<LXPoint> out = new ArrayList();
        for(int i=0;i<ring.length;++i){
            out.addAll(getSym(ring[i],modulo[i],rotation[i]));
        }
        return out;
    }
    public ArrayList<LXPoint> getSymmetricPoints(int ring, int modulo, int rotation){
        ArrayList<LXPoint> out = new ArrayList();
        out.addAll(getSym(ring,modulo,rotation));
        return out;
    }

    private ArrayList<LXPoint> getSym(int ring, int mod, int rot){
        if (mod == 0) {
            return new ArrayList<LXPoint>();
        }
        ArrayList<LXPoint> out = new ArrayList();
        int ringnum = (ring==0||ring==4)?6:12;
        for(int i=0;i<ringnum;++i){
            try{
                LXPoint p = rings.get(ring).get(i);
                if(p == null){
                    continue;
                }
                if((i-rot)%mod==0){
                    out.add(p);
                }
            }catch(Exception e){
            // System.out.println("Exception; ring"+ring+"clock"+i);
            }
        }
        return out;
    }
}

public class PanelGraph {
        ////PANEL GRAPH WILL LOOK LIKE THIS when loaded from model.json
        ////  null  null  panel null  null
        ////  null  panel null  panel null
        ////  panel null  panel null  panel
        ////  null  panel null  panel null
        ////  null  null  panel null  panel
        
        // or in coodinates:
        //             (0,2)            
        //       (1,1)       (1,3)      
        // (2,0)       (2,2)       (2,4)
        //       (3,1)       (3,3)      
        //             (4,2)            
  
  MEMPanel [][] panels;
  
  public PanelGraph(MEMPanel[][] panels) {
    this.panels = panels;
  }
  
  public MEMPanel getCenter() {
    return panels[2][2];
  }
  
  public MEMPanel getMEMPanel(int x, int y) {
    return panels[x][y];
  }
  
  public List<MEMPanel> getSymmetricPanels(int rot, int mod) {
    List<MEMPanel> retval = new ArrayList<MEMPanel>();
    class PanelTuple {
      public PanelTuple(int x,int y) { this.x = x; this.y = y;};
      public int x;
      public int y;
    }
    List<PanelTuple> ring = new ArrayList<PanelTuple>();
    // ring.add(new PanelTuple(0,2));
    ring.add(new PanelTuple(1,1));
    ring.add(new PanelTuple(2,0));
    ring.add(new PanelTuple(3,1));
    // ring.add(new PanelTuple(4,2));
    ring.add(new PanelTuple(3,3));
    ring.add(new PanelTuple(2,4));
    ring.add(new PanelTuple(1,3));

    for (int i=0; i< ring.size(); ++i) {
      if (i-rot%mod==0) {
        retval.add(panels[ring.get(i).x][ring.get(i).y]);
      }
    }
    
    return retval;
  }
}

public class VividArray implements LXFixture {
    public List<MEMPanel> panels = new ArrayList<MEMPanel>();
    public HashMap<Integer, ArrayList<MEMPanel>> rings = new HashMap<Integer, ArrayList<MEMPanel>>();
    public PanelGraph panelGraph;
    
    public VividArray(){
        MEMPanel tmpPanelGraph[][] = new MEMPanel[5][5];
        JSONObject vividConfig = loadJSONObject("model.json");
        JSONArray config = vividConfig.getJSONArray("vividarray");
        int ringCount = vividConfig.getInt("ringCount");

        for (int i =0; i < ringCount; ++i) {
          // rings.put(i,new ArrayList());
        }
        
        for (int i=0; i<config.size(); ++i) {
           JSONObject pnl = config.getJSONObject(i);
           float[] origin = new float[3];
           float[] orient = new float[3];
           float scale = pnl.getFloat("scale");
           int ppm = pnl.getInt("ppm");
           int ring = pnl.getInt("ring");
           
           //ensure ring is correct!
           assert(ring < ringCount);
          
           for (int j=0; j < 3; j++) {
              origin[j] = METRE * pnl.getJSONArray("origin").getFloat(j);
              orient[j] = pnl.getJSONArray("orient").getFloat(j);
           }
          
          MEMPanel panel = new MEMPanel(
             mem_panel_import.list,
             origin,
             orient,
             scale,
             ppm
           );
           
          int x = pnl.getInt("x");
          int y = pnl.getInt("y");
          
          tmpPanelGraph[x][y] = panel; 
          panels.add(panel);
          // rings.get(ring).add(panel);
         }
         panelGraph = new PanelGraph(tmpPanelGraph);
         
        ArrayList<MEMPanel> ring_0 = new ArrayList<MEMPanel>();
        ArrayList<MEMPanel> ring_1 = new ArrayList<MEMPanel>();
        ArrayList<MEMPanel> ring_2 = new ArrayList<MEMPanel>();

        ring_0.add(panels.get(0));
        ring_1.add(panels.get(1));
        ring_1.add(panels.get(2));
        ring_1.add(panels.get(3));
        ring_1.add(panels.get(4));
        ring_1.add(panels.get(5));
        ring_1.add(panels.get(6));
        ring_2.add(panels.get(7));
        ring_2.add(panels.get(8));

        rings.put(0,ring_0);
        rings.put(1,ring_1);
        rings.put(2,ring_2);
    }

    public List<MEMPanel> getSymmetricPanels(int ring, int modulo, int rotation){
        ArrayList<MEMPanel> out = new ArrayList<MEMPanel>();
        ArrayList<MEMPanel> ring_set = rings.get(ring);

        for(int i=0;i<ring_set.size();++i){
            if((i-rotation)%modulo==0){
                out.add(ring_set.get(i));
            }
        }
        return out;
    }

    public List<LXPoint> getPoints(){
        ArrayList<LXPoint> out = new ArrayList<LXPoint>();
        for(MEMPanel p : panels){
            out.addAll(p.getPoints());
        }
        return out;
    }
  

  
}

public static class MEMChandelier extends LXFixtureUtils{
    List points = new ArrayList<LXPoint>();
    float[] layer = new float[]{-150*MM,-320*MM,-480*MM};
    float hex_radius = 200*MM;
    float tri_radius = 150*MM;
    int globe_leds = 10;
    float globe_radius = 60*MM;

    public MEMChandelier(float[] origin, float rotation){
        LXTransform t = new LXTransform().translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateY(rotation*Math.PI/180);
        this.centrePoint = origin;

        //Adding a dummy point at origin, as exists in hardware
        points.add(new LXPoint(t.x(),t.y(),t.z()));
        //Building layers in order of wiring
        t.push();
        t.translate(0,layer[1],0);
        buildTriLayer(t);
        t.translate(0,layer[2]-layer[1],0);
        buildBottomGlobe(t);
        t.pop();
        t.rotateY(PI);
        buildTopLayer(t);

        compute();
        update();

    }
    public void buildBottomGlobe(LXTransform t){
        for(int i=0;i<globe_leds;++i){
            t.push();
            t.rotateY(i*(360/globe_leds)*PI/180);
            t.translate(25*MM,0,0);
            points.add(new LXPoint(t.x(),t.y(),t.z()));
            t.pop();
        }
    }
    public void buildTriLayer(LXTransform t){
        for(int i=0;i<3;++i){
            t.push();
            t.rotateY(-i*120*PI/180);
            t.translate(tri_radius,0,0);
            buildGlobe(t);
            t.pop();
        }
    }
    public void buildTopLayer(LXTransform t){
        for(int i=0;i<12;++i){
            t.push();
            t.rotateY(i*30*PI/180);
            if(i%2!=0){
                t.translate(0,layer[0],0);
            }
            t.translate(hex_radius,0,0);
            buildGlobe(t);
            t.pop();
        }
    }
    public void buildGlobe(LXTransform t){
        t.rotateY(60*PI/180);
        for(int i=0;i<globe_leds;++i){
            t.push();
            t.rotateY(i*(-120/globe_leds)*PI/180);
            t.translate(globe_radius,0,0);
            points.add(new LXPoint(t.x(),t.y(),t.z()));
            t.pop();
        }
    }
    public List<LXPoint> getPoints(){
        return points;
    }
}

//Single hanging point from side, two channel route required

public static class SideTubeDiamond extends GeometricTubes {
    public SideTubeDiamond(float[] origin, float[] rot){
        super();

        LXTransform t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(rot[0]*Math.PI/180
            ).rotateY(rot[1]*Math.PI/180
            ).rotateZ(rot[2]*Math.PI/180
            );
        t.rotateX(-90*PI/180);
        t.rotateY(120*PI/180);
        this.centrePoint = origin;

        //Side diamond
        placeTube(1, 0, -60, t);
        placeTube(0, 2,  60, t);
        placeTube(2, 1, 180, t);
        placeTube(1, 3, 240, t);
        placeTube(3, 4, 180, t);
        placeTube(1, 4, -60, t);
        placeTube(4, 2, 60, t);
        placeTube(2, 3, -60, t);
        placeTube(3, 0, 180, t);

        compute();
        update();
    }
}

//Single hanging point from apex, single channel route
public static class TubeDiamond extends GeometricTubes {
    public TubeDiamond(float[] origin, float[] rot){
        super();
        LXTransform t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(rot[0]*Math.PI/180
            ).rotateY(rot[1]*Math.PI/180
            ).rotateZ(rot[2]*Math.PI/180
            );
        this.centrePoint = origin;

        //Diamond
        placeTube(0, 1, 120, t);
        placeTube(1, 2,   0, t);
        placeTube(2, 4, 240, t);
        placeTube(4, 1, 120, t);
        placeTube(1, 3, 240, t);
        placeTube(3, 2, 120, t);
        placeTube(2, 0, 240, t);
        placeTube(0, 3, 180, t);
        placeTube(3, 4, 180, t);

        compute();
        update();

    }
}

public static class Tetrahedron extends GeometricTubes {
    public Tetrahedron(float[] origin, float[] rot){
        super();
        LXTransform t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(rot[0]*Math.PI/180
            ).rotateY(rot[1]*Math.PI/180
            ).rotateZ(rot[2]*Math.PI/180
            );
        this.centrePoint = origin;

        placeTube(1, 2,   0, t);
        placeTube(2, 3, -60, t);
        placeTube(3, 1,  60, t);
        placeTube(1, 0, -60, t);
        placeTube(0, 2,  60, t);
        placeTube(3, 0, 180, t);

        compute();
        update();
    }
}


public static class GeometricTubes extends LXFixtureUtils {
    List<MetreTube> tubes = new ArrayList<MetreTube>();
    private HashMap<Integer, float[]> vertices = new HashMap();

    public GeometricTubes() {
        makeVertices();
    }

    protected void makeVertices(){
        //Vertex points modelled at unit length edge of 1000
        vertices.put(0, new float[]{
            0,0,0
        });
        vertices.put(1, new float[]{
            -500,-816,-288
        });
        vertices.put(2, new float[]{
            500,-816,-288
        });
        vertices.put(3, new float[]{
            0,-816,577
        });
        vertices.put(4, new float[]{
            0,-1633,0
        });
    }

    protected void placeTube(int source_vertex, int target_vertex,int rot,  LXTransform t){
        t.push();
        float[] source, target;
        source = vertices.get(source_vertex);
        target = vertices.get(target_vertex);

        float dx, dy, dz;
        dx = target[0] - source[0];
        dy = target[1] - source[1];
        dz = target[2] - source[2];

        //Accounts for scaling into tube unit length
        t.translate(
            source[0]/1000*MetreTube.length,
            source[1]/1000*MetreTube.length,
            source[2]/1000*MetreTube.length
        );
        //Rotate to "point" x-axis at target vertex
        t.rotateY(atan(dz/dx)+rot*PI/180);
        t.rotateZ(atan(dy/sqrt(dx*dx + dz*dz)));

        tubes.add(new MetreTube(t));
        t.pop();
    }    

    public List<LXPoint> getPoints(){
        List out = new ArrayList<LXPoint>();
        for(MetreTube t : tubes){
            out.addAll(t.getPoints());
        }
        return out;
    }

}

public static class TubeTree implements LXFixture{
    List<MetreTube> tubes = new ArrayList<MetreTube>();
    static float truss_offset = 10*CM;
    /*
    Initialised at the base of the tree
    */
    public TubeTree(float[] origin, float[] rot){
        LXTransform t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(rot[0]*Math.PI/180
            ).rotateY(rot[1]*Math.PI/180
            ).rotateZ(rot[2]*Math.PI/180
            );

        t.translate(0,2*(METRE+2*MetreTube.offset),0);
        t.push();
        t.rotateZ(-Math.PI/2);
        tubes.add(new MetreTube(t));
        tubes.add(new MetreTube(t));
        t.pop();
        addUpperSegment(t);
        t.rotateY(2*Math.PI/3);
        addUpperSegment(t);
        t.rotateY(2*Math.PI/3);
        addUpperSegment(t);

    }
    private void addUpperSegment(LXTransform t){
        t.push();
        t.push();
        t.translate(truss_offset,0,0);
        t.rotateZ(PI/3);
        t.translate(MetreTube.length, 0, 0);

        t.rotateY(PI/180*40);
        t.rotateX(PI/180*50);
        t.rotateY(PI/180*30);

        tubes.add(new MetreTube(t));
        //Wont evaluate O_O
        // t.rotateY(PI-2*asin((2*sin(PI/3)*(MetreTube.length*sin(PI/6)+truss_offset))/2*MetreTube.length));
        t.rotateY(PI-1.0744230206028573893593923128513771727863823613894671);
        tubes.add(new MetreTube(t));
        t.pop();
        t.rotateY(2*Math.PI/3);
        t.translate(truss_offset,0,0);
        t.rotateZ(Math.PI/3);
        tubes.add(new MetreTube(t));
        t.rotateZ(-Math.PI/6);
        tubes.add(new MetreTube(t));
        //Includes angle of cable, calculated with trig
        t.rotateZ(-Math.PI/6-Math.PI/180*9.82642982);
        tubes.add(new MetreTube(t));
        tubes.add(new MetreTube(t));
        t.pop();

    }
    public List<LXPoint> getPoints(){
        List out = new ArrayList<LXPoint>();
        for(MetreTube t : tubes){
            out.addAll(t.getPoints());
        }
        return out;
    }
}

public static class MetreTube implements LXFixture{
    List points =  new ArrayList<LXPoint>();
    private final float DISTANCE = METRE/60;
    protected static float offset = 5*CM;
    protected static float length = offset*2+METRE;

    /*
    Constructor takes an LXTransform, uses it to construct points and leaves t modified to represent an in-line orientation to the constructed tube at the connector point on the outlet.
    */
    public MetreTube(LXTransform t){
        t.translate(offset,0,0);
        for(int i =0; i<60; ++i){
            points.add(new LXPoint(t.x(),t.y(),t.z()));
            t.translate(DISTANCE,0,0);
        }
        t.translate(offset,0,0);

    }
    public List<LXPoint> getPoints(){
        return points;
    }
}

public static class LeftAngelWing extends LeftWing{
    public LeftAngelWing(float[] origin, float[] orient){
        super(origin, orient);
    }
    protected void instantiate(LXTransform t){
        int[] includes = new int[]{
            4,5,6,7,9,11,10,13,14,1
        };
        for(int i=0;i<sides.size();++i){
            t.push();
            float[] loc = locations.get(i);
            t.translate(loc[0],loc[1]);
            if(i>=19){
                t.rotateY(Math.PI);
            }
            for(int num : includes){
                if (num == i){
                    cells.put(i, new Polygon(t, 
                        sides.get(i),
                        angles.get(i),
                        rotations.get(i)
                    ));
                }
            }
            t.pop();
        }
        compute();
        update();
    }
}

public static class RightAngelWing extends RightWing{
    public RightAngelWing(float[] origin, float[] orient){
        super(origin, orient);
    }
    protected void instantiate(LXTransform t){
        int[] includes = new int[]{
            4,5,6,7,9,11,10,13,14,1
        };
        for(int i=0;i<sides.size();++i){
            t.push();
            float[] loc = locations.get(i);
            t.translate(loc[0],loc[1]);
            if(i>=19){
                t.rotateY(Math.PI);
            }
            for(int num : includes){
                if (num == i){
                    cells.put(i, new Polygon(t, 
                        sides.get(i),
                        angles.get(i),
                        rotations.get(i)
                    ));
                }
            }
            t.pop();
        }
        compute();
        update();
    }
}

public static class LeftWing extends CellCollection{
    public LeftWing(float[] origin, float[] orient){
        super(origin, orient);

        rotations.add(114.0);
        rotations.add(180.0);
        rotations.add(157.0);
        rotations.add(215.0);
        rotations.add(140.0);
        rotations.add(270.0);
        rotations.add(134.0);
        rotations.add(85.0);
        rotations.add(231.0);
        rotations.add(81.0);
        rotations.add(8.0);
        rotations.add(87.0);
        rotations.add(311.0);
        rotations.add(13.0);
        rotations.add(22.0);
        rotations.add(60.0);

        angles.put(0,new float[]{155.5,102.5,124,127.5,148,115.5,128});
        angles.put(1,new float[]{123,94.5,118.5,90.5,113});
        angles.put(2,new float[]{142.5,143,131.5,103.5,155,127,103});
        angles.put(3,new float[]{130.5,131.5,131.5,153,133,123,133.5,140.5});
        angles.put(4,new float[]{126.5,109,98,110,96});
        angles.put(5,new float[]{/*104.5,125.5,133.5,98.5,140.5,115.5*/98.5,140.5,115.5,104.5,125.5,133.5});
        angles.put(6,new float[]{100,125,100.5,112.5,102});
        angles.put(7,new float[]{102.5,116,138.5,140,89,135});
        angles.put(8,new float[]{122,115,123,106,118,134.5});
        angles.put(9,new float[]{108,117,130,108.5,122.5,134 });
        angles.put(10,new float[]{136,112.5,109.5,136.5,98,128});
        angles.put(11,new float[]{89,127.5,122.5,115.5,127,138});
        angles.put(12,new float[]{136.5,72,152,131.5,110,119.5});
        angles.put(13,new float[]{127.5,111,109.5,152,102.5,117.5});
        angles.put(14,new float[]{113.5,116,96,153,116,127});
        angles.put(15,new float[]{/*134.5,78.5,156.5,102,131,117.5*/78.5,156.5,102,131,117.5,134.5});

        sides.put(0,new int[]{15,8,14,6,17,2,11});
        sides.put(1,new int[]{4,14,5,11,9});
        sides.put(2,new int[]{15,14,11,21,9,17,15});
        sides.put(3,new int[]{15,3,20,8,16,17,3,21});
        sides.put(4,new int[]{11,2,15,3,7});
        sides.put(5,new int[]{/*6,12,8,8,10,12*/8,10,12,6,12,8});
        sides.put(6,new int[]{10,8,6,12,6});
        sides.put(7,new int[]{6,11,4,6,11,9});
        sides.put(8,new int[]{7,15,23,5,23,13});
        sides.put(9,new int[]{8,11,10,7,11,9});
        sides.put(10,new int[]{10,8,4,17,2,11});
        sides.put(11,new int[]{12,13,10,9,12,12});
        sides.put(12,new int[]{16,17,8,15,11,14});
        sides.put(13,new int[]{10,10,4,15,7,11});
        sides.put(14,new int[]{10,15,15,4,11,12});
        sides.put(15,new int[]{/*12,19,5,18,5,16*/19,5,18,5,16,12});

        locations.put(0, new float[]{88*CM,225*CM});
        locations.put(1, new float[]{118*CM,221*CM});
        locations.put(2, new float[]{248*CM,167*CM});
        locations.put(3, new float[]{265*CM,106*CM});
        locations.put(4, new float[]{119*CM,256*CM});
        locations.put(5, new float[]{125*CM,254*CM});
        locations.put(6, new float[]{262*CM,201*CM});
        locations.put(7, new float[]{158*CM,264*CM});
        locations.put(8, new float[]{272*CM,186*CM});
        locations.put(9, new float[]{233*CM,240*CM});
        locations.put(10, new float[]{165*CM,294*CM});
        locations.put(11, new float[]{313*CM,202*CM});
        locations.put(12, new float[]{328*CM,190*CM});
        locations.put(13, new float[]{243*CM,274*CM});
        locations.put(14, new float[]{325*CM,258*CM});
        locations.put(15, new float[]{410*CM,233*CM});

        instantiate(t);
    }
}

public static class RightWing extends CellCollection{
    public RightWing(float[] origin, float[] orient){
        super(origin, orient);

        rotations.add(114.0);
        rotations.add(180.0);
        rotations.add(157.0);
        rotations.add(215.0);
        rotations.add(140.0);
        rotations.add(90.0);
        rotations.add(134.0);
        rotations.add(85.0);
        rotations.add(231.0);
        rotations.add(81.0);
        rotations.add(8.0);
        rotations.add(87.0);
        rotations.add(311.0);
        rotations.add(13.0);
        rotations.add(22.0);
        rotations.add(317.0);

        angles.put(0,new float[]{155.5,102.5,124,127.5,148,115.5,128});
        angles.put(1,new float[]{123,94.5,118.5,90.5,113});
        angles.put(2,new float[]{142.5,143,131.5,103.5,155,127,103});
        angles.put(3,new float[]{130.5,131.5,131.5,153,133,123,133.5,140.5});
        angles.put(4,new float[]{126.5,109,98,110,96});
        angles.put(5,new float[]{104.5,125.5,133.5,98.5,140.5,115.5});
        angles.put(6,new float[]{100,125,100.5,112.5,102});
        angles.put(7,new float[]{102.5,116,138.5,140,89,135});
        angles.put(8,new float[]{122,115,123,106,118,134.5});
        angles.put(9,new float[]{108,117,130,108.5,122.5,134 });
        angles.put(10,new float[]{136,112.5,109.5,136.5,98,128});
        angles.put(11,new float[]{89,127.5,122.5,115.5,127,138});
        angles.put(12,new float[]{136.5,72,152,131.5,110,119.5});
        angles.put(13,new float[]{127.5,111,109.5,152,102.5,117.5});
        angles.put(14,new float[]{113.5,116,96,153,116,127});
        angles.put(15,new float[]{134.5,78.5,156.5,102,131,117.5});

        sides.put(0,new int[]{15,8,14,6,17,2,11});
        sides.put(1,new int[]{4,14,5,11,9});
        sides.put(2,new int[]{15,14,11,21,9,17,15});
        sides.put(3,new int[]{15,3,20,8,16,17,3,21});
        sides.put(4,new int[]{11,2,15,3,7});
        sides.put(5,new int[]{6,12,8,8,10,12});
        sides.put(6,new int[]{10,8,6,12,6});
        sides.put(7,new int[]{6,12,4,7,10,9});
        sides.put(8,new int[]{7,15,23,5,23,13});
        sides.put(9,new int[]{8,11,10,7,11,9});
        sides.put(10,new int[]{10,8,4,19,2,12});
        sides.put(11,new int[]{12,13,10,9,12,12});
        sides.put(12,new int[]{16,17,8,15,11,14});
        sides.put(13,new int[]{10,10,4,15,7,11});
        sides.put(14,new int[]{10,15,15,4,11,12});
        sides.put(15,new int[]{12,19,5,18,5,16});

        locations.put(0, new float[]{88*CM,225*CM});
        locations.put(1, new float[]{118*CM,221*CM});
        locations.put(2, new float[]{248*CM,167*CM});
        locations.put(3, new float[]{265*CM,106*CM});
        locations.put(4, new float[]{119*CM,256*CM});
        locations.put(5, new float[]{192*CM,204*CM});
        locations.put(6, new float[]{262*CM,201*CM});
        locations.put(7, new float[]{158*CM,264*CM});
        locations.put(8, new float[]{272*CM,186*CM});
        locations.put(9, new float[]{233*CM,240*CM});
        locations.put(10, new float[]{165*CM,294*CM});
        locations.put(11, new float[]{313*CM,202*CM});
        locations.put(12, new float[]{328*CM,190*CM});
        locations.put(13, new float[]{243*CM,274*CM});
        locations.put(14, new float[]{325*CM,258*CM});
        locations.put(15, new float[]{376*CM,263*CM});

        instantiate(t);
    }
}


public static class DJBooth extends CellCollection{
    public DJBooth(float[] origin, float[] orient){
        super(origin, orient);

        rotations.add(0.0);
        rotations.add(290.0);
        rotations.add(200.0);
        rotations.add(30.0);
        rotations.add(200.0);
        rotations.add(320.0);
        rotations.add(180.0);

        angles.put(0,new float[]{40,64,123,163,150});
        angles.put(1,new float[]{113,89,135,85,116});
        angles.put(2,new float[]{168,98,81,125,59});
        angles.put(3,new float[]{120,120,120,120,120,120});
        angles.put(4,new float[]{168,98,81,125,59});
        angles.put(5,new float[]{113,116,85,135,89});
        angles.put(6,new float[]{40,64,123,163,150});

        sides.put(0,new int[]{37,8,14,16,8});
        sides.put(1,new int[]{13,15,14,15,12});
        sides.put(2,new int[]{9,11,17,14,13});
        sides.put(3,new int[]{14,14,15,14,14,15});
        sides.put(4,new int[]{9,11,17,14,13});

        sides.put(5,new int[]{12,15,14,15,13});
        sides.put(6,new int[]{37,8,14,16,8});


        locations.put(0, new float[]{500*CM,0*CM});
        locations.put(1, new float[]{460*CM,70*CM});
        locations.put(2, new float[]{575*CM,90*CM});
        locations.put(3, new float[]{670*CM,120*CM});
        locations.put(4, new float[]{760*CM,90*CM});
        locations.put(5, new float[]{870*CM,70*CM});
        locations.put(6, new float[]{830*CM,0*CM});

        t.rotateX(Math.PI);

        instantiate(t);
    }

    protected void instantiate(LXTransform t){
        for(int i=0;i<sides.size();++i){
            t.push();
            float[] loc = locations.get(i);
            t.translate(loc[0],loc[1]);
            if(i>=3){
                t.rotateZ(Math.PI);
                t.rotateY(Math.PI);
            }
            if(i==4){
                t.rotateX(Math.PI);
                t.rotateY(Math.PI);
            }
            if(i==5){
                t.rotateY(Math.PI);
            }
            if(i==6){
                // t.rotateY(Math.PI);
            }

            cells.put(i, new Polygon(t, 
                sides.get(i),
                angles.get(i),
                rotations.get(i)
                ));
            t.pop();
        }
        compute();
        update();
    }

}

public static abstract class CellCollection extends LXFixtureUtils {
    public HashMap<Integer, Polygon> cells = new HashMap();

    protected HashMap<Integer, int[]> sides = new HashMap();
    protected HashMap<Integer, float[]> locations = new HashMap();
    protected HashMap<Integer, float[]> orientations = new HashMap();
    protected HashMap<Integer, float[]> angles = new HashMap();
    protected List<Float> rotations = new ArrayList();
    protected LXTransform t;

    public CellCollection(float[] origin, float[] orient){
        this.t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(orient[0]*Math.PI/180
            ).rotateY(orient[1]*Math.PI/180
            ).rotateZ(orient[2]*Math.PI/180
            );
        this.centrePoint = origin;
    }

    protected void instantiate(LXTransform t){
        for(int i=0;i<sides.size();++i){
            t.push();
            float[] loc = locations.get(i);
            t.translate(loc[0],loc[1]);
            if(i>=19){
                t.rotateY(Math.PI);
            }
            cells.put(i, new Polygon(t, 
                sides.get(i),
                angles.get(i),
                rotations.get(i)
                ));
            t.pop();
        }
        compute();
        update();
    }

    public List<Polygon> getPolygons(){
        List<Polygon> out = new ArrayList();
        for(Polygon p : cells.values()){
            out.add(p);
        }
        return out;
    }

    public List<LXPoint> getPoints() {
        List<LXPoint> out = new ArrayList<LXPoint>();
        for(Polygon cell : getPolygons()){
            out.addAll(cell.getPoints());
        }
        return out;
    }

    public HashMap<Integer, Polygon> getCells(){
        return cells;
    }

}

public static class Polygon implements LXFixture{
    private static final int PPM = 30;
    public ArrayList<LXPoint> points = new ArrayList();

    public Polygon(LXTransform t,
                    int[] sides,
                    float[] angle,
                    float rot
                    ){
        t.push();
        t.rotateZ((rot-360)*Math.PI/180);

        for(int i=0;i<sides.length;++i){
            makeSide(t, sides[i]);
            if(i==sides.length-1){
                break;
            }
            t.rotateZ((180-angle[i+1])*Math.PI/180);
        }

        t.pop();       
    }

    private void makeSide(LXTransform t, int side_length){
        t.translate(METRE/PPM/2,0);
        for(int i = 0;i<side_length;++i){
            points.add(new LXPoint(t));
            t.translate(METRE/PPM,0);
        }
        t.translate(METRE/PPM/2,0);
    }
    
    public List<LXPoint> getPoints() {
        return points;
    }
}

public class PenroseTile extends UI3dComponent implements LXFixture{
    List<LXPoint> points = new ArrayList();
    LXTransform t;
    public List<Rhomboid> diffusors = new ArrayList();;

    float[][] mapping = new float[][]{
        new float[]{0*MM,0*MM,1,4},
        new float[]{16*MM,56*MM,1,2},
        new float[]{74*MM,53*MM,1,10},
        new float[]{45*MM,94*MM,2,3},
        new float[]{-3*MM,127*MM,1,8},

        new float[]{-48*MM,95*MM,1,6},
        new float[]{-28*MM,38*MM,2,10},
        new float[]{-64*MM,40*MM,2,1},
        new float[]{-114*MM,56*MM,1,10},
        new float[]{-170*MM,58*MM,1,2},

        new float[]{-142*MM,94*MM,2,8},
        new float[]{-151*MM,127*MM,2,9},
        new float[]{-94*MM,127*MM,1,4},
        new float[]{-79*MM,182*MM,1,2},
        new float[]{-125*MM,214*MM,2,1},

        new float[]{-171*MM,235*MM,1,10},
        new float[]{-153*MM,178*MM,1,8},
        new float[]{-201*MM,142*MM,1,6},
        new float[]{-247*MM,179*MM,1,4},
        new float[]{-246*MM,130*MM,2,2},

        new float[]{-258*MM,94*MM,2,3},
        new float[]{-287*MM,54*MM,1,2},
        new float[]{-227*MM,58*MM,1,10},
        new float[]{-246*MM,-1*MM,2,4},
        new float[]{-248*MM,-54*MM,1,3},

        new float[]{-198*MM,-18*MM,1,1},
        new float[]{-149*MM,-53*MM,1,9},
        new float[]{-150*MM,-2*MM,2,2},
        new float[]{-89*MM,-2*MM,1,3},
        new float[]{-71*MM,-56*MM,1,5},

        new float[]{-119*MM,-93*MM,2,5},
        new float[]{-169*MM,-107*MM,1,7},
        new float[]{-198*MM,-152*MM,2,3},
        new float[]{-230*MM,-109*MM,1,5},
        new float[]{-278*MM,-93*MM,2,1},

        new float[]{-328*MM,-60*MM,1,2},
        new float[]{-310*MM,-1*MM,1,9},
        new float[]{-337*MM,39*MM,2,10},
        new float[]{-375*MM,39*MM,2,1},
        new float[]{-406*MM,-3*MM,1,3},

        new float[]{-423*MM,54*MM,1,10},
        new float[]{-488*MM,53*MM,1,2},
        new float[]{-455*MM,96*MM,2,3},
        new float[]{-405*MM,132*MM,1,4},
        new float[]{-356*MM,96*MM,1,6},

        new float[]{-304*MM,131*MM,1,8},
        new float[]{-323*MM,185*MM,1,10},
        new float[]{-276*MM,220*MM,2,10},
        new float[]{-229*MM,235*MM,1,2},
        new float[]{-201*MM,274*MM,2,3}
    };

    protected class Rhomboid extends UI3dComponent{
        protected float angle = 0;
        protected final float LENGTH = 4.15*CM;
        protected final float WIDTH = 0.3*CM;
        protected final float[][] vertices = new float[4][4];
        protected LXPoint point;

        Rhomboid(LXTransform t, Integer size, Integer rot, LXPoint point){
            super();
            this.point = point;
            if(size == 1){
                this.angle = 36*(float)Math.PI/180;
            } else if(size == 2){
                this.angle = 18*(float)Math.PI/180;
            }
            t.push();
            if(size ==1){
                t.rotateZ(36*(rot+1)*Math.PI/180+18*Math.PI/180);
            }else if(size ==2){
                t.rotateZ(36*(rot+2)*Math.PI/180);
            }
            t.push();
            //Get left point
            t.translate(
                -LENGTH,
                0,
                -WIDTH
                );
            this.vertices[1] = new float[]{t.x(),t.y(),t.z(),0};
            t.translate(0,0,2*WIDTH);
            this.vertices[1][3] = t.z();
            t.pop();
            t.push();
            //Get right point
            t.translate(
                +LENGTH,
                0,
                -WIDTH);
            this.vertices[3] = new float[]{t.x(),t.y(),t.z(),0};
            t.translate(0,0,2*WIDTH);
            this.vertices[3][3] = t.z();
            t.pop();
            t.push();
            //Get upper point
            t.translate(
                0,
                +LENGTH*(float)Math.tan(angle),
                -WIDTH
                );
            this.vertices[0] = new float[]{t.x(),t.y(),t.z(),0};
            t.translate(0,0,2*WIDTH);
            this.vertices[0][3] = t.z();
            t.pop();
            t.push();
            //Get down point
            t.translate(
                0,
                -LENGTH*(float)Math.tan(angle),
                -WIDTH
                );
            this.vertices[2] = new float[]{t.x(),t.y(),t.z(),0};
            t.translate(0,0,2*WIDTH);
            this.vertices[2][3] = t.z();
            t.pop();
            t.pop();
        }
        protected void onDraw(UI ui, PGraphics pg){
            pg.stroke(#303030);
            int colour = colours[point.index];
            pg.fill(colour);
            pg.pushMatrix();
            pg.beginShape();
            for(float[] v : vertices){
                pg.vertex(v[0],v[1],v[2]);
            }
            pg.endShape();
            pg.beginShape();
            for(float[] v : vertices){
                pg.vertex(v[0],v[1],v[3]);
            }
            pg.endShape();
            pg.popMatrix();
        }
    }

    public PenroseTile(float[] origin, double[] rotation){
        this.t = new LXTransform();
        t.push();
        t.rotateX(rotation[0]*Math.PI/180);
        t.rotateY(rotation[1]*Math.PI/180);
        t.rotateZ(rotation[2]*Math.PI/180);
        for(float[] pos : mapping){
            t.push();
            float[] point_coord = new float[]{
                origin[0]+pos[0],
                origin[1]+pos[1],
                origin[2]
            };
            t.translate(point_coord[0],point_coord[1],point_coord[2]);
            LXPoint point = new LXPoint(t.x(),t.y(),t.z());
            diffusors.add(new Rhomboid(t, (int)pos[2], (int)pos[3], point));
            points.add(point);
            t.pop();
        }

    }
    public List<LXPoint> getPoints(){
        return points;
    }
}

public static class Pixlite1Curtain implements LXFixture{
    Curtain a, b;
    final int A_NUM = 15;
    final int B_NUM = 14;

    public Pixlite1Curtain(float[] origin, float[] rot){
        LXTransform t = new LXTransform(
            ).translate(
            origin[0], 
            origin[1], 
            origin[2]
            ).rotateX(rot[0]*Math.PI/180
            ).rotateY(rot[1]*Math.PI/180
            ).rotateZ(rot[2]*Math.PI/180
            );
        t.push();
        a = new Curtain(t, A_NUM);
        t.pop();
        t.translate(B_NUM*a.DISTANCE,0,0);
        b = new Curtain(t, B_NUM);

    }
    public List<LXPoint> getPoints(){
        List<LXPoint> out = new ArrayList<LXPoint>();
        out.addAll(a.getPoints());
        out.addAll(b.getPoints());
        return out;
    }

}

public static class Curtain implements LXFixture{
    List points = new ArrayList<LXPoint>();
    final int UP_NUM = 19;
    final int DOWN_NUM = 18;
    private final float DISTANCE = 10*CM;

    public Curtain(LXTransform t, int columns){
        for(int j=0;j<columns;++j){
            for(int i=0;i< UP_NUM;++i){
                points.add(new LXPoint(t.x(),t.y(),t.z()));
                t.translate(0, DISTANCE, 0);
            }
            j++;
            if(j==columns){
              break;
            }
            t.rotateZ(PI);
            t.translate(DISTANCE,3*DISTANCE/2);
            for(int i=0;i< DOWN_NUM;++i){
                points.add(new LXPoint(t.x(),t.y(),t.z()));
                t.translate(0, DISTANCE, 0);
            }
            t.rotateZ(-PI);
            t.translate(-DISTANCE,DISTANCE/2);
        }
    }

    public List<LXPoint> getPoints(){
        return points;
    }
}

public static class DanceFloor extends LXFixtureUtils{
    private float[] orientation, rotation;
    public List<LXFixture> panels = new ArrayList<LXFixture>();

    public List<LXPoint> points = new ArrayList();
    protected final float SIDE_W = 380*MM;
    protected final float SIDE_H = 430*MM;

    protected final float WALL = 20*MM;
    protected final float LED_SPACE = 100*MM;
    protected final float INSET = 65*MM;


    public DanceFloor(float[] position, float[] rot){
        this.orientation = position;
        this.rotation = rot;
        this.centrePoint = position;

        LXTransform t = new LXTransform();

        t.rotateX(rotation[0]*Math.PI/180);
        t.rotateY(rotation[1]*Math.PI/180);
        t.rotateZ(rotation[2]*Math.PI/180);
        t.translate(orientation[0],orientation[1],orientation[2]);
        t.rotateY(-Math.PI/2);
        t.rotateX(Math.PI);
        t.push();
        addPanel(t);
        t.translate(0,0,2*SIDE_H+4*WALL);
        addPanel(t);
        t.rotateX(Math.PI);
        t.rotateY(PI);
        t.translate(-1.85*METRE,0,-0.94*METRE);
        addPanel(t);
        t.translate(0,0,2*SIDE_H+4*WALL);
        addPanel(t);

        compute();
        update();
    }

    private void addPanel(LXTransform t){
        Panel newpanel = new Panel(t);
        panels.add(newpanel);
        points.addAll(newpanel.getPoints());
    }
    public class Panel implements LXFixture{
        List<LXPoint> points = new ArrayList();

        Panel(LXTransform t){
            t.push();
            points.addAll(new ThreeSquare(t).getPoints());
            t.translate(0,0,-2*SIDE_H);
            t.rotateX(Math.PI);
            points.addAll(new ThreeSquare(t).getPoints());
            t.pop();
        }
        public List<LXPoint> getPoints() {
            return points;
        }
    }
    protected class ThreeSquare implements LXFixture {
        List<LXPoint> points = new ArrayList();

        ThreeSquare(LXTransform t){
            //Square 1
            t.push();
            t.translate(WALL/2+SIDE_W,0,-(WALL/2+SIDE_H));
            t.translate(INSET, 0, -INSET-WALL*3/4);
            makeSide(t);

            t.translate(INSET,0,-SIDE_H+INSET);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(INSET,0,-SIDE_W);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(INSET+WALL,0,-SIDE_W);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(0,0,-SIDE_W-INSET);
            makeSide(t);

            t.translate(0,0,-SIDE_W-WALL-INSET);
            makeSide(t);

            t.translate(INSET+WALL/2, 0, -INSET-SIDE_W+2.5*WALL);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(INSET+WALL/2,0,-SIDE_H+INSET);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(INSET+WALL/2,0,-SIDE_W-INSET/2+WALL);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(WALL,0,-3*LED_SPACE);
            t.rotateY(Math.PI);
            makeSide(t);

            t.translate(INSET+3*WALL/2,0,-SIDE_W-INSET+3*WALL);
            t.rotateY(-Math.PI/2);
            makeSide(t);

            t.translate(INSET+.25*WALL, 0, -SIDE_W);
            t.rotateY(-Math.PI/2);
            makeSide(t);
            t.pop();

        }
        private void makeSide(LXTransform t){
            t.push();
            for(int i=0;i<4;++i){
                points.add(new LXPoint(t.x(),t.y(),t.z()));
                t.translate(0, 0, -LED_SPACE);
            }
            t.pop();
        }
        public List<LXPoint> getPoints() {
            return points;
        }
    }

    public List<LXPoint> getPoints(){
        return points;
    }
}

public static abstract class LXFixtureUtils implements LXFixture{
    public float[] centroid;
    public float[] centrePoint;
    public float xMin, yMin, zMin;
    public float xMax, yMax, zMax;

    protected void compute() {
        float[] sum = new float[]{0,0,0};
        int count = 0;
        List<LXPoint> points = this.getPoints();
        for(LXPoint p : points){
            sum[0]+=p.x;
            sum[1]+=p.y;
            sum[2]+=p.z;
            count++;
        }
        
        this.centroid = new float[]{
            sum[0]/count,
            sum[1]/count,
            sum[2]/count
        };
    }

    protected void update(){
        List<LXPoint> points = this.getPoints();
        for(LXPoint p : points){
            p.x -= (centroid[0] - centrePoint[0]);
            p.y -= (centroid[1] - centrePoint[1]);
            p.z -= (centroid[2] - centrePoint[2]);
        }
        xMin = centrePoint[0];
        xMax = centrePoint[0];
        yMin = centrePoint[1];
        yMax = centrePoint[1];
        zMin = centrePoint[2];
        zMax = centrePoint[2];

        for(LXPoint p : points){
            if(p.x > xMax) xMax = p.x;
            if(p.x < xMin) xMin = p.x;
            if(p.y > yMax) yMax = p.y;
            if(p.y < yMin) yMin = p.y;
            if(p.z > zMax) zMax = p.z;
            if(p.z < zMin) zMin = p.z;

        }

    }
}
