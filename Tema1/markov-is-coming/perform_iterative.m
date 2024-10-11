function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

  %aplicam o forma a metodei Jacobi modificata pentru
  %a functiona in program
  [n n] = size(G);
  x = zeros(n, 1);
  err = 0;

  for steps = 1 : max_steps

    x(1 : n) = (c(1 : n) + G(1 : n, :) * x0);

    if norm(x - x0) < tol
      break;
      err = norm(x - x0);
    endif
    x0 = x;
  endfor

endfunction
