var fs = require('fs');
var dict = [];

fs.readFile('Scripts/data.txt', function(err, data) {
    if(err) throw err;
    var array = data.toString().split("\n");
    for (i=0; i<array.length - 1; i++) {
      var xco = array[i].substring(5,6);
      var yco = array[i].substring(7,8);
      var color = array[i].slice(9, array[i].indexOf(")"));
      dict.push({
        x: xco,
        y : yco,
        color: color,
      })
    }
    fs.writeFile("Scripts/parsed_data.js", JSON.stringify(dict), function(err) {
        if(err) {
            return console.log(err);
        }

        console.log("The file was saved!");
    });
});
