clc; clear;

f = @(x) x.^2 + 2*x + 1;
a = 0; 
b = 3; 
n = 3;

dx = (b - a) / n; 
x_values = linspace(a, b, n+1);
f_values = f(x_values);
trapezoidal_result = (dx/2) * (f_values(1) + 2*sum(f_values(2:end-1)) + f_values(end));
exact_value = integral(f, a, b);
error_percentage = abs((exact_value - trapezoidal_result) / exact_value) * 100;
disp(['Trapezoidal Rule Approximation: ', num2str(trapezoidal_result)]);
disp(['Exact Integral Value: ', num2str(exact_value)]);
disp(['Error Percentage: ', num2str(error_percentage), '%']);

figure; 
fplot(f, [a, b], 'b', 'LineWidth', 2); % رسم الدالة
hold on; 
plot(x_values, f_values, 'ro-', 'LineWidth', 1.5); % تمثيل النقاط المستخدمة
title('Trapezoidal Rule Approximation'); 
xlabel('x'); 
ylabel('f(x)'); 
grid on; 
hold off;