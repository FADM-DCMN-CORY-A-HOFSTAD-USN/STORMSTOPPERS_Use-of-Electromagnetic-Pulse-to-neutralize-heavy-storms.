// STORMSTOPPER LGM-15 Housing Canister & Threaded Locking Cap Assembly
// Parameterized in millimeters by Emerald City Techs for FOX5 Vegas Computing Core

$fn = 120;

in_to_mm = 25.4;
outer_dia = 8.5 * in_to_mm;      // 215.9 mm
total_depth = 10.0 * in_to_mm;   // 254.0 mm
wall_thickness = 5;              // Structural shield thickness

module main_housing() {
    difference() {
        union() {
            // Main Outer Cylinder Body
            cylinder(h = total_depth, d = outer_dia, center = false);
            
            // Exterior T-Slot launching rail interface shoe
            translate([(outer_dia / 2) - 2, -15, 20]) {
                difference() {
                    cube([20, 30, total_depth - 40]);
                    translate([8, -1, -1]) cube([14, 32, total_depth - 38]);
                }
            }
        }
        
        // Internal Cavity Core
        translate([0, 0, wall_thickness]) {
            cylinder(h = total_depth + 1, d = outer_dia - (2 * wall_thickness), center = false);
        }
        
        // Base Port for Blind-Mate Optical Telemetry Connector
        translate([0, 0, -1]) {
            cylinder(h = wall_thickness + 2, d = 2.0 * in_to_mm, center = false);
        }
        
        // Top Inside Lip Cutout for Screw Thread Mating
        translate([0, 0, total_depth - 15]) {
            cylinder(h = 16, d = outer_dia - (wall_thickness / 2), center = false);
        }
    }
    
    // Internal Circular Telemetry PCB Standoff Mounting Blocks
    for (a =) {
        rotate([0, 0, a]) {
            translate([(outer_dia / 2) - 15, -5, wall_thickness]) {
                difference() {
                    cube([10, 10, 15]);
                    translate([5, 5, 2]) cylinder(h = 14, d = 3.2); // M3 Screw Clearance
                }
            }
        }
    }
}

module threaded_locking_cap() {
    translate([outer_dia + 40, 0, 0]) {
        union() {
            // Cap Cover Plate with Integrated Viton O-Ring Groove
            cylinder(h = 8, d = outer_dia, center = false);
            
            // Thread Engagement Collar
            translate([0, 0, 8]) {
                difference() {
                    cylinder(h = 12, d = outer_dia - wall_thickness - 0.5, center = false);
                    translate([0, 0, -1]) cylinder(h = 14, d = outer_dia - (3 * wall_thickness), center = false);
                }
            }
        }
    }
}

main_housing();
threaded_locking_cap();
