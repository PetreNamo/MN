function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)

  %functia calculeaza functia de cost conform formulei din enunt
  %inmultind fiecare coloana din FM cu Theta, scazand Y si adaugand
  %patratul la o suma

  [m n] = size(FeatureMatrix);
  h0 = zeros(m, 1);

  h0 = FeatureMatrix * Theta(2 : end, 1);

  Error = 0;

  for i = 1 : m

    a = h0(i, 1) - Y(i, 1);
    Error = Error + a^2;

  endfor

  Error = 1/(2 * m) * Error;

endfunction
