function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    n = n_min:n_max;
    
    y1 = zeros(1, length(n));
    y2 = zeros(1, length(n));
    y1(n1 - n_min + 1) = x1n;
    y2(n2 - n_min + 1) = x2n;
    
    yn = y1 + y2;
    yorigin = 1 - n_min;
    
    // Ve x1(n)
    subplot(3,1,1); plot2d3(n, y1, 3); title('x1(n)'); 
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    
    // Ve x2(n)
    subplot(3,1,2); plot2d3(n, y2, 2); title('x2(n)'); 
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    
    // Ve y(n)
    subplot(3,1,3); plot2d3(n, yn, 5); title('y(n) = x1(n) + x2(n)'); 
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
endfunction

//chay thu
disp("Dang chay kiem tra ham ADD...");
[y_add, org_add] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2);
disp("yn = "); disp(y_add);
disp("yorigin = "); disp(org_add);
