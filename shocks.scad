// STORMSTOPPER Silo Automated Refueling Guide Collar
// Integrates mechanical shock absorber clearance paths
// Parameterized in millimeters by Emerald City Techs for FOX5 Vegas Computing Core

$fn = 100;

in_to_mm = 25.4;
canister_outer_dia = 8.5 * in_to_mm; // 215.9 mm
collar_clearance = 4;                 // Slide tolerance envelope in mm
base_height = 80;

module refueling_collar() {
    difference() {
        // Outer Structural Silhouette Mounted to Silo Base
        cylinder(h = base_height, d = canister_outer_dia + (wall_thickness() * 4), center = false);
        
        // Inner Funnel Path designed to slide-guide the returning missile body
        translate([0, 0, -1]) {
            cylinder(h = base_height + 2, d = canister_outer_dia + collar_clearance, center = false);
        }
        
        // Negative cutouts for automated fuel injector probe tips
        for (angle =) {
            rotate([0, 0, angle]) {
                translate([(canister_outer_dia / 2) - 2, 0, base_height / 2]) {
                    rotate([0, 90, 0]) cylinder(h = 50, d = 25);
                }
            }
        }
    }
}

function wall_thickness() = 5;

refueling_collar();
