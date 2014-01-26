# SWFAutolayoutSandbox

A collection of layout examples using autolayout. My sandbox for experiementing with (and archiving solutions to) autolayout problems.

## Layouts

### Centering Sets of Views

There are two examples of laying out more than one view with instinsic sizes in their container. It's easy to do this with one view, but two or more, not so much.

The first example lays them out in relation to them each other with two invisible, flexible views that "squeeze" them from either side into the middle. This trick here was to make the squeezing views the the same size and to try to be "too big" with a "less than or equal" rule and a lower priority than the other views.

The second example lays them out into a container view which is centered. The tricky bit here was how do you size the container view? You do this by constraining it not with width and height directly, but with horizontal and vertical spacing constraints from the container to the children. You have to remember that constraints are *really* directional; you tend to think of them as constraining property X of view A to property Y of view B and that is flows in one direction, but that's wrong. The relationship is bidirectioal, between properties X & Y of views A & B and the both influence each other. In fact, they have reciprical meaing; saying X is 50% as wide as Y is equivilent to saying Y is 200% as wide as X.

### Mimicing System Views

I wanted to replicate a toolbar with flexible layout as simply as possible. This is really trivial; in fact, the only peer contraints are baseline alignment.

### Proportional Layout

This isn't hard, except that it can't currently be done with Xcode 5.0 without code. This experiment has a "placeholder" constraint to satisfy layout in interface builder that's is replaced with manual constraints at run time. There are two ways; one proportional to the parent, the other proportional to a peer.

## TODO List

Problems I'm still trying to puzzle out:

* "Responsive" constraints. In other words, two sets of constraints with different priorities, the first of which becomes "impossible" at a certain size at which point the second set kicks in.