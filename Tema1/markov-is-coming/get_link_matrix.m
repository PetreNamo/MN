function [Link] = get_link_matrix(Labyrinth)

  %primeste matricea initiala si returneaza matricea legaturilor

  [m n] = size(Labyrinth);
  Link = spalloc(m * n + 2, m * n + 2);
  for i = 1 : m
    for j = 1 : n

      a = bitget(Labyrinth(i, j), 1 : 4);

      c = 0;
      if a(4)==0
        c++;
      endif

      if a(3)==0
        c++;
      endif

      if a(2)==0
        c++;
      endif

      if a(1)==0
        c++;
      endif


      if (a(4)==0 && i==1)

        Link(n * (i - 1) + j, m * n + 1) = 1 / c;

      else if a(4)==0

        Link(n * (i - 1) + j, n * (i - 2) + j) = 1 / c;

      endif
      endif

      if (a(3)==0 && i==m)

        Link(n * (i - 1) + j, m * n + 1) = 1 / c;

      else if a(3)==0

        Link(n * (i - 1) + j, n * (i) + j) = 1 / c;

      endif
      endif

      if (a(2)==0 && j==n)

        Link(n * (i - 1) + j, m * n + 2) = 1 / c;

      else if a(2)==0

        Link(n * (i - 1) + j, n * (i - 1) + j + 1) = 1 / c;

      endif
      endif

      if (a(1)==0 && j==1)

        Link(n * (i - 1) + j, m * n + 2) = 1 / c;

      else if a(1)==0

        Link(n * (i - 1) + j, n * (i - 1) + j - 1) = 1 / c;

      endif
      endif

    endfor
  endfor

  Link(m * n + 1, m * n + 1) = 1;
  Link(m * n + 2, m * n + 2) = 1;

endfunction

