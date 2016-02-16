dim = 5
output = [[" " for i in range(0, dim)] for j in range(0, dim)]
# Veld verdubbelen !!

for row in output:
    for e in row:
        print e,
    print

with open("data3.txt") as f:
    for line in f:
        print line
        x = int(line[7])
        y = int(line[9])
        print x
        print y
        if line[11] == "-":
            if x > 1:
                output[x-2][y-1] = "="
        elif line[11] == "1":
            if x < dim-1:
                output[x][y-1] = "="
        elif line[13] == "-":
            if y > 1:
                output[x-1][y-2] = "|"
        elif line[13] == "1":
            if y < dim:
                output[x-1][y] = ""

for row in output:
    for e in row:
        print e,
    print
