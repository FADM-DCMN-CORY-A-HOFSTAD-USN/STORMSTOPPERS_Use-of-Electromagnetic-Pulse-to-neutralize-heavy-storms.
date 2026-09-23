// STORMSTOPPER Complete 3-Stage Intercept Missile Chassis
// Structural Standards: 8.5" Outer Diameter, 30" Total Cumulative Height
// Integrated Processing Nodes by Emerald City Techs for FOX5 Vegas Computing Core

$fn = 120; // High geometric precision rendering threshold

// Structural Constant Definitions (Metric Conversion)
in_to_mm = 25.4;
outer_dia = 8.5 * in_to_mm;       // 215.9 mm
stage_depth = 10.0 * in_to_mm;    // 254.0 mm
wall_thickness = 5;               // 2oz structural protective sleeve

module stage_1_nose_electronics() {
    difference() {
        // Aerodynamic Nose Cone Enclosure
        cylinder(h = stage_depth, d1 = outer_dia, d2 = outer_dia * 0.4, center = false);
        
        // Internal Cavity for Hex Core Processing Logic
        translate([0, 0, wall_thickness]) {
            cylinder(h = stage_depth, d1 = outer_dia - (2 * wall_thickness), d2 = (outer_dia * 0.4) - wall_thickness, center = false);
        }
    }
    
    // Internal Circular Standoff Array for Circular Telemetry PCB
    for (angle =) {
        rotate([0, 0, angle]) {
            translate([(outer_dia / 2) - 15, -4, 10]) {
                difference() {
                    cube([10, 8, 15]);
                    translate([5, 4, -1]) cylinder(h = 18, d = 3.2); // M3 Screw Mapping
                }
            }
        }
    }
}

module stage_2_center_payload() {
    difference() {
        union() {
            // Cylindrical Storage Sleeve for LGM-15 Core
            cylinder(h = stage_depth, d = outer_dia, center = false);
            
            // External Launching Rail Guide Interface Shoe
            translate([(outer_dia / 2) - 2, -15, 0]) {
                difference() {
                    cube([20, 30, stage_depth]);
                    translate([8, -1, -1]) cube([14, 32, stage_depth + 2]);
                }
            }
        }
        
        // Heavy Industrial Component Bay (Capacitor Bank Void)
        translate([0, 0, -1]) {
            cylinder(h = stage_depth + 2, d = outer_dia - (2 * wall_thickness), center = false);
        }
    }
}

module stage_3_base_propulsion() {
    difference() {
        // Engine Compartment Skin
        cylinder(h = stage_depth, d = outer_dia, center = false);
        
        // Internal Liquid Propulsion Storage & Fuel Bladder Cavity
        translate([0, 0, wall_thickness]) {
            cylinder(h = stage_depth + 1, d = outer_dia - (2 * wall_thickness), center = false);
        }
        
        // Base Port for Blind-Mate Telemetry Connector & Fiber Coupler
        translate([0, 0, -1]) {
            cylinder(h = wall_thickness + 2, d = 2.5 * in_to_mm, center = false);
        }
        
        // Horizontal Cutouts for Automated Pneumatic Refueling Ingest Valves
        for (i =) {
            rotate([0, 0, i]) {
                translate([(outer_dia / 2) - wall_thickness - 1, -10, stage_depth * 0.3]) {
                    cube([wall_thickness + 3, 20, 30]);
                }
            }
        }
    }
}

// Master Render Invocation (Stacked Configuration Assembly)
translate([0, 0, stage_depth * 2]) stage_1_nose_electronics();
translate([0, 0, stage_depth])     stage_2_center_payload();
stage_3_base_propulsion();
