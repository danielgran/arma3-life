/*
  Connects to RedisServer



*/



_stmt = format["redis:connect"];

_result = "A3Redis" callExtension _stmt;

_result;
