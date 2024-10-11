function [path] = heuristic_greedy(start_position, probabilities, Adj)

  %algoritmul va primi pozitia de start si vectorul probabilitatilor
  %de catig pentru fiecare casuta si returneaza un drum de castig
  path = [0];
  path = [start_position];
  [n n] = size(Adj);
  visited = zeros(1, n);
  visited(start_position) = 1;

  while isempty(path)==0

    position = path(end);

    if position == n-1
      return;
    endif

    ok = 1;

    for i = 1 : n

      if(Adj(position, i)==1 &&  visited(i)==0)
        ok = 0;
      endif

    endfor

    if ok==1
      path(end) = [];
    endif

    maxi = 0;

    for i = 1 : n
      if(Adj(position, i)==1 && visited(i)==0 && probabilities(i) > maxi)
        neigh = i;
        maxi = probabilities(i);
      endif
    endfor

    visited(neigh) = 1;
    path = [path; neigh];
  endwhile
endfunction
