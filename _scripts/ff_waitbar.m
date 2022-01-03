% example showing progress bar as Taylor series expansion of
% exponential function is calculated

lim = 5000;   % # of terms in expansion
x = 0.2;   % value of exponent
taylor = 0;

tic
f = waitbar(0,'Progress');   % establish progress bar
for i = 0:lim
   waitbar(i/lim,f,'Progress');    % update progress bar every iteration
   taylor = taylor + x^i/factorial(i);   % add term to Taylor expansion
end
toc

% waitbar(0.67,f,'Progress')
close(f)   % close progress bar
taylor - exp(x)