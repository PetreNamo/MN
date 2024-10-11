function [decoded_path] = decode_path(path, lines, cols)

  %folosind vectorul traseului de castig calculam si afisam traseul urmat

  decoded_path = [0 0];
  [n m] = size(path);

  a = path(1);
  x = floor(a / cols);
  if mod(a, cols)==0
    x--;
  endif

  y = a - cols * x;
  decoded_path = [x+1 y];

  for i = 2 : n-1

    a = path(i);
    x = floor(a / cols);

    if mod(a, cols)==0
      x--;
    endif

    y = a - cols * x;
    decoded_path = [decoded_path; [x+1 y]];

  endfor

endfunction

