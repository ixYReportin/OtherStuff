clear
syms x y;

f(x,y) = (x-1)^2 + (y-1)^2 -1;
g = 0.5;
hold on; axis equal;

fimplicit(f);
fplot(g);

eq = [ f(x,y) == 0, f(x,g) == 0];
m = solve(eq, [x,y]);
    for i=1:length(m.x)/2
M = [m.x(i),m.y(i)];
plot(M(1),M(2),".",'MarkerSize',20);
    end