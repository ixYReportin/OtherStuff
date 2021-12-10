clear
px = [0 4]; py = [0,  3];
vx = [1, 0]; vy = [3, 3];
plot (px, py, 'b*');
axis equal; hold on;
quiver (px(1), py(1), vx(1), vy(1));
quiver (px(2), py(2), vx(2), vy(2));
syms a3 a2 a1 a0 t
x(t) = a3*t^3 + a2*t^2 + a1*t +a0;
xd(t) = diff(x, t);
t1 = 0; t2 = 1;
ex = [x(t1) == px(1),...
    x(t2) == px(2),...
    xd(t1) == vx(1),...
    xd(t2) == vx(2)]
mx = solve(ex, [a3 a2 a1 a0])
cx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0])
syms b3 b2 b1 b0 
y(t) = b3*t^3 + b2*t^2 + b1*t +b0;
yd(t) = diff(y, t);
ey = [y(t1) == py(1),...
    y(t2) == py(2),...
    yd(t1) == vy(1),...
    yd(t2) == vy(2)]
my = solve(ey, [b3 b2 b1 b0])
cy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0])
fplot(cx, cy, [t1 t2], 'r')

%csatlakozas

rx = [px(2),  8];
ry = [py(2),  4];
ux = [vx(2),  1];
uy = [vy(2), -4];

fplot(rx,ry, '*');
quiver(rx(1),ry(1),ux(1),uy(1));
quiver(rx(2),ry(2),ux(2),uy(2));

t3 = -1; t4 = 1;
ex = [x(t3) == rx(1),...
    x(t4) == rx(2),...
    xd(t3) == ux(1),...
    xd(t4) == ux(2)]
mx = solve(ex, [a3 a2 a1 a0])
dx(t) = subs(x, [a3 a2 a1 a0], [mx.a3 mx.a2 mx.a1 mx.a0])

ey = [y(t3) == ry(1),...
    y(t4) == ry(2),...
    yd(t3) == uy(1),...
    yd(t4) == uy(2)]
my = solve(ey, [b3 b2 b1 b0])
dy(t) = subs(y, [b3 b2 b1 b0], [my.b3 my.b2 my.b1 my.b0])
fplot(dx,dy,[t3 t4], 'b')