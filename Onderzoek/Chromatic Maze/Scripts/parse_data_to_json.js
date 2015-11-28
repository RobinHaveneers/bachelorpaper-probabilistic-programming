var fs = require('fs');
var dict = [];

fs.readFile('Scripts/data.txt', function(err, data) {
    if(err) throw err;
    var array = data.toString().split("\n");
    for (i=0; i<array.length - 1; i++) {
      if(array[i].substring(0,1) !== "s") {
        var tile = array[i].substring(0,4);
        var xco = array[i].substring(5,6);
        var yco = array[i].substring(7,8);
        var color = array[i].slice(9, array[i].indexOf(")"));
        dict.push({
          name:tile,
          x : xco,
          y : yco,
          color: color,
        })
      }
      else {
        var sxco = array[i].substring(17,18);
        var syco = array[i].substring(19,20);
        var fxco = array[i].substring(21,22);
        var fyco = array[i].substring(23,24);
        dict.push({
          name:"s-f",
          sx : sxco,
          sy : syco,
          fx : fxco,
          fy : fyco,
        })
      }
    }
    fs.writeFile("Scripts/parsed_data.js", JSON.stringify(dict), function(err) {
        if(err) {
            return console.log(err);
        }

        console.log("The file was saved!");
    });
});
