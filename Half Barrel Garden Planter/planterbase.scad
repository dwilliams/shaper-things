barrel_diameter = 23;
overall_height = 36;

// Calculated dimensions
top_width = barrel_diameter + 2;
bottom_width = barrel_diameter + 6;

top_bottom_offset = (bottom_width - top_width) / 2;

board_dim_short = 1;
board_dim_long = 3.75;
board_rotation = atan(top_bottom_offset / overall_height);

difference() {
    translate([(-0.5 * bottom_width),0]) {
        polygon([[0,0],[bottom_width,0],[(top_width + top_bottom_offset),overall_height],[top_bottom_offset,overall_height]]);
    }

    translate([0, overall_height]) {
        circle(barrel_diameter/2);
    }

    translate([0,0]) {
        circle(barrel_diameter/2);
    }

    translate([(-0.25 * barrel_diameter) - board_dim_short, (0.5 * overall_height) - (0.5 * board_dim_long)]) {
        rotate([0, 0, (-1 * board_rotation)]) {
            square([board_dim_short,board_dim_long]);
        }
    }

    translate([(0.25 * barrel_diameter), (0.5 * overall_height) - (0.5 * board_dim_long)]) {
        rotate([0, 0, board_rotation]) {
            square([board_dim_short,board_dim_long]);
        }
    }
}