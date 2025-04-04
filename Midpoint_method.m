clc; clear;

f = @(x) x.^2 + 2*x + 1;
a = 0; 
b = 3; 
n = 3;

dx = (b - a) / n; 
midpoint_sum = 0; 
midpoints = zeros(1, n); 
f_midpoints = zeros(1, n);

for i = 1:n
    xi = a + (i - 0.5) * dx;
    midpoints(i) = xi; 
    f_midpoints(i) = f(xi);
    midpoint_sum = midpoint_sum + f(xi);
end

midpoint_result = dx * midpoint_sum;
exact_value = integral(f, a, b);
error_percentage = abs((exact_value - midpoint_result) / exact_value) * 100;
disp(['Midpoint Rule Approximation: ', num2str(midpoint_result)]);
disp(['Exact Integral Value: ', num2str(exact_value)]);
disp(['Error Percentage: ', num2str(error_percentage), '%']);

figure; 
fplot(f, [a, b], 'b', 'LineWidth', 2);
hold on; 
stem(midpoints, f_midpoints, 'r', 'LineWidth', 1.5);
title('Midpoint Rule Approximation'); 
xlabel('x'); 
ylabel('f(x)'); 
grid on; 
hold off;
