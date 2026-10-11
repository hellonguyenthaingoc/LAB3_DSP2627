
clc; clear; close;

// --- Ham tinh gia tri x(m) ---
function v = xval(m)
    if (m >= -3) & (m <= -1) then
        v = 1 + m/3;
    elseif (m >= 0) & (m <= 3) then
        v = 1;
    else
        v = 0;
    end
endfunction

// --- Truc n ---
n = -8:8;
N = length(n);

// --- Tinh 4 tin hieu ---
xa  = zeros(1, N);   // (a) x(n)
xb1 = zeros(1, N);   // (b1) x(-n+4)
xb2 = zeros(1, N);   // (b2) x(-n-4)
xc  = zeros(1, N);   // (c) x(-n+4)

for i = 1:N
    xa(i)  = xval(n(i));
    xb1(i) = xval(-n(i) + 4);
    xb2(i) = xval(-n(i) - 4);
    xc(i)  = xval(-n(i) + 4);
end

scf(1); clf;

// --- (a) x(n) ---
subplot(4,1,1);
plot2d3(n, xa, style=5);

title('(a) x(n)');
xlabel('n'); ylabel('A');
xgrid(4);

// --- (b1) x(-n+4) ---
subplot(4,1,2);
plot2d3(n, xb1, style=5);

title('(b1) Lat truoc, tre 4: y = x(-n+4)');
xlabel('n'); ylabel('A');
xgrid(4);

// --- (b2) x(-n-4) ---
subplot(4,1,3);
plot2d3(n, xb2, style=5);

title('(b2) Tre 4 truoc, lat sau: y = x(-n-4)');
xlabel('n'); ylabel('A');
xgrid(4);

// --- (c) x(-n+4) ---
subplot(4,1,4);
plot2d3(n, xc, style=5);

title('(c) x(-n+4)');
xlabel('n'); ylabel('A');
xgrid(4);
