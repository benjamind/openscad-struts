module strut_end(radius=10,tab_length=20,hole_radius=3,sides=6) {
	difference() {
		union() {
			hull() {
				rotate((360/sides)/2,[0,0,1])
					cylinder(h=1,r=radius,center=true,$fn=sides);
				translate([0,0,-(radius-1)])
					rotate(45,[1,0,0])
						rotate(90,[0,1,0])
							rotate(90,[0,0,1])
								cylinder(h=3,r=radius,$fn=36,center=true);
			}
			translate([0,0,-tab_length-radius])
				rotate(90,[0,1,0])
					cylinder(h=3,r=radius, $fn=35, center=true);
			translate([0,0,-tab_length/2 -radius + 1])
				cube([3,radius*2,tab_length],center=true);
		}
		translate([-10,0,-tab_length-radius])
			rotate(90,[0,1,0])
				cylinder(h=30,r=hole_radius,$fn=35);
	}
};
module pipe(radius=10,length=50,tab_length=20,hole_radius=3,sides=6) {
	translate([0,0,-(length/2) + 0.5])
		strut_end(radius=radius,tab_length=tab_length,hole_radius=hole_radius,sides=sides);
	
	rotate((360/sides)/2,[0,0,1])
		cylinder(h=length,r=radius,$fn=sides,center=true);
	
	translate([0,0,(length/2) + 0.5])
		rotate(180,[1,0,0])
			strut_end(radius=radius,tab_length=tab_length,hole_radius=hole_radius,sides=sides);

}

pipe();
translate([20,0,0])
	pipe(radius=5);
translate([50,0,0])
	pipe(length=100,sides=35,tab_length=30);