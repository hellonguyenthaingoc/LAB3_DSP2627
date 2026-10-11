function val = get_x26(n_idx)
    val = zeros(1, length(n_idx));
    val((n_idx >= 0) & (n_idx <= 3)) = 1;
endfunction

function plot_single26(n, sig, title_name, color_code)
    figure; 
    f = gcf(); f.background = 8;
    
    plot2d3(n, sig, color_code); title(title_name);
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n)-1, min(0, min(sig))-1; max(n)+1, max(sig)+1];
endfunction

n = -4:6;
x_n = get_x26(n);                 // (1) x(n)
y_n = get_x26(n.^2);              // (2) y(n) = x(n^2)
y_shifted = get_x26((n-2).^2);    // (3) y(n-2)
x2_n = get_x26(n - 2);            // (4) x2(n) = x(n-2)
y2_n = get_x26(n.^2 - 2);         // (5) y2(n) = x2(n^2)


plot_single26(n, x_n, '(1) Input x(n)', 2);
plot_single26(n, y_n, '(2) Output y(n) = x(n^2)', 5);
plot_single26(n, y_shifted, '(3) Shifted output y(n-2)', 5);
plot_single26(n, x2_n, '(4) Shifted input x2(n) = x(n-2)', 2);
plot_single26(n, y2_n, '(5) y2(n) = Output of shifted input', 5);
