// --- Delay function ---
function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

// --- Goi ham ---
xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;

[yn, yorigin] = delay(xn, xorigin, k);
disp("yn      = "); disp(yn);
disp("yorigin = " + string(yorigin));

// --- Truc n ---
nx = (1 - xorigin):(length(xn) - xorigin);
ny = (1 - yorigin):(length(yn) - yorigin);

// --- Ve bang plot voi mau ro rang ---
plot(nx, xn, 'b-o', 'LineWidth', 2);   // x(n): xanh duong, diem tron
plot(ny, yn, 'r-s', 'LineWidth', 2);   // y(n): do, diem vuong

legend(['x(n)'; 'y(n)']);
title('delay: y(n) = x(n - 1)');
xlabel('n');
ylabel('A');
xgrid(3);
