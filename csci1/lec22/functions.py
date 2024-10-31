def printFrom1To(n):
    # we get to use n here to print from 1 to n
    for x in range(1, n+1):
        print(x)

printFrom1To(5)

print()

printFrom1To(10)

import math
math.sqrt(2)

print()

print(printFrom1To(3)) # the function gives back None

print()

def sum(x, y):
    # you say "return blah" when you want to
    # give back blah to whoever called you
    return x + y

print(sum(2, 3) * 2)

sum(5, 10) # we're not doing anything with the result :(

print()

print(sum(5, 10))

print()

def sum_bad(x, y):
    # this function is incorrect
    # it's just printing--it's not giving back the answer
    print(x + y)

print(sum_bad(2, 3)) # print(None)

print()

print(sum_bad(4, 5) * 6) # print(None * 6)

print()

#############

def make_range(start, end):
    i = start
    L = []
    while i <= end:
        L = L + [i]
        i = i + 1

    return L

print(make_range(1, 10) * 2)












