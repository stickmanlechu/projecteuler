import math

def find(d):
    x = 2
    while True:
        y = math.sqrt(((x + 1) * (x - 1)) / d)
        if y.is_integer():
            return x
        x += 1

def is_square(num):
    sq = int(math.sqrt(num))
    return sq * sq == num

max_x = 0
max_d = 0
for d in range(10, 1000):
    if not is_square(d):
        x = find(d)
        max_x = max(x, max_x)
        if max_x == x:
            max_d = d
print(max_d)
        
