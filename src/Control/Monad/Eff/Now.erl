-module(control_monad_eff_now@foreign).
-export([now/0, nowOffset/0]).

now() ->
    fun() ->
        erlang:system_time(millisecond)
    end.

nowOffset() ->
    fun() ->
        {UTC, Local} = {calendar:universal_time(), calendar:local_time()},
        UTCSeconds = calendar:datetime_to_gregorian_seconds(UTC),
        LocalSeconds = calendar:datetime_to_gregorian_seconds(Local),
        (UTCSeconds - LocalSeconds) / 60
    end.
