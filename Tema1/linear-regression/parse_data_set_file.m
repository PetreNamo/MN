function [Y, InitialMatrix] = parse_data_set_file(filepath)

  %functie de citire din fisier si care creeaza vectorul coloana Y si
  %matricea initiala

  fid = fopen(filepath, 'r');
  m = fscanf(fid, "%d", 1)
  n = fscanf(fid, "%d", 1)
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1 : m

    Y(i) = fscanf(fid, "%d", 1);
    line = fgetl(fid);
    values = strsplit(line);
    InitialMatrix(i, :) = values(2 : end);

  endfor

endfunction
