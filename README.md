# PuzzleCube
Schematics, design, and code for a puzzle cube

## Software Used
 - <a href="inkscape.org">Inkscape</a>
 - <a href="maperitive.net">Maperitive</a>
 - <a href="https://github.com/arkypita/LaserGRBL/releases">LaserGRBL</a>
 - < ahref="https://www.openscad.org/">OpenSCAD</a>

## Process Notes

### Laser engraving OSM maps

1. Using Maperitive:
 - Create styling rule as desired. e.g. To draw only roads:
 ```
 features
	lines
		major road : @isOneOf(highway, trunk, trunk_link, primary, primary_link, secondary, tertiary)
		minor road : @isOneOf(highway, unclassified, residential, service, living_street)
		path : @isOneOf(highway, path, footway, pedestrian, steps) OR (highway=track AND @isOneOf(tracktype, grade4, grade5))

properties
	//map-background-color : #181818
rules
	target : major road
		define
			line-width : 3
		draw : line
		stop
	target : minor road
		define
			line-width : 1
		draw : line
	target : path
		define
			line-width : 0.5
		draw : line
```
 - Export as SVG

2. Import into Inkscape
 - Maperitive exports funny SVG (see https://groups.google.com/forum/#!topic/maperitive/r1k19tpBYhw). In particular, highways are exported as "symbols"/"clones", so are not editable in Inkscape. So we need to fix this as follows:
 - Select each layer in turn
 - Ctrl+A to select everything on th elayter
 - Edit > Clone > Unlink Clone
 - This might make it look funky. So, then from the Fill and Stroke menu, set fill set to None
 - Simplify if necessary

3. Import into LaserGRBL
