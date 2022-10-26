/** 
 * By using LX Studio, you agree to the terms of the LX Studio Software
 * License and Distribution Agreement, available at: http://lx.studio/license
 *
 * Please note that the LX license is not open-source. The license
 * allows for free, non-commercial use.
 *
 * HERON ARTS MAKES NO WARRANTY, EXPRESS, IMPLIED, STATUTORY, OR
 * OTHERWISE, AND SPECIFICALLY DISCLAIMS ANY WARRANTY OF
 * MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR A PARTICULAR
 * PURPOSE, WITH RESPECT TO THE SOFTWARE.
 */

// ---------------------------------------------------------------------------
//
// Welcome to LX Studio! Getting started is easy...
// 
// (1) Quickly scan this file
// (2) Look at "Model" to define your model
// (3) Move on to "Patterns" to write your animations
// 
// ---------------------------------------------------------------------------

// Reference to top-level LX instance
heronarts.lx.studio.LXStudio lx;

// Top-level, we have a model and an LXStudio instance
Model model;
Telekinetik tcr;

LXProjection projection;
int[] colours;
ImportCSV coco_logo_import, coco_trees_import, mem_panel_import;

void setup() {
  // Processing setup, constructs the window and the LX instance
  size(1280, 720, P3D);
    try{
        coco_logo_import = new ImportCSV("coco_logo_index.csv");
        coco_trees_import = new ImportCSV("coco_palmtrees_index.csv");
        mem_panel_import = new ImportCSV("data/vivid_panel.csv");

    } catch(Exception x){
        System.out.println("File not found");
        File directory = new File("./");
        System.out.println(directory.getAbsolutePath());
        System.out.println(sketchPath());
        System.out.println(x);

    }
    
    // Create the model, which describes where our light points are
    tcr = new Telekinetik();
    model = new Model();
    lx = new heronarts.lx.studio.LXStudio(this, model, MULTITHREADED);
    lx.ui.setResizable(RESIZABLE);
}

void initialize(final heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Add custom components or output drivers here
      try {
          lx.engine.output.gammaCorrection.setValue(1);
          lx.engine.output.enabled.setValue(false);
          lx.addOutput(new ArtNetOut(lx));
      } catch (IOException x) {
          throw new RuntimeException(x);
      }
      
      colours = lx.getColors();
      model.update();
}

void onUIReady(heronarts.lx.studio.LXStudio lx, heronarts.lx.studio.LXStudio.UI ui) {
  // Add custom UI components here
}

void draw() {
  // All is handled by LX Studio
}

// Configuration flags
final static boolean MULTITHREADED = true;
final static boolean RESIZABLE = true;

// Helpful global constants
final static float INCHES = 1;
final static float IN = INCHES;
final static float FEET = 12 * INCHES;
final static float FT = FEET;
final static float CM = IN / 2.54;
final static float MM = CM * .1;
final static float M = CM * 100;
final static float METER = M;
final static float METRE = M;