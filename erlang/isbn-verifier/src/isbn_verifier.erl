-module(isbn_verifier).

-export([is_valid/1]).


is_valid(ISBN_STRING) ->
  DIGIT_LIST = create_digit_list(ISBN_STRING, 0, []),
  % ISBN10
  case 10 == length(DIGIT_LIST) of
    true -> formula(DIGIT_LIST, 10, 0);
    false -> false
  end.

formula(_, FACTOR, SUM) when 0 == FACTOR ->
  0 == SUM rem 11;

formula([H|T], FACTOR, SUM) ->
  PRODUCT = H * FACTOR,
  formula(T, FACTOR-1, SUM+PRODUCT).

create_digit_list(ISBN_STRING, INDEX, DIGIT_LIST) ->
  % go through complete list
  case string:length(ISBN_STRING) > INDEX of
    true ->
      DIGIT_STRING = string:slice(ISBN_STRING, INDEX, 1),
      case isNumerical(DIGIT_STRING) of
        true ->
          DIGIT = list_to_integer(DIGIT_STRING),
          create_digit_list(ISBN_STRING, INDEX+1, lists:append(DIGIT_LIST,[DIGIT]));
        false ->
          LAST_CHAR = string:slice(string:reverse(ISBN_STRING), 0, 1),
          % check if X is last Char -> replace it with 10
          case ("X" == DIGIT_STRING) and ("X" == LAST_CHAR)
          of
            true ->
              DIGIT = 10,
              create_digit_list(ISBN_STRING, INDEX+1, lists:append(DIGIT_LIST,[DIGIT]));
            false ->
              create_digit_list(ISBN_STRING, INDEX+1, DIGIT_LIST)
          end
      end;
    false ->
      DIGIT_LIST
  end.


isNumerical(String) ->
  case re:run(String, "[0-9]+") of
    {match, _} -> true;
    nomatch    -> false
  end.