test('the base function exists', function() {
  ok(Screenrocket);
});

test('throws exception with no api key', function() {
  throws(
    function() {
      new Screenrocket();
    }
  );
});
