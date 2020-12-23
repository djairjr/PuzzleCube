
// Build the box
// LEFT SIDE
translate([-7.2,0,0])
    rotate([90,0,90]){
        outside_left();
        translate([0,0,3.6])
            inside_left();
        translate([59.6,0,7.2])
            slide_left();
    }
// TOP
translate([0,0,53-3.6]) {
    top();
    translate([16,3.6,-3.6])
        inside_top();
    translate([18,5,3.6])
    for(rows = [0:2]){
        for(columns = [0:7]){
            translate([7+12.8*columns, 42.2+16*rows, 0])
                switch();
        }
    }    
}
// FRONT
translate([0,3.6,3])
    rotate([90,0,0])
        front();
// BACK
translate([143.2,112,3])
    rotate([90,0,180])
        front();
// BASE
base();


//
module outside_left() {
    linear_extrude(3.6)
    polygon(points =[
    [0,0],[115,0],[115,53],[0,53],
    [15,15],[45,15],[45,38],[15,38],
    [70,15],[100,15],[100,38],[70,38],
    ],  
    paths = [[0,1,2,3], [4,5,6,7], [8,9,10,11]]);
}

// Viewed from inside
module inside_left() {
    color([180/255, 60/255, 200/255],0.8)
    linear_extrude(3.6)
    difference() {
        polygon(points =[
        // Bottom side
        [0,0],[16.8,0],[16.8,3.6],[33.4,3.6],[33.4,0],[49.4,0],[49.4,3.6],[66,3.6],[66,0],[82.2,0],[82.2,3.6],[99,3.6],[99,0],
        // Right side
        [115,0],
        // Top side
        [115,53],[99,53],[99,53-3.6],[106.5,53-3.6],[106.5,53-8.3],[92.3,53-8.3],[92.3,53-3.6],[89.1,53-3.6],[89.1,53-8.3],[74.8,53-8.3],[74.8,53-3.6],[82.3,53-3.6],[82.3,53],[66.3,53],[66.3,53-3.6],[49.6,53-3.6],[49.6,53],[33.2,53],[33.2,53-3.6],[17,53-3.6],[17,53],
        // Left side
        [0,53],[0,42],[3.6,42],[3.6,32],[0,32],[0,21.6],[3.6,21.6],[3.6,11.8],[0,11.8],[0,0]
        ]);
        
        // Cutout window
        polygon(points =[[70,15],[100,15],[100,38],[70,38]]);
        // Bottom hole
        polygon(points =[[56,6],[59.6,6],[59.6,9.2],[56,9.2]]);
        // Top hole
        polygon(points =[[56,38.4],[59.6,38.4],[59.6,41.6],[56,41.6]]);
    } 
}

// Viewed from inside
module slide_left() {
    color([150/255, 60/255, 200/255],0.8)
    linear_extrude(3.6)
    difference() {
        polygon(points =[
        [0,0], [55.8,0], [55.8,45.6], [47,45.6], [47,42.6], [34.8,42.6], [34.8,45.6],
        [27.6,45.6],[27.6,42.6],[15.6,42.6],[15.6,45.6],[0,45.6],[0,31.8],[-20,31.8],[-20,10.2],[0,10.2],[0,0]      
        ]);
    } 
}

module switch(){
    switch_cap();
    translate([-4.6-.8,1.8,-13.2+3.6])
    rotate([90,0,0])
    switch_body();
}

module switch_cap() {
    color([220/255, 200/255, 180/255], 0.8)
    linear_extrude(3.6)
    difference(){
        circle(d=9.2);
        polygon(points=[[-1.4,-1.8],[1.4,-1.8],[1.4,1.8],[-1.4,1.8]]);
    }
}

module switch_body() {
    linear_extrude(3.6)
    polygon(points=[[0,0],[10.8,0],[10.8,2.8],[6.8,2.8],[6.8,13.2],[4,13.2],[4,2.8],[0,2.8],[0,0]]);
}

