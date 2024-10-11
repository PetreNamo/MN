function [Adj] = get_adjacency_matrix(Labyrinth)

  %primeste codificarea initiala a labirintului si returneaza matricea
  %de adiacenta

  [m n] = size(Labyrinth);
  Adj = spalloc(m*n+2, m*n+2);

  for i = 1 : m
    for j = 1 : n

      a = bitget(Labyrinth(i, j), 1 : 4);

      if (a(4)==0 && i==1)

        Adj(n * (i - 1) + j, m * n + 1) = 1;

      else if a(4)==0

        Adj(n * (i - 1) + j, n * (i - 2) + j) = 1;

      endif
      endif

      if (a(3)==0 && i==m)

        Adj(n * (i - 1) + j, m * n + 1) = 1;

      else if a(3)==0

        Adj(n * (i - 1) + j, n * (i) + j) = 1;

      endif
      endif

      if (a(2)==0 && j==n)

        Adj(n * (i - 1) + j, m * n + 2) = 1;

      else if a(2)==0

        Adj(n * (i - 1) + j, n * (i - 1) + j + 1) = 1;

      endif
      endif

      if (a(1)==0 && j==1)

       Adj(n * (i - 1) + j, m * n + 2) = 1;

      else if a(1)==0

        Adj(n * (i - 1) + j, n * (i - 1) + j - 1) = 1;

      endif
      endif

    endfor
  endfor

  Adj(m * n + 1, m * n + 1) = 1;
  Adj(m * n + 2, m * n + 2) = 1;

endfunction

