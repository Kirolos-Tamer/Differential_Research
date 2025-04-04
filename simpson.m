clc;
clear;

f = @(x) x.^2 + 2*x + 1;  
a = 0;
b = 3;
n = 11;  
exact_value = integral(f,a,b);

h = (b - a) / n; 
x_vals = linspace(a, b, n+1);  
y_vals = f(x_vals);

integral_value = (3*h/8) * (f(x_vals(1)) + f(x_vals(end)) + 3*sum(y_vals(2:3:end-1)) + 3*sum(y_vals(3:3:end)) + 2*sum(y_vals(4:3:end-2)));

error = abs((exact_value - integral_value) / exact_value) * 100;

fprintf('The integral value is: %.5f\n', integral_value);
fprintf('Exact value: %.5f\n', exact_value);
fprintf('Error: %.5f%%\n', error);

figure;
fplot(f, [a, b], 'b', 'LineWidth', 2); hold on;
plot(x_vals, y_vals, 'ro-', 'LineWidth', 1.5);
scatter(x_vals, y_vals, 100, 'k', 'filled');

title('Simpson''s 3/8 Rule Approximation');
xlabel('x'); ylabel('f(x)');
legend('Function f(x)', 'Sampled Points', 'Location', 'Best');
grid on;
hold off;
