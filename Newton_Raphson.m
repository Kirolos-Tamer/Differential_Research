clc;
clear;

f = @(x) x.^2 + 2*x + 1;
df = @(x) 2*x + 2;
max_iter = 4;

x0 = 0;
tol = 1e-5;
x_vals = linspace(-2, 1, 100); 
y_vals = f(x_vals);
fprintf('   x_n            f(x_n)       f''(x_n)      x_{n+1}    \n');

figure;
hold on;
plot(x_vals, y_vals, 'm', 'LineWidth', 2);

for i = 0:max_iter
    fx = f(x0);
    dfx = df(x0);
    if dfx == 0
        fprintf('Derivative is zero. Stopping iteration.\n');
        break;
    end
    x1 = x0 - fx / dfx;
    fprintf('  %7.4f   %12.4f   %10.4f   %10.4f  \n', x0, fx, dfx, x1);
    tangent_x = linspace(x1 - 1, x0 + 1, 10);
    tangent_y = f(x0) + df(x0) * (tangent_x - x0);
    plot(tangent_x, tangent_y, 'b', 'LineWidth', 1.5);
    plot([x0, x0], [0, f(x0)], 'k--');
    scatter(x0, f(x0), 100, 'k', 'filled');
    if abs(x1 - x0) < tol
        break;
    end
    x0 = x1;
end

xlabel('x');
ylabel('y');
title('Newton-Raphson Method');
legend('y = f(x)', 'Tangents', 'Iterations', 'Location', 'best');
grid on;
hold off;
