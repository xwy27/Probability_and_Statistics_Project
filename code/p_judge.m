% Judge the distribution for every sample with 100(1-alpha)% confidence
function result = p_judge(alpha)

data = build();
[r,~] = size(data);

% Details for result
% origin denotes the database(Two imension Matrix)
% distribution denotes the total(index : 1) and the counters for diverse distributions (index: 2~7)
% normal denotes the total(index: 1) of the symbolic normal distribution samples and their positions(index: 2~3)
% gamma denotes the total(index: 1) of the symbolic gamma distribution samples and their positions(index: 2~3)
% poison denotes the total(index: 1) of the symbolic poison distribution samples and their positions(index: 2~3)
% exponential denotes the total(index: 1) of the symbolic exponential distribution samples and their positions(index: 2~3)
% weibull denotes the total(index: 1) of the symbolic weibull distribution samples and their positions(index: 2~3)
% lognormal denotes the total(index: 1) of the symbolic lognormal distribution samples and their positions(index: 2~3)
result.origin = data;
result.distribution = [0, 0, 0, 0, 0, 0, 0];
result.normal = [0, 0, 0];
result.gamma = [0, 0, 0];
result.poison = [0, 0, 0];
result.exponential = [0, 0, 0];
result.weibull = [0, 0, 0];
result.lognormal = [0, 0, 0];

for row = 1 : r
    A = data(row, 2 : data(row,1) + 1);
    
    % Normal Distribution
    [mean,sd]=normfit(A);
    p1=normcdf(A,mean,sd);
    [H1,p] = kstest(A,[A',p1'],alpha);
    if H1==0
        result.distribution(1) = result.distribution(1) + 1;
        result.distribution(2) = result.distribution(2) + 1;
        if p >= 0.15 && result.normal(1) < 3
            result.normal(result.normal(1) + 2) = row;
            result.normal(1) = result.normal(1) + 1;
        end
    end
    
    % Gamma Distribution
    phat=gamfit(A,alpha);
    if phat(1) ~= Inf
        p2=gamcdf(A,phat(1),phat(2));
        [H2,p] = kstest(A,[A',p2'],alpha);
        if H2==0
            result.distribution(1) = result.distribution(1) + 1;
            result.distribution(3) = result.distribution(3) + 1;

            if p >= 0.15 && result.gamma(1) < 3
                result.gamma(result.gamma(1) + 2) = row;
                result.gamma(1) = result.gamma(1) + 1;
            end
        end
    end
    
    % Poison Distribution
    lamda=poissfit(A,alpha);
    p3=poisscdf(A,lamda);
    [H3,p] = kstest(A,[A',p3'],alpha);
    if H3==0
        result.distribution(1) = result.distribution(1) + 1;
        result.distribution(4) = result.distribution(4) + 1;
        
        if p >= 0.15 && result.poison(1) < 3
            result.poison(result.poison(1) + 2) = row;
            result.poison(1) = result.poison(1) + 1;
        end
    end
    
    % Exponential Distribution
    lamda=expfit(A,alpha);
    p4=expcdf(A,lamda);
    [H4,p] = kstest(A,[A',p4'],alpha);
    if H4==0
        result.distribution(1) = result.distribution(1) + 1;
        result.distribution(5) = result.distribution(5) + 1;
        
        if p >= 0.08 && result.exponential(1) < 3
            result.exponential(result.exponential(1) + 2) = row;
            result.exponential(1) = result.exponential(1) + 1;
        end
    end
    
    % Weibull Distribution
    parmhat = wblfit(A, alpha);
    if parmhat(2) ~= Inf
        p5=wblcdf(A, parmhat(1), parmhat(2));
        [H5,p] = kstest(A,[A',p5'],alpha);
        if H5==0
            result.distribution(1) = result.distribution(1) + 1;
            result.distribution(6) = result.distribution(6) + 1;

            if p >= 0.15 && result.weibull(1) < 3
                result.weibull(result.weibull(1) + 2) = row;
                result.weibull(1) = result.weibull(1) + 1;
            end
        end
    end
    
    % Lognormal Distribution
    phat = lognfit(A, alpha);
    if phat(2) ~= 0
        p6 = logncdf(A, phat(1), phat(2));
        [H6,p] = kstest(A,[A',p6'],alpha);
        if H6==0
            result.distribution(1) = result.distribution(1) + 1;
            result.distribution(7) = result.distribution(7) + 1;

            if p >= 0.15 && result.lognormal(1) < 3
                result.lognormal(result.lognormal(1) + 2) = row;
                result.lognormal(1) = result.lognormal(1) + 1;
            end
        end
    end
end


