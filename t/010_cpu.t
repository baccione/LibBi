use Test::More tests => 1;

is(system('libbi sample @test.conf') >> 8, 0, 'CPU');
