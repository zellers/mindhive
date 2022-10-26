class ArtNetOut extends LXDatagramOutput {

    protected static final String PIXLITE_IP = "192.168.1.201";
    // protected static final String DJ_BOOTH_IP = "192.168.0.235";

    // protected static final String PENROSE_IP = "192.168.0.203";

    // private static final String MIRROR_IP = "2.0.0.201"; //Used by Bigs to monitor Artnet traffic for troubleshooting

    private static final int OUTPUTS_PER_PIXLITE = 16;
    private static final int FIXTURES_PER_OUTPUT = 4;
    private static final int PIXELS_PER_UNIVERSE = 170;
    HashMap<Integer, LXFixture> fixtures = new HashMap<Integer, LXFixture>();

    ArtNetOut(LX lx) throws IOException {
        super(lx);

        // this.cells_r = cell_r.getCells();

        // this.cells_l = cell_l.getCells_l();
        // this.cells_c = cell_c.getCells_c();

        //Right wing
               LXFixture[] output_2 = {
            cells.get(1).cells.get(0),
            cells.get(1).cells.get(1),
            cells.get(1).cells.get(4),
            cells.get(1).cells.get(7),
            cells.get(1).cells.get(5),
            cells.get(1).cells.get(6),
            cells.get(1).cells.get(9),
            cells.get(1).cells.get(10),
            cells.get(1).cells.get(13),
            cells.get(1).cells.get(14)
        };
        LXFixture[] output_1 = {
            cells.get(1).cells.get(3),
            cells.get(1).cells.get(2),
            cells.get(1).cells.get(8),
            cells.get(1).cells.get(11),
            cells.get(1).cells.get(12),
            cells.get(1).cells.get(15)

        };
        // Left wing
        LXFixture[] output_4 = {
            cells.get(0).cells.get(0),
            cells.get(0).cells.get(1),
            cells.get(0).cells.get(4),
            cells.get(0).cells.get(7),
            cells.get(0).cells.get(5),
            cells.get(0).cells.get(6),
            cells.get(0).cells.get(9),
            cells.get(0).cells.get(10),
            cells.get(0).cells.get(13),
            cells.get(0).cells.get(14)
        };
        LXFixture[] output_3 = {
            cells.get(0).cells.get(3),
            cells.get(0).cells.get(2),
            cells.get(0).cells.get(8),
            cells.get(0).cells.get(11),
            cells.get(0).cells.get(12),
            cells.get(0).cells.get(15)
        };

        LXFixture[] output_5 = {
            cells.get(2).cells.get(3)

        };   

        LXFixture[][] outputs = {
            output_1,
            output_2,
            output_3,
            output_4,
            output_5
        };

        int iter=0;
        for(CellCollection c : cells){
            for(LXFixture f : c.getPolygons()){
                this.fixtures.put(iter++,f);
            }
        }


        int iterator = 0;
        for(int i=1;iterator<outputs.length;i+=6){
            int[] indexes = getIndices(outputs[iterator++]);
            createDatagrams(indexes, i-1, PIXLITE_IP);
        }

        // int[] p1 = new int[50];
        // for(int i=0;i<50;++i){
        //     p1[i] = i+537;
        // }
        // int[] p2 = new int[50];
        // for(int i=0;i<50;++i){
        //     p2[i] = i+587;
        // }

        // addDatagram(new ArtNetDatagram(penroses[0],0).setAddress(PENROSE_IP));
        // addDatagram(new ArtNetDatagram(penroses[1],1).setAddress(PENROSE_IP));

        //DJ Booth
        // LXFixture[] output_9 = {
        //     cells.get(2).cells.get(0),
        //     cells.get(2).cells.get(1),
        //     cells.get(2).cells.get(2),
        //     cells.get(2).cells.get(3)
        // };
        // LXFixture[] output_10 = {
        //     cells.get(2).cells.get(4),
        //     cells.get(2).cells.get(5),
        //     cells.get(2).cells.get(6)
        // };

        // LXFixture[][] outputs_b = {
        //     output_9,
        //     output_10
        // };
        // iterator = 0;
        // for(int i=1;iterator<outputs_b.length;i+=6){
        //     int[] indexes = getIndices(outputs_b[iterator++]);
        //     createDatagrams(indexes, i-1, DJ_BOOTH_IP);
        // }

    }

    private void createDatagrams(int[] indexes, int start_universe, String ip_address) throws IOException{
        int[] remainder;
        if(indexes.length>PIXELS_PER_UNIVERSE){
            remainder = new int[indexes.length-PIXELS_PER_UNIVERSE];
        }else{
            remainder = new int[0];
        }
        
        int datagram_length = PIXELS_PER_UNIVERSE;
        if(indexes.length < datagram_length){
            datagram_length = indexes.length;
        }
        int[] for_datagram = new int[datagram_length];
        for(int i=0;i<datagram_length;++i){
            for_datagram[i] = indexes[i];
        }
        addDatagram(new ArtNetDatagram(for_datagram,start_universe).setAddress(ip_address));
        for(int i=datagram_length;i<indexes.length;++i){
            remainder[i-datagram_length] = indexes[i];
        }
        if(remainder.length ==0){
            return;
        }
        createDatagrams(remainder, start_universe+1, ip_address);
    }

    private int[] getIndices(LXFixture[] fixtures){
        ArrayList<LXPoint> points = new ArrayList();
        for(LXFixture fixture : fixtures){
            points.addAll(fixture.getPoints());
        }
        int[] out = new int[points.size()];
        for(int i=0;i<out.length;++i){
            out[i] = points.get(i).index;
        }
        return out;
    }
}