module top() {
    color([200/255, 140/255, 200/255],0.8)
    linear_extrude(3.6)
    difference(){
        polygon(points =[
            // Bottom side
            [0,0],[20.4,0],[20.4,3],[41,3],[41,0],[102.8,0],[102.8,3],[123.4,3],[123.4,0],
            // Right side
            [143.6,0],[143.6,16.6],[146.6,16.6],[146.6,33],[143.6,33],[143.6,49.8],[146.6,49.8],[146.6,65.6],[143.6,65.6],[143.6,82.2],[146.6,82.2],[146.6,98.2],[143.6,98.2],
            // Top side
            [143.6,115],[123.4,115],[123.4,112],[102.8,112],[102.8,115],[41,115],[41,112],[20.4,112],[20.4,115],   
            // Left side
            [0,115],[0,98.2],[-3,98.2],[-3,82.2],[0,82.2],[0,65.6],[-3,65.6],[-3,49.8],[0,49.8],[0,33],[-3,33],[-3,16.6],[0,16.6],[0,0]
        ]);

        for(rows = [0:2]){
            for(columns = [0:7]){
                translate([23.4+12.8*columns, 45.4+16*rows, 0])
                    polygon(points=[[0,0],[3.2,0],[3.2,7.8],[0,7.8],[0,0]]);
            }
        }
    }
}

module inside_top() {
    color([180/255, 60/255, 200/255],0.8)
    linear_extrude(3.6)
    difference(){
        polygon(points =[
            // Bottom side
            [0,0],[47.4,0],[47.4,-7.6],[62.6,-7.6],[62.6,0],
            // Right side
            [110.4,0],
            // Top side
            [110.4,107.8],[62.6,107.8],[62.6,115.4],[47.4,115.4],[47.4,107.8],   
            // Left side
            [0,107.8],[0,0]
        ]);
        for(rows = [0:2]){
            for(columns = [0:7]){
                translate([7+12.8*columns, 42.2+16*rows, 0])
                polygon(points=[[0,0],[3.2,0],[3.2,7.8],[0,7.8],[0,0]]);
            }
        }
    }
}

module front() {
    color([220/255, 170/255, 210/255],0.8)
    linear_extrude(3.6)
    polygon(points =[
        // Bottom side
        [0,0],[20.4,0],[20.4,-3],[41,-3],[41,0],[61.6,0],[61.6,-3],[82,-3],[82,0],[102.8,0],[102.8,-3],[123.4,-3],[123.4,0],
        // Right side
        [140.2,0],
        // Top side
        [140.2,46.8],[123.4,46.8],[123.4,46.8+3],[102.8,46.8+3],[102.8,46.8],[82,46.8],[82,46.8-3],[61.6,46.8-3],[61.6,46.8],[41,46.8],[41,46.8+3],[20.4,46.8+3],[20.4,46.8],
        // Left side
        [0,46.8],[0,38], [-3,38],  [-3,28.4], [0,28.4], [0,18.2], [-3,18.2], [-3,8.4], [0,8.4], [0,0]
    ]);
} 

module base() {
    color([100/255, 180/255, 100/255],0.8)
    linear_extrude(3.6)
    difference(){
        polygon(points =[
            // Bottom side
            [0,0],[20.4,0],[20.4,3],[41,3],[41,0],[61.6,0],[61.6,3],[82,3],[82,0],[102.8,0],[102.8,3],[123.4,3],[123.4,0],
            // Right side
            [143.6,0],[143.6,16.6],[146.6,16.6],[146.6,33],[143.6,33],[143.6,49.8],[146.6,49.8],[146.6,65.6],[143.6,65.6],[143.6,82.2],[146.6,82.2],[146.6,98.2],[143.6,98.2],
            // Top side
            [143.6,115],[123.4,115],[123.4,112],[102.8,112],[102.8,115],[82,115],[82,112],[61.6,112],[61.6,115],[41,115],[41,112],[20.4,112],[20.4,115],   
            // Left side
            [0,115],[0,98.2],[-3,98.2],[-3,82.2],[0,82.2],[0,65.6],[-3,65.6],[-3,49.8],[0,49.8],[0,33],[-3,33],[-3,16.6],[0,16.6],[0,0]
        ]);

        for(i = [0:2]){
                translate([33+37.6*i, 56.4, 0])
                    polygon(points=[[0,0],[3.8,0],[3.8,3.8],[0,3.8],[0,0]]);

        }
    }
} 