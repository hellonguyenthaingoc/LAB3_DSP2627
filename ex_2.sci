// --- Advance function ---
function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;
endfunction

// --- Goi ham ---
xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;

[yn, yorigin] = advance(xn, xorigin, k);
disp("yn      = "); disp(yn);
disp("yorigin = " + string(yorigin));

// --- Truc n ---
nx = (1 - xorigin):(length(xn) - xorigin);
ny = (1 - yorigin):(length(yn) - yorigin);

// --- Ve tin hieu roi rac
h1 = plot2d3(nx, xn, style=2);
h2 = plot2d3(ny, yn, style=5);


legend([h1, h2], ['x(n)', 'y(n)']);

title('advance: y(n) = x(n + 1)');
xlabel('n');
ylabel('A');
xgrid(3);