// import java.net.SocketException;

// class ArtNetOut extends LXDatagramOutput {

//     private static final String DANCE_IP = "2.0.0.50";
//     private static final String CURTAIN_IP = "2.0.0.202";
//     private static final String PENROSE_IP = "2.0.0.8";

//     // private static final String MIRROR_IP = "2.0.0.201"; //Used by Bigs to monitor Artnet traffic for troubleshooting

//     private static final int OUTPUTS_PER_PIXLITE = 4;
//     private static final int UNIVERSES_PER_OUTPUT = 2;
//     private static final int PIXELS_PER_UNIVERSE = 170;


//     ArtNetOut(LX lx) throws IOException {
//         super(lx);
//         // for(int i=0;i<OUTPUTS_PER_PIXLITE;++i){
//         //     assignOutputs(i);
//         // }

//      int[] a1 = new int[170];
//         for(int i=0;i<170;++i){
//          a1[i] = i;
//         }
//         int[] a2 = new int[108];
//         for(int i=0;i<108;++i){
//          a2[i] = i+170;
//         }

//         int[] b1 = new int[170];
//         for(int i=0;i<170;++i){
//          b1[i] = i+278;
//         }
//         int[] b2 = new int[89];
//         for(int i=0;i<89;++i){
//          b2[i] = i+448;
//         }

//         addDatagram(new ArtNetDatagram(a1,0).setAddress(CURTAIN_IP));
//         addDatagram(new ArtNetDatagram(a2,1).setAddress(CURTAIN_IP));

//         addDatagram(new ArtNetDatagram(b1,2).setAddress(CURTAIN_IP));
//         addDatagram(new ArtNetDatagram(b2,3).setAddress(CURTAIN_IP));

//         int[] c1 = new int[96];
//         for(int i=0;i<96;++i){
//             c1[i] = i+537;
//         }
//         int[] c2 = new int[96];
//         for(int i=0;i<96;++i){
//             c2[i] = i+633;
//         }
//         int[] c3 = new int[96];
//         for(int i=0;i<96;++i){
//             c3[i] = i+729;
//         }
//         int[] c4 = new int[96];
//         for(int i=0;i<96;++i){
//             c4[i] = i+825;
//         }

//         addDatagram(new ArtNetDatagram(c1,0).setAddress(DANCE_IP));
//         addDatagram(new ArtNetDatagram(c2,1).setAddress(DANCE_IP));

//         addDatagram(new ArtNetDatagram(c3,2).setAddress(DANCE_IP));
//         addDatagram(new ArtNetDatagram(c4,3).setAddress(DANCE_IP));

//         int[] p1 = new int[50];
//         for(int i=0;i<50;++i){
//             p1[i] = i+921;
//         }
//         int[] p2 = new int[50];
//         for(int i=0;i<50;++i){
//             p2[i] = i+971;
//         }

//         addDatagram(new ArtNetDatagram(p1,0).setAddress(PENROSE_IP));
//         addDatagram(new ArtNetDatagram(p2,1).setAddress(PENROSE_IP));


        
//         // assignDanceOutputs();
//     }

//     private void assignDanceOutputs(int output) throws IOException{
//         for(int i=0;i<UNIVERSES_PER_OUTPUT;++i){
//             assignToUniverse(output * i + output);
//         }
//     }

//     private void assignToUniverse(int universe) throws IOException{
//         int[] indices = new int[PIXELS_PER_UNIVERSE];
//         for(int i=0;i<indices.length;++i){
//             indices[i] = universe * PIXELS_PER_UNIVERSE + i;
//         }
//         addDatagram(new ArtNetDatagram(indices,universe).setAddress(DANCE_IP));
//     }
//     private int[] getIndices(LEDStrip strip){
//         int[] out = new int[strip.number];
//         for(int i=0;i<strip.number;++i){
//             out[i] = strip.getPoints().get(i).index;
//         }
//         return out;
//     }

// }
