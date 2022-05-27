fun is_older(first : (int * int * int), second : (int * int * int)) =
    if #1 first < #1 second
    then true
    else
        if #2 first < #2 second andalso #1 first = #1 second
        then true
        else
            if #3 first < #3 second andalso #1 first = #1 second andalso #2 first = #2 second
            then true
            else false;

fun number_in_month(dates : (int * int * int) list, month : int) =
    if null dates
    then 0
    else
        if #2 (hd dates) = month
        then 1 + number_in_month(tl dates, month)
        else 0 + number_in_month(tl dates, month);

fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then 0
    else
        if null (tl months)
        then number_in_month(dates, hd months)
        else number_in_month(dates, hd months) + number_in_months(dates, tl months);