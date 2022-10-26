import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.List;

public class ImportCSV {

    List<int[]> list = new ArrayList();

    public ImportCSV(String name) throws FileNotFoundException {
        Scanner scanner = new Scanner(new File(sketchPath()+"/"+name));
        scanner.useDelimiter("\n");
        while(scanner.hasNext()){
            String current = scanner.next();
            String[] dimensions = current.split(",");

            Integer x=0;
            Integer y=0;
            try{
                x = Integer.valueOf(dimensions[0]);
                //Newline and carriage return annoyance
                String y_string = dimensions[1].replaceAll("\n","");
                y_string = y_string.replaceAll("\r","");
                y = Integer.valueOf(y_string);
            }catch(NumberFormatException e){
                System.out.print(dimensions[0]);
                System.out.println(dimensions[1]);
            }
            list.add(new int[]{x,y});
        }
        scanner.close();
    }
}

public class ImportFixture extends LXFixtureUtils {
    protected ArrayList<LXPoint> points = new ArrayList();
    protected LXTransform t;

    public ImportFixture(List<int[]> mapping,float[] origin, float[] orient,float scale,int ppm){
        this.t = new LXTransform();
        t.rotateX(orient[0]*Math.PI/180);
        t.rotateY(orient[1]*Math.PI/180);
        t.rotateZ(orient[2]*Math.PI/180);
        this.centrePoint = origin;

        for(int[] location : mapping){
            t.push();
            t.translate(
                location[0]/scale*(METRE/ppm),
                -location[1]/scale*(METRE/ppm),
                0
                );
            points.add(new LXPoint(t.x(),t.y(),t.z()));
            t.pop();
        }

        compute();
        update();
    }

    public List<LXPoint> getPoints() {
        return points;
    }
}