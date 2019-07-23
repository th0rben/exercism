-module(pascals_triangle).

-export([rows/1, binomial_coeff/2]).


rows(Count) ->
  rows(0,[],Count).

rows(RowNumber, Rows, Count) when Count == RowNumber ->
  Rows;

rows(RowNumber, Rows, Count) ->
  Row = row(RowNumber, 0, []),
  case Rows == [] of
    true -> rows(RowNumber+1,[Row], Count);
    false -> rows(RowNumber+1,lists:append(Rows, [Row]), Count)
  end.

row(RowNumber, Index, Row) when RowNumber+1 == Index ->
  Row;

row(RowNumber, Index, Row) ->
  BinomialCoeff = binomial_coeff(RowNumber, Index),
  row(RowNumber, Index+1, lists:append(Row, [BinomialCoeff])).

binomial_coeff(N, K) ->
  case K > (N - K) of
    true -> binomial_coeff(N, N - K, 0, 1);
    false -> binomial_coeff(N, K, 0, 1)
  end.

binomial_coeff(_, K, Index, Result) when Index == K->
  trunc(Result);

binomial_coeff(N, K, Index, Result) ->
  NewResult = Result * (N - Index),
  NewNewResult = NewResult / (Index + 1),
  binomial_coeff(N, K, Index+1, NewNewResult).