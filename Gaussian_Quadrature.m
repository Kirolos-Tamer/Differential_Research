clc; clear; close all;
 
f = @(x) 5 .* x .* exp(-2 .* x);  
a = 0.1;  
b = 1.3;  
n = 2;  

[x_gauss, w_gauss] = lgwt(n, a, b);  
I_gauss = sum(w_gauss .* f(x_gauss));   
I_exact = integral(f, a, b);  


fprintf('Integration using Gaussian Quadrature: %.6f\n', I_gauss);  
fprintf('Exact Solution: %.6f\n', I_exact);  
error_percent = abs(I_gauss - I_exact) / I_exact * 100;  
fprintf('Error Percentage = %.5f %%\n', error_percent);  

x_plot = linspace(a, b, 100);  
y_plot = f(x_plot);  
 
figure;  
hold on;  
plot(x_plot, y_plot, 'b-', 'LineWidth', 2, 'DisplayName', 'Original function f(x)');  
scatter(x_gauss, f(x_gauss), 100, 'ro', 'filled', 'DisplayName', 'Gaussian nodes');  
legend show;  
xlabel('x');  
ylabel('f(x)');  
title('Comparison of Gaussian Nodes with the Original Function');  
grid on;  
hold off;  

function [x, w] = lgwt(N, a, b)  
    beta = 0.5 ./ sqrt(1 - (2*(1:N-1)).^(-2));   
    T = diag(beta,1) + diag(beta,-1);  
    [V,D] = eig(T);  
    x = diag(D);  
    w = 2 * (V(1,:)'.^2);  

    x = (b-a)/2 * x + (b+a)/2;   
    w = (b-a)/2 * w;  
end  
