function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  %functia transforma matricea InitialMatrix punand in loc de no 0 si yes 1
  %si mai adauga o coloana pentru transformarea cuvintelor furnished in
  %codificari

  [m n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n + 1);
  ok = 0;
  v = zeros(m, 1);

  for i = 1 : m
    for j = 1 : n

      if isnan(str2double(InitialMatrix{i, j}))==0
        FeatureMatrix(i, j) = str2num(InitialMatrix{i, j});

      elseif strcmp(InitialMatrix{i, j}, 'yes')
        FeatureMatrix(i, j) = 1;

      elseif strcmp(InitialMatrix{i, j}, 'no')
        FeatureMatrix(i, j) = 0;

      elseif strcmp(InitialMatrix{i, j}, 'unfurnished')
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j+1) = 1;
        v(i, 1) = 1;
        ok = j;

      elseif strcmp(InitialMatrix{i, j}, 'semi-furnished')
        FeatureMatrix(i, j) = 1;
        FeatureMatrix(i, j+1) = 0;
        v(i, 1) = 0;
        ok = j;

      elseif strcmp(InitialMatrix{i, j}, 'furnished')
        FeatureMatrix(i, j) = 0;
        FeatureMatrix(i, j+1) = 0;
        v(i, 1) = 0;
        ok = j;

      endif

    endfor
  endfor

  if ok == n-1
    for i = 1 : m

      FeatureMatrix(i, n+1) = FeatureMatrix(i, n);
      FeatureMatrix(i, n) = v(i, 1);

    endfor
  endif

endfunction
