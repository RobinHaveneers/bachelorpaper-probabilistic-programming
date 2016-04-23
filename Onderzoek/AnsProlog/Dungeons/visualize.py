import re
import math

with open('data.txt', 'r') as myfile:
    data=myfile.read().replace('\n', '')

gem = re.search('gem\(\(\d+,\d+\)\)',data).group(0).split(',')
altar =  re.search('altar\(\(\d+,\d+\)\)',data).group(0).split(',')
rest = re.findall('sprite\(\(\d+,\d+\),[a-z]+\)', data)
width = re.search('width\(\d+\)', data).group(0)
dim = int(((width.replace("width","")).replace("(","")).replace(")",""))
print dim
output = [["." for i in range(dim)] for j in range(dim)]

if len(gem[0])==6:
    xgem = gem[0][-1:]
else:
    xgem = gem[0][-2:]
if len(gem[1])==4:
    ygem = gem[1][0]
else:
    ygem = gem[1][0:1]

if len(altar[0])==8:
    xaltar = altar[0][-1:]
else:
    xaltar = altar[0][-2:]
if len(altar[1])==4:
    yaltar = altar[1][0]
else:
    yaltar = altar[1][0:1]

output[int(ygem)-1][int(xgem)-1] = "\x1B[32mG\x1B[0m"
output[int(yaltar)-1][int(xaltar)-1] = "\x1B[31mA\x1B[0m"

for i in rest:
    i = ((((i.replace("sprite","")).replace("(","")).replace(")","")).replace(" ", "")).split(",")
    if i[2] == "wall":
        output[int(i[1])-1][int(i[0])-1] = "\x1B[36mW\x1B[0m"
print
for row in output:
    for e in row:
        print e,
    print
print
