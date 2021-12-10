clear
axis equal;
hold on,
px = [1, 4];vx = [5, 6];
py = [4, 9];vy = [3, 2];
plot(px, py, 'b*');
quiver(px(1), py(1), vx(1), vy(1))
quiver(px(2), py(2), vx(2), vy(1))
t0 =0; t1 =1;
syms a3 a2 a1 a0 t
x(t)=a3*t^3+a2*t^2+a1*t+a0;
dx = diff(x,t);
ex =[x(t0)==px(1),...
    x(t1)==px(2),...
    dx(t0)==vx(1),...
    dx(t1)==vx(2)];
mx = solve (ex,[a3,a2,a1,a0])
cx = subs(x,[a3,a2,a1,a0],[mx.a3,mx.a2,mx.a1,mx.a0])
syms b3 b2 b1 b0
y(t)=b3*t^3+b2*t^2+b1*t+b0;
dy = diff(y,t);
ey =[y(t0)==py(1),...
    y(t1)==py(2),...
    dy(t0)==vy(1),...
    dy(t1)==vy(2)];
my = solve (ey,[b3,b2,b1,b0])
cy = subs(y,[b3,b2,b1,b0],[my.b3,my.b2,my.b1,my.b0])
fplot(cx,cy,[t0 t1])