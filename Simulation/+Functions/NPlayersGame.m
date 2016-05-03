% The function npg solves an n-person finite non-co-operative game to
% compute one sample Nash Equilibrium. It uses an optimization formulation
% of n-person non-co-operative games as described in the adjoining paper
% "An Optimization Formulation to Compute Nash Equilibrium in finite
% Games" presented by the author.
%
% The inputs to the function are:
% a) M : The row vector containing number of strategies of each player.
% b) U : The matrix containing the pay-offs to the players at various
%        pure strategy combinations.
%
% The outputs are:
% a) A : The matrix whose columns are mixed strategies to players at Nash
%        equilibrium.
% b) payoff : The row vector containing the pay-offs to the players at Nash
%        equilibrium.
% c) iterations : Number of iterations performed by the optimization
%        method.
% d) err : The absolute error in the objective function of the minimization
%        problem.
%
% For theory of the method the adjoining paper may be consulted. Here an
% example is given for explanantion. Consider a 3-person game where each
% player has 2 strategies each. So M = [2 2 2]. Suppose the pay-offs at the
% pure strategy combinations (1-1-1), (1-1-2) and so on, as described by
% the ranking in the theory, are given as the matrix U =
% [2,7.5,0;3,.2,.3;6,3.6,1.5;2,3.5,5;0,3.2,9;2,3.2,5;0,2,3.2;2.1,0,1]. Then
% after supplying M and U call [A,payoff,iterations,err] = npg(M,U).
%
% The method is capable of giving one sample Nash equilibrium out of
% probably many present in a given game. The screenshot showing GUI has 
% been developed on the code using it as dll and VB.Net. The GUI software 
% may be made available on request.
%
% Any error in the code may be reported to bhaskerchatterjee@gmail.com. Any
% suggestion/comment is greatly appreciated.

function [A,payoff,iterations,err] = NPlayersGame(M,U)

p = 1; V = 1;
n = length(M);
s = sum(M);
A = zeros(max(M),n);
payoff = zeros(1,n);

for i = 1 : n
    p = p * M(1,i);
end

if p ~= size(U,1) || n ~= size(U,2)
    error('Error: Dimension mismatch!');
end

P = zeros(1,n);
N = zeros(1,n);
P(n) = 1;

for i = n-1 : -1 : 1
    P(i) = P(i+1) * M(i+1);
end

for i = 1 : n
    N(i) = p / P(i);
end

x0 = zeros(s,1); k = 1;

for i = 1 : n
    for j = 1 : M(1,i)
        x0(k) = 1 / M(1,i); k = k + 1;
    end
end

Us = sum(U,2);

for i = 1 : n
    V = V * (1 / M(i)) ^ M(i);
end

x0 = [x0 ; V * (sum(U,1)')];
Aeq = zeros(n,s+n); cnt = 0;

for i = 1 : n
    if i ~= 1
        cnt = cnt + M(i-1);
    end
    for j = 1 : s
        if j <= sum(M(1:i)) &&  j > cnt
            Aeq(i,j) = 1;
        end
    end
end

beq = ones(n,1);
I = ones(p,n);
counter = 0; count = 1;

for i = 1 : n
    for j = 1 : N(i)
        counter = counter + 1;
        if i ~= 1
            if counter > sum(M(1:i))
                counter = counter-M(i);
            end
        end
        for k = 1 : P(i)
            I(count) = counter;
            count = count + 1;
        end
    end
end

lb = zeros(s+n,1);
ub = ones(s+n,1);
pay = zeros(s,1);
counter = 0;

for i = 1 : n
    for j = 1 : M(i)
        counter = counter + 1;
        pay(counter) = i + s;
    end
end

for i = 1 : n
    lb(s+i) = -inf;
    ub(s+i) = inf;
end

[x,fval,exitflag,output] = gamer(n,Us,p,I,s,ub,lb,x0,Aeq,beq,pay,U);

count = 0;

for i = 1 : n
    for j = 1 : M(i)
        count = count + 1;
        A(j,i) = abs(x(count));
    end
    payoff(1,i) = x(s+i);
end

iterations = output.iterations;
err = abs(fval);
end

function [x,fval,exitflag,output] = gamer(n,Us,p,I,s,ub,lb,x0,Aeq,beq,pay,U)

    function F = myfun(x)
        Funct = 0;
        prod = 1;
        for i = 1 : n
            Funct = Funct + x(s+i);
        end
        for i = 1 : p
            for j = 1 : n
                prod = prod * x(I(i,j));
            end
            Funct = Funct - Us(i) * prod;
            prod = 1;
        end
        F = Funct;
    end

    function [c ceq] = confun(x)
        C = zeros(s,1);
        for i = 1 : s
            C(i) = -x(pay(i));
            for t = 1 : n
                add = 0;
                for j = 1 : p
                    prd = 1;
                    for k = 1 : n
                        if i == I(j,k)
                            prd = prd * U(j,k);
                        else
                            prd = prd * x(I(j,k));
                        end
                    end
                    if I(j,t) ~= i
                        prd = 0;
                    end
                    add = add + prd;
                end
                C(i) = add + C(i);
            end
        end
        c = C;
        ceq = [];
    end

options = optimset('Display','off');
warning 'off' 'all';
[x,fval,exitflag,output] = fmincon(@myfun,x0,[],[],Aeq,beq,lb,ub,@confun,options);

end