function log_val = func_ci_single_Q(n_pt, n_s, X, lambda, z, prior_mu, prior_nu, prior_a, prior_b)

log_val = 0;

for j = 1:n_s
    log_val = log_val + 0.5*log(prior_nu(j)) - 0.5*prior_nu(j)*(z(j) - prior_mu(j))^2;
    for i = 1:n_pt
        if ~isnan(X(i,j))
            log_val = log_val + 0.5*log(lambda(i)) - 0.5*lambda(i)*(X(i,j) - z(j))^2;
        end
    end
end

for i = 1:n_pt
   log_val = log_val + (prior_a(i)-1)*log(lambda(i)) - prior_b(i)*lambda(i); 
end