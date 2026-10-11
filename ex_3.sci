// --- Fold function ---
function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
endfunction

// --- Goi ham voi vi du ---
xn = [1, -2, 3, 6];
xorigin = 3;

[yn, yorigin] = fold(xn, xorigin);
disp("yn      = "); disp(yn);
disp("yorigin = " + string(yorigin));

// --- Truc n ---
nx = (1 - xorigin):(length(xn) - xorigin);
ny = (1 - yorigin):(length(yn) - yorigin);

// --- Ve tin hieu roi rac
h1 = plot2d3(nx, xn, style=2);
h2 = plot2d3(ny, yn, style=5);

legend([h1, h2], ['x(n)', 'y(n)']);

title('fold: y(n) = x(-n)');
xlabel('n');
ylabel('A');
xgrid(3);
