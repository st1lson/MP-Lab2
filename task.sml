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

fun dates_in_month(dates : (int * int * int) list, m : int) =
    if null dates
    then []
    else
        if #2 (hd dates) <> m
        then dates_in_month(tl dates, m)
        else (hd dates)::dates_in_month(tl dates, m);

fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then []
    else
        if null (tl months)
        then dates_in_month(dates, hd months)
        else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

fun get_nth(list: string list, n: int) =
    if n = 1 then hd(list)
    else get_nth(tl(list), n - 1);

val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
fun date_to_string(date: (int * int * int)) =
    get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date);

fun number_before_reaching_sum(sum: int, integers: int list) =
    let fun reaching_sum(count: int, currSum: int, integers : int list) =
        if (currSum + hd integers >= sum)
        then count
        else reaching_sum(count + 1, currSum + hd integers, tl integers)
    in
        reaching_sum(0, 0, integers)
    end;

fun what_month(day: int) =
    number_before_reaching_sum(day, [31, 28, 31, 30, 31, 31, 30, 31, 30, 31, 30, 31]) + 1;

fun month_range(day1: int, day2: int) =
    if day1 > day2
    then []
    else what_month(day1)::month_range(day1+1, day2);