## Copyright (C) 2023 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} task2 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2023-02-28

function new_X = task2 (photo, pcs)
  [m n] = size(photo);

  % initializare matrice finala.
  new_X = zeros(m, n);

  % TODO: cast photo la double.
  A = cast(photo, "double");

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  u = zeros(m, 1);
  u = mean(A, 2);
  A = A - u;

  % TODO: construieste matricea Z.
  Z = A' / sqrt(n - 1);

  % TODO: calculeaza matricile U, S si V din SVD aplicat matricii Z
  [U S V] = svd(Z);

  % TODO: construieste matricea W din primele pcs coloane ale lui V
  W = V(:, 1 : pcs);

  % TODO: cacluleaza matricea Y
  Y = W' * A;

  % TODO: aproximeaza matricea initiala
  Ak = W * Y + u;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = cast(Ak, "uint8");

endfunction
