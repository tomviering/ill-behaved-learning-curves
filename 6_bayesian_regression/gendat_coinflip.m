function [X,y,wtrue,Xtmp] = gendat_coinflip(N,d,model_correct)
% builds a Nx(d*2+1) dataset with fourier-basis

if (model_correct == 0)
    sigma2 = 1/20;
else
    sigma2 = 1/40;
end

y = nan(N,1);

for i = 1:N

    if (rand(1,1) > 0.5)&&(model_correct == 0)
        Xtmp(i,:) = 0;
        y(i) = 0;
    else
        Xtmp(i,:) = (rand(1,1)-0.5)*2*pi;
        y(i) = randn(1,1)*sqrt(sigma2);
    end

    X(i,1) = 1/sqrt(2*pi);

    curfeat = 1;
    curind = 2;
    for j_unused = 1:d
        X(i,curind) = 1/sqrt(pi)*cos(curfeat*Xtmp(i));
        curind = curind + 1;
        X(i,curind) = 1/sqrt(pi)*sin(curfeat*Xtmp(i));
        curind = curind + 1;
        curfeat = curfeat+1;
    end
end

wtrue = zeros(d*2+1,1);
