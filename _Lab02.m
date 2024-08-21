%% Drill problem 2.3
clear all; clc

samples = [-1. 0. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14.] ;
input = [ 0 -1 -1 -1  1  1  1  0  0  0  0  0  0  0  0  0] ;
impulse_response = [1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0] ;
samples_output = [-1. 0. 1. 2. 3. 4. 5. 6. 7. 8. 9. 10. 11. 12. 13. 14. 15. 16. 17. 18. 19. 20. 21. 22. 23. 24. 25. 26. 27. 28. 29];

output = conv(samples, impulse_response);

%% Plotting

subplot(3, 1, 1);
stem(samples, input, 'b', 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');

subplot(3, 1, 2);
stem(samples, impulse_response, 'g', 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('h[n]');

subplot(3, 1, 3);
stem(samples_output, output, 'r', 'filled');
title('Output Signal y[n]');
xlabel('n');
ylabel('y[n]');

%Better visualization
xlim([0, length(output)]);
sgtitle('Convolution of input x[n]�and impulse response�h[n]');