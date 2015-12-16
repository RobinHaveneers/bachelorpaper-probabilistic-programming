var fs = require('fs');
var dict = {};

var tile_char = /tile_char\((\d+),(\d+),([\w\d]+)\)/;
var tile_color = /tile_color\((\d+),(\d+),(\w+)\)/;
var grid = /tile_grid\((\d+),(\d+)\)/;

fs.readFile('Scripts/data.txt', function(err, data) {
    if(err) throw err;
    var array = data.toString().split("\n");
    var counter = 0;
    console.log(array[0]);
    for (i=0; i<array.length - 1; i++) {
      if(array[i].length > 0) {

        var fact = array[i];
        var temp1 = {};
        var grid_match = grid.exec(fact);
        if(grid_match != null) {
          temp1['dimx'] = grid_match[1];
          temp1['dimy'] = grid_match[2];
          dict["dim"] = temp1;

        }

        var char_match = tile_char.exec(fact);
        if(char_match != null) {
          var xch = char_match[1];
          var ych = char_match[2];
          var ch = char_match[3];

          var temp  = {};
          temp['x'] = xch;
          temp['y'] = ych;
          temp['char'] = ch;
          dict[xch.toString() + ych.toString()] = temp;
          counter ++;
        }

        var color_match = tile_color.exec(fact);
        if(color_match != null) {
          var xcol = color_match[1];
          var ycol = color_match[2];
          var col = color_match[3];

          if(dict[xcol.toString() + ycol.toString()] == undefined) {
            var temp2  = {};
            temp2['x'] = xcol;
            temp2['y'] = ycol;
            temp2['char'] = "#";
            temp2['color'] = col;
            dict[xcol.toString() + ycol.toString()] = temp2;
          }

          else {
            dict[xcol.toString() + ycol.toString()]['color'] = col;
          }
        }
      }


    }
    console.log(dict);
    fs.writeFile("Scripts/parsed_data.js", JSON.stringify(dict), function(err) {
        if(err) {
            return console.log(err);
        }
        console.log("The characters file was saved!");
    });
});
