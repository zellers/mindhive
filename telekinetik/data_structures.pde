//import heronarts.lx.LX;


//public class MEMDataTest extends LXPattern{

//    public final CompoundParameter t_ring
//                = new CompoundParameter("t_ring", 0,0,4);
//    public final CompoundParameter t_clock 
//                = new CompoundParameter("t_clock",0,0,11);
//    public final CompoundParameter n_ring
//                = new CompoundParameter("n_ring", 0,0,4);
//    public final CompoundParameter n_clock 
//                = new CompoundParameter("n_clock",0,0,11);


//    public MEMDataTest(LX lx){
//        super(lx);
//        addParameter("t_ring", this.t_ring);
//        addParameter("t_clock",this.t_clock);
//        addParameter("n_ring", this.n_ring);
//        addParameter("n_clock",this.n_clock);


//    }
//    public void run(double deltams){
//        setColors(#000000);
//        LXPoint t = new MEMCell(
//            tcr.mem_panels[0],
//            (int)Math.floor(t_ring.getValuef()),
//            (int)Math.floor(t_clock.getValuef())).point;
//        LXPoint n = new MEMCell(
//            tcr.mem_panels[0],
//            (int)Math.floor(n_ring.getValuef()),
//            (int)Math.floor(n_clock.getValuef())).point;

//        setColor(t.index, LXColor.RED);
//        setColor(n.index, LXColor.BLUE);

//    }
//}

//public class MEMNeighbourhood extends BlendPattern{

//    public MEMNeighbourhood(LX lx){
//        super(lx);
//        for(int i=0;i<7;++i){
//            layers.put(i, new MEMNeighbourLayer(lx, MEMNeighbourhood.this,i,0));
//        }
//        instantiate();

//    }
//}

//protected class MEMNeighbourLayer extends FadeLayer{
//    int ring,rot;
//    private MEMNeighbourLayer(LX lx, BlendPattern pattern, int layer_num, float delay){
//        super(lx,pattern,layer_num,delay);
//        this.ring=0;
//        this.rot=0;
//    }
//    protected void generateTarget(){
//        int ri=0,ro=0;
//        println(getLayerNum());
//        switch(getLayerNum()){
//            case 0 : {ri=this.ring;   ro=this.rot;   break;}
//            case 1 : {ri=this.ring;   ro=this.rot+1; break;}
//            case 2 : {ri=this.ring;   ro=this.rot-1; break;}
//            case 3 : {ri=this.ring+1; ro=this.rot+1; break;}
//            case 4 : {ri=this.ring+1; ro=this.rot-1; break;}
//            case 5 : {ri=this.ring-1; ro=this.rot-1; break;}
//            case 6 : {ri=this.ring-1; ro=this.rot+1; break;}
//            default:
//        }
//        // println("ri: "+ri+"\tro: "+ro);
//        try{
//            LXPoint p = new MEMCell(tcr.mem_panels[0],ri,ro).point;
//            println(p.index);
//            target.add(p);
//        }catch(IllegalArgumentException e){
            
//        }
//        // if(ring==0&&rot==5){
//        //     ring++;
//        //     rot=0;
//        // } 
//        // else if(rot == 11){
//        //     ring++;
//        //     rot=0;
//        // }else if(ring==4&&rot==5){
//        //     ring=0;
//        //     rot=0;
//        // }else{
//        //     rot++;
//        // }


//    }
//}

//public static class MEMCell {
//    public enum Neighbour {
//        FRONT_LEFT,
//        FRONT_RIGHT,
//        REAR_RIGHT,
//        REAR_LEFT
//    }
//    protected MEMPanel mp;
//    private int ring, clock_num;
//    public LXPoint point;
//    private MEMCell[] cell = new MEMCell[4];

//    public MEMCell(MEMPanel mp, int ring, int clock_num) throws IllegalArgumentException {
//        this.mp = mp;
//        this.ring = ring;
//        this.clock_num = clock_num;
//        this.point = findPoint();
//        if(point==null){
//            throw new IllegalArgumentException("Point doesn't exist");
//        }
//    }

//    private LXPoint findPoint(){
//        if(ring<0)return null;
//        int mod = (ring == 0 || ring == 4)?6:12;
//        // for(LXPoint p : mp.getSymmetricPoints(ring,mod,clock_num)){
//        //     println(p.index);
//        // }
//        return mp.getSymmetricPoints(ring,mod,clock_num).get(0);
//    }
//    /*
//    Directionality defined as the centre being the origin, facing outwards
//    */
//    public void updateNeighbour(MEMCell.Neighbour position, MEMCell neighbour){
//        switch(position){
//            case FRONT_LEFT : cell[0] = neighbour;
//            case FRONT_RIGHT: cell[1] = neighbour;
//            case REAR_RIGHT : cell[2] = neighbour;
//            case REAR_LEFT  : cell[3] = neighbour;
//            default : 
//        }
//    }
//    /*
//    Directionality defined as the centre being the origin, facing outwards
//    */
//    public MEMCell getNeighbour(MEMCell.Neighbour position){
//        switch(position){
//            case FRONT_LEFT : return this.cell[0];
//            case FRONT_RIGHT: return this.cell[1];
//            case REAR_RIGHT : return this.cell[2];
//            case REAR_LEFT  : return this.cell[3];
//            default : return null;
//        }
//    }
//}