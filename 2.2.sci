function val = get_x(n_idx)
    val = zeros(1, length(n_idx));
    for i = 1:length(n_idx)
        k = n_idx(i);
        if k >= -2 & k <= 1 then
            val(i) = 1;
        elseif k == 2 | k == 3 then
            val(i) = 0.5;
        end
    end
endfunction

// tao 1 cua so chua 2 do thi
function plot_compare(n, x_orig, x_trans, title_trans)
    figure; 
    f = gcf(); f.background = 8;
    
    // Tin hieu goc
    subplot(2,1,1); plot2d3(n, x_orig, 2); title('Original x(n)');
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n)-1, min(0, min(x_orig))-1; max(n)+1, max(x_orig)+1];
    
    // Tin hieu bien doi
    subplot(2,1,2); plot2d3(n, x_trans, 5); title(title_trans);
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n)-1, min(0, min(x_trans))-1; max(n)+1, max(x_trans)+1];
endfunction

n = -6:6; 
x_origin = get_x(n);

xa = get_x(n - 2);                                // (a) x(n-2)
xb = get_x(4 - n);                                // (b) x(4-n)
xc = get_x(n + 2);                                // (c) x(n+2)

u_2_minus_n = bool2s((2 - n) >= 0);
xd = get_x(n) .* u_2_minus_n;                     // (d) x(n)u(2-n)

delta_n_3 = bool2s(n == 3);
xe = get_x(n - 1) .* delta_n_3;                   // (e) x(n-1)delta(n-3)

xf = get_x(n.^2);                                 // (f) x(n^2)

x_even = (get_x(n) + get_x(-n)) / 2;              // (g) Even part
x_odd  = (get_x(n) - get_x(-n)) / 2;              // (h) Odd part


plot_compare(n, x_origin, xa, '(a) x(n-2)');
plot_compare(n, x_origin, xb, '(b) x(4-n)');
plot_compare(n, x_origin, xc, '(c) x(n+2)');
plot_compare(n, x_origin, xd, '(d) x(n)u(2-n)');
plot_compare(n, x_origin, xe, '(e) x(n-1)delta(n-3)');
plot_compare(n, x_origin, xf, '(f) x(n^2)');
plot_compare(n, x_origin, x_even, '(g) Even part of x(n)');
plot_compare(n, x_origin, x_odd, '(h) Odd part of x(n)');
