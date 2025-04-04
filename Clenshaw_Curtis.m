clc; clear; close all;

f = @(x) x.^2 + 2*x +1;
a = 0;
b = 3;
n = 2;

[x_clenshaw, w_clenshaw] = fclencurt(n+1, a, b);
I_clenshaw = sum(w_clenshaw .* f(x_clenshaw));
I_exact = integral(f, a, b);
error_percentage = abs((I_clenshaw - I_exact) / I_exact) * 100;

fprintf('Exact Integral Value: %.6f\n', I_exact);
fprintf('Clenshaw-Curtis Approximation: %.6f\n', I_clenshaw);
fprintf('Error Percentage: %.6f%%\n', error_percentage);
fprintf('Computed Weights for n = %d:\n', n);
disp(w_clenshaw);

figure;
bar([I_exact, I_clenshaw]);
set(gca, 'XTickLabel', {'Exact Value', 'Clenshaw-Curtis'});
ylabel('Integral Value');
title('Comparison of Exact and Clenshaw-Curtis Integration');
text(1, I_exact, sprintf('%.5f', I_exact), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
text(2, I_clenshaw, sprintf('%.5f', I_clenshaw), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');

figure;
plot(x_clenshaw, f(x_clenshaw), 'bo', 'MarkerFaceColor', 'b');
xlabel('x values');
ylabel('f(x)');
title('Function Values at Clenshaw-Curtis Nodes');
grid on;

figure;
bar(x_clenshaw, w_clenshaw);
xlabel('x values (Nodes)');
ylabel('Weights');
title('Clenshaw-Curtis Weights');
grid on;


function [x, w] = fclencurt(N1, a, b)
N = N1 - 1; 
bma = b - a;
c = zeros(N1, 2);
c(1:2:N1, 1) = (2 ./ [1 1 - (2:2:N).^2])'; 
c(2,2) = 1;
f = real(ifft([c(1:N1, :); c(N:-1:2, :)]));
w = bma * ([f(1,1); 2 * f(2:N,1); f(N1,1)]) / 2;
x = 0.5 * ((b + a) + N * bma * f(1:N1,2));
end
