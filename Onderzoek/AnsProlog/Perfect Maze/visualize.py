import math

# Calculate dimension
lines = 0
with open("data.txt") as f:
    for lines, l in enumerate(f):
        pass
    lines += 1

dim = math.sqrt(lines + 1)

# Initialize output array
output = []
i=0
while i < ((dim*2)-1):
    output.append([])
    j=0
    if i%2 == 0:
        while j < (dim-1):
            output[i].append("()")
            output[i].append("  ")
            j+=1
        output[i].append("()")
    else:
        while j < (dim):
            output[i].append("  ")
            output[i].append("  ")
            j+=1
    i+=1

# Generate array
with open("data.txt") as f:
    for line in f:
        x = int(line[7])
        y = int(line[9])
        # Parent is at X-1
        if line[11] == "-":
            if x > 1:
                output[(2*y)-2][(2*x)-3] = "\x1B[31m==\x1B[0m"
        # Parent is at X+1
        elif line[11] == "1":
            if x < dim:
                output[(2*y)-2][(2*x)-1] = "\x1B[31m==\x1B[0m"
        # Parent is at Y-1
        elif line[13] == "-":
            if y > 1:
                output[(2*y)-3][(2*x)-2] = "\x1B[33m||\x1B[0m"
        # Parent is at Y+1
        elif line[13] == "1":
            if y < dim:
                output[(2*y)-1][(2*x)-2] = "\x1B[33m||\x1B[0m"

# Print array
print
for row in output:
    for e in row:
        print e,
    print
print
