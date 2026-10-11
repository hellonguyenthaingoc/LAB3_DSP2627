function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    
    n1 = (1:length(xn)) - xorigin;
    n2 = (1:length(hn)) - horigin;
    
    n_min = min(n1) + min(n2);
    n_max = max(n1) + max(n2);
    n = n_min:n_max;
    
    yorigin = xorigin + horigin - 1; 
    
    // Ve x(n)
    subplot(3,1,1); plot2d3(n1, xn, 3); title('x(n)');
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n1)-1, min(0, min(xn))-1; max(n1)+1, max(xn)+1];
    
    // Ve h(n)
    subplot(3,1,2); plot2d3(n2, hn, 2); title('h(n)');
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n2)-1, min(0, min(hn))-1; max(n2)+1, max(hn)+1];
    
    // Ve y(n)
    subplot(3,1,3); plot2d3(n, yn, 5); title('y(n) = x(n) * h(n)');
    e=gce(); e.children.thickness=2; a=gca(); a.background=8; xgrid();
    a.data_bounds = [min(n)-1, min(0, min(yn))-1; max(n)+1, max(yn)+1];
endfunction

//chay thu
disp("Dang chay kiem tra ham CONVOLUTION...");
[y_conv, org_conv] = convolution([1, 2, 1], 1, [1, -1, 1], 2);
disp("yn = "); disp(y_conv);
disp("yorigin = "); disp(org_conv);
