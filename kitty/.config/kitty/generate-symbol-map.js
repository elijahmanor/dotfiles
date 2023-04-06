const fs = require("fs");

const rows = fs.readFileSync("./test-fonts.sh", "utf8").split("\n");

let symbolMap = "";
let isCapturing = false;
for (let i = 0; i < rows.length; i++) {
  const row = rows[i];
  if (row.includes("function test-fonts() {")) {
    isCapturing = true;
    continue;
  } else if (isCapturing) {
    if (row.includes(`echo "`)) {
      const [, title] = row.match(/"(.*)"/); 
      symbolMap += `# ${title}\n`;
    } else if (row.includes(`print-unicode-ranges`)) {
      let [, codes] = row.match(/print-unicode-ranges (.*)/) || [];
      codes = codes.split(" ");
      let ranges = [];
      for (let j = 0; j < codes.length; j+=2) {
        ranges.push([codes[j], codes[j+1]]);
      }
      ranges = ranges.map(([first, last]) => {
        return `U+${first}-U+${last}`;
      });
      symbolMap += `symbol_map ${ranges.join(",")} Symbols Nerd Font\n\n`;
    } else if (row.includes("}")) {
      break;
    }
  }
}

fs.writeFileSync('./symbol-map.conf', symbolMap);

console.log("done");
