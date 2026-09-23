// STORMSTOPPER LGM-15 Housing Canister
// Dimensions: 8.5" Outer Diameter, 10" Total Depth
// Designed by Emerald City Techs for FOX5 Vegas Computing Core

$fn = 100; // Smooth fragments for geometric calculation

// Unit Conversion Factors
in_to_mm = 25.4;
outer_dia = 8.5 * in_to_mm;
total_depth = 10.0 * in_to_mm;
wall_thickness = 5; // Structural wall envelope in mm

module stormstopper_canister() {
    difference() {
        // Main Physical Outer Cylinder
        cylinder(h = total_depth, d = outer_dia, center = false);
        
        // Internal Cavity for LGM-15 Core Assembly
        translate([0, 0, wall_thickness]) {
            cylinder(h = total_depth, d = outer_dia - (2 * wall_thickness), center = false);
        }
        
        // Base Port for Blind-Mate Telemetry Connector Interface
        translate([0, 0, -1]) {
            cylinder(h = wall_thickness + 2, d = 2.0 * in_to_mm, center = false);
        }
    }
    
    // Integrated Mounting Shoe for External Launch Rails
    translate([(outer_dia / 2) - 2, -15, 20]) {
        difference() {
            cube([20, 30, total_depth - 40]);
            
            // Negative space cut for T-Slot rail slide engagement
            translate([8, -1, -1]) {
                cube([14, 32, total_depth - 38]);
            }
        }
    }
}

stormstopper_canister();
