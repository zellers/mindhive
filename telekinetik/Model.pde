import java.util.List;
import java.util.HashSet;

// public static DanceFloor floor;
// public static Pixlite1Curtain curtain;
// public static PenroseTile[] penroses = new PenroseTile[2];
public static List<CellCollection> cells = new ArrayList();

public class Model extends LXModel {

    // List<LXPoint> points = new ArrayList();

    public Model() {
        super(new Telekinetik());
    }
    public List<LXPoint> getPoints(){
        List<LXPoint> out = new ArrayList<LXPoint>();
        // out.addAll(curtain.getPoints());
        // out.addAll(floor.getPoints());
        out.addAll(cells.get(0).getPoints());
        out.addAll(cells.get(1).getPoints());
        out.addAll(cells.get(2).getPoints());
        // out.addAll(penroses[0].getPoints());
        // out.addAll(penroses[1].getPoints());

        return out;
    }
}

public class Telekinetik extends LXModel implements LXFixture{

    public List<LXFixture> fixtures = new ArrayList();

    public Telekinetik(){
        // curtain = new Pixlite1Curtain(
        //     new float[]{0,1.1*METRE,-1*METRE},
        //     new float[]{0,1,0}
        //     );
        // floor = new DanceFloor(
        //     new float[]{-0.8*METRE,0,2.42*METRE},
        //     new float[]{0,0,0}
        //     );
        cells.add(new LeftWing(new float[]{
                4*METRE,1.4*METRE,1*METRE
            },new float[]{
                0,210,0
            }));
        cells.add(new RightWing(new float[]{
                -4*METRE,1.4*METRE,1*METRE
            },new float[]{
                0,-30,0
            }));
        cells.add(new DJBooth(new float[]{
               0*METRE,1.7*METRE,0*METRE
        },new float[]{
               0,0,0
           }));

        // penroses[0] = new PenroseTile(
        //     new float[]{1*METRE,2.2*METRE,0},
        //     new double[]{0,-10,0}
        //     );
        // penroses[1] = new PenroseTile(
        //     new float[]{-2.3*METRE,2.2*METRE,-1.5*METRE},
        //     new double[]{0,80,0}
        //     );

        // fixtures.add(curtain);
        // fixtures.add(floor);
        fixtures.add(cells.get(0));
        fixtures.add(cells.get(1));
        fixtures.add(cells.get(2));
        // fixtures.add(penroses[0]);
        // fixtures.add(penroses[1]);

        // model.points.addAll(curtain.getPoints());
        // model.points.addAll(floor.getPoints());
        // model.points.addAll(penroses[0].getPoints());
        // model.points.addAll(penroses[1].getPoints());
    }

    public List<LXPoint> getPoints(){
        List<LXPoint> out = new ArrayList<LXPoint>();
        for(LXFixture fixture : fixtures){
            out.addAll(fixture.getPoints());
        }
        return out;
    }
}
