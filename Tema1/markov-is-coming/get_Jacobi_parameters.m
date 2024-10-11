function [G, c] = get_Jacobi_parameters(Link)

  %functia primeste matricea legaturilor si returneaza matricea si vectorul
  %de iteratie pentru metoda Jacobi
  [m n] = size(Link);
  G = spalloc(m - 2, n - 2);
  c = spalloc(m - 2, 1);

  for i = 1 : m - 2
    for j = 1 : n - 2
      if Link(i, j)!=0
        G(i, j) = Link(i, j);
      endif
    endfor
  endfor

  for i = 1 : m - 2
    if Link(i, n - 1)!=0
      c(i) = Link(i, n - 1);
    endif
  endfor

endfunction
