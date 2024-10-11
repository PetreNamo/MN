function [Labyrinth] = parse_labyrinth(filepath)

  %functie pentru citirea matricei cu codificari

  fid = fopen(filepath,'r');
  data = fscanf(fid,"%f");
  m = data(1);
  n = data(2);
  Labyrinth = zeros(m, n);
  c = 3;
  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = data(c);
      c++;
    endfor
  endfor

endfunction
