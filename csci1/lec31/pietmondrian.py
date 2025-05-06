import turtle
import random

turtle.speed("fastest")
turtle.shape("turtle")

turtle.pensize(8) # thick lines

def drawRectangle(upper_left, width, height, color):
    turtle.up()
    turtle.fillcolor(color)
    turtle.pencolor('black')
    turtle.goto(upper_left)
    turtle.down()
    turtle.begin_fill()
    turtle.setheading(0) # face east
    turtle.forward(width)
    turtle.right(90)
    turtle.forward(height)
    turtle.right(90)
    turtle.forward(width)
    turtle.right(90)
    turtle.forward(height)
    turtle.end_fill()

def drawLine(start, end, color='black'):
    turtle.up()
    turtle.pencolor(color)
    turtle.goto(start)
    turtle.down()
    turtle.goto(end)

def pickRandomColor():
# make white appear 6× more often
    colors = ['red', 'yellow', 'blue', 'black'] + (['white'] * 6)
    return random.choice(colors)

# our drawing space will be from (-270, -360) to (270, 360)
minx, miny = -270, -360
maxx, maxy = 270, 360

MIN_SIZE = 75

def piet_mondrian(minx, maxx, miny, maxy):
    # base case: this square is too small in both axes--we are forced
    # to draw something here and be done
    if maxx - minx < MIN_SIZE and maxy - miny < MIN_SIZE:
        choice = 'draw'
    else:
        # choose to either draw something here (15%) or split (85%)
        choice = random.choices(['draw', 'split'], weights=[15, 85])[0]
    # if we choose to split, either split vertically (58%) or horizontally (42%)
    if choice == 'draw':
        drawRectangle((minx, maxy), maxx - minx, maxy - miny, pickRandomColor())
        print('draw', (minx, maxx, miny, maxy))
    else: # choice == 'split'
        if maxx - minx < MIN_SIZE:
            choice = 'vertically'
        elif maxy - miny < MIN_SIZE:
            choice = 'horizontally'
        else: # pick one
            choice = random.choices(['vertically', 'horizontally'], weights=[58, 42])[0]

        if choice == 'vertically':
            print(f'miny={miny}, maxy={maxy}')
            split = random.randint(miny + 20, maxy - 20)
            print(f'  split vertically at {split}')
            piet_mondrian(minx, maxx, miny, split)
            piet_mondrian(minx, maxx, split, maxy)
        else: # choice == 'horizontally'
            print(f'minx={minx}, maxx={maxx}')
            split = random.randint(minx + 20, maxx - 20)
            print(f'  split horizontally at {split}')
            piet_mondrian(minx, split, miny, maxy)
            piet_mondrian(split, maxx, miny, maxy)

piet_mondrian(minx, maxx, miny, maxy)

# draw white lines around the edges
#  drawLine((minx, maxy), (maxx, maxy), 'white')
#  drawLine((maxx, maxy), (maxx, miny), 'white')
#  drawLine((maxx, miny), (minx, miny), 'white')
#  drawLine((minx, miny), (minx, maxy), 'white')

turtle.hideturtle()
turtle.done()
