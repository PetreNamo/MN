function [Y, FeatureMatrix] = parse_csv_file(file_path)

  %programul citeste un fisier csv si il transforma in matricea FM
  %similar cu prima functie
  pkg load io;
  A = csv2cell(file_path, 1);
  [m n] = size(A);

  Y = cell2mat(A(:, 1));
  FeatureMatrix = A(:, 2 : n);

endfunction
