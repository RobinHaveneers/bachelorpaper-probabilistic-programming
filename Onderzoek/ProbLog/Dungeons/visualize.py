import re
import math

with open('data.txt', 'r') as myfile:
    data=myfile.read().replace('\n', '')

gem = re.search('gem\(\(\d+, \d+\)\)',data).group(0).split(',')
altar =  re.search('altar\(\(\d+, \d+\)\)',data).group(0).split(',')
rest = re.findall("\(\d+, \d+, [a-z]+\)", data)

dim = int(math.sqrt(len(gem) + len(altar) + len(rest)))

output = [["." for i in range(dim)] for j in range(dim)]

if len(gem[0])==6:
    xgem = gem[0][-1:]
else:
    xgem = gem[0][-2:]
if len(gem[1])==4:
    ygem = gem[1][1:2]
else:
    ygem = gem[1][1:3]

if len(altar[0])==8:
    xaltar = altar[0][-1:]
else:
    xaltar = altar[0][-2:]
if len(altar[1])==4:
    yaltar = altar[1][1:2]
else:
    yaltar = altar[1][1:3]

output[int(ygem)-1][int(xgem)-1] = "\x1B[32mG\x1B[0m"
output[int(yaltar)-1][int(xaltar)-1] = "\x1B[31mA\x1B[0m"

for i in rest:
    i = (((i.replace("(","")).replace(")","")).replace(" ", "")).split(",")
    if i[2] == "wall":
        output[int(i[1])-1][int(i[0])-1] = "\x1B[36mW\x1B[0m"

print
for row in output:
    for e in row:
        print e,
    print
print
