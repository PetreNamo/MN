function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)

  %programul calculeaza conform formulei vectorul Theta ce contine
  %coeficientii pentru metoda gradientului descendent

  h = zeros(n, 1);
  J = zeros(n, 1);
  h = h - Y;

  for i = 1 : n
    J(i, 1) = (1 / m) * h * FeatureMatrix(i, :);

  endfor

  Theta = zeros(n, 1);

  for i = 1 : iter

    Theta = Theta - alpha * J;

  endfor

endfunction
