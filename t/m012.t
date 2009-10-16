#!perl -w

BEGIN { eval { require bytes; }; }
use strict;
no strict "vars";

use Date::Calc::Object qw(:all);

# ======================================================================
#   (Normalized Mode - Miscellaneous)
# ======================================================================

$tests = (17 + 20) * 4;

print "1..$tests\n";

$n = 1;

Date::Calc->normalized_mode(1);
Date::Calc->accurate_mode(0);

Date::Calc->date_format(1);
Date::Calc->delta_format(1);

&try( [2008, 1, 3], [2009, 8,21], [ 1, 7,18] ); # 01
&try( [2009, 8,26], [2011, 7,27], [ 1,11, 1] ); # 02
&try( [1964, 1, 3], [2009, 8,26], [45, 7,23] ); # 03
&try( [2009, 1,31], [2009, 2,28], [ 0, 0,28] ); # 04
&try( [2009, 2,28], [2009, 3,31], [ 0, 1, 3], [0, -1,  0] ); # 05
&try( [2008, 1,31], [2009, 1, 1], [ 0,11, 1] ); # 06
&try( [2008, 2,29], [2009, 2, 1], [ 0,11, 3], [0,-11, -1] ); # 07
&try( [2008, 3,31], [2009, 3, 1], [ 0,11, 1] ); # 08
&try( [1996, 2,29], [1997, 2,28], [ 1, 0, 0], [0,-11,-28] ); # 09
&try( [2009, 1,31], [2009, 3, 2], [ 0, 0,30] ); # 10
&try( [2009, 1,30], [2009, 3, 1], [ 0, 0,30] ); # 11
&try( [2008, 1,31], [2008, 3, 1], [ 0, 0,30] ); # 12
&try( [2008, 2,15], [2008, 3,15], [ 0, 0,29] ); # 13
&try( [2009, 2,15], [2009, 3,15], [ 0, 0,28] ); # 14
&try( [2007, 2, 1], [2008, 1,31], [ 0,11,30], [0,-11,-27] ); # 15
&try( [2007, 2,28], [2008, 1, 1], [ 0,10, 4], [0,-10, -1] ); # 16
&try( [2008, 1,31], [2009, 2, 1], [ 1, 0, 1] ); # 17

&try( [2008, 1, 3,  0,  0,  0], [2009, 8,21, 23, 59, 59], [ 1, 7,18, 23, 59, 59] ); # 01
&try( [2009, 8,26,  0,  0,  0], [2011, 7,27,  0,  0,  0], [ 1,11, 1,  0,  0,  0] ); # 02
&try( [1964, 1, 3, 11,  7, 55], [2009, 8,26,  8, 39, 40], [45, 7,22, 21, 31, 45] ); # 03
&try( [2009, 1,31, 23, 59, 59], [2009, 2,28,  0,  1,  0], [ 0, 0,27,  0,  1,  1] ); # 04
&try( [2009, 2,28,  0,  0,  2], [2009, 3,31,  0,  0,  1], [ 0, 1, 2, 23, 59, 59], [0,0,-30,-23,-59,-59] );   # 05
&try( [2009, 2,28,  0,  0,  2], [2009, 3, 1,  0,  0,  1], [ 0, 0, 0, 23, 59, 59] ); # 06
&try( [2009, 1, 1,  0,  0,  2], [2009, 2, 1,  0,  0,  1], [ 0, 0,30, 23, 59, 59] ); # 07
&try( [2008, 2,29,  0,  0,  2], [2009, 2,28,  0,  0,  1], [ 0,11,29, 23, 59, 59], [0,-11,-27,-23,-59,-59] ); # 08
&try( [2008, 1,31, 23, 59, 58], [2009, 1, 1,  0,  0,  1], [ 0,11, 0,  0,  0,  3] ); # 09
&try( [2008, 2,29,  0,  2,  0], [2009, 2, 1,  0,  0,  1], [ 0,11, 2, 23, 58,  1], [0,-11,0,-23,-58,-1] );    # 10
&try( [2008, 3,31,  0,  2,  0], [2009, 3, 1,  0,  0,  1], [ 0,11, 0, 23, 58,  1] ); # 11
&try( [1996, 2,29,  8, 11, 27], [1997, 2,28, 16, 45, 10], [ 1, 0, 0,  8, 33, 43], [0,-11,-28,-8,-33,-43] );  # 12
&try( [2009, 1,31, 23, 59, 59], [2009, 3, 2,  0,  0,  1], [ 0, 0,29,  0,  0,  2] ); # 13
&try( [2009, 1,30, 23, 59, 59], [2009, 3, 1,  0,  0,  1], [ 0, 0,29,  0,  0,  2] ); # 14
&try( [2008, 1,31, 23, 59, 59], [2008, 3, 1,  0,  0,  1], [ 0, 0,29,  0,  0,  2] ); # 15
&try( [2008, 2,15, 23, 59, 59], [2008, 3,15,  0,  0,  1], [ 0, 0,28,  0,  0,  2] ); # 16
&try( [2009, 2,15,  0,  0,  0], [2009, 3,15,  0,  0,  0], [ 0, 0,28,  0,  0,  0] ); # 17
&try( [2007, 2, 1,  0,  0,  1], [2008, 1,31,  0,  0,  0], [ 0,11,29, 23, 59, 59], [0,-11,-26,-23,-59,-59] ); # 18
&try( [2007, 2,28,  0,  2,  0], [2008, 1, 1,  0,  0,  1], [ 0,10, 3, 23, 58,  1], [0,-10,0,-23,-58,-1] );    # 19
&try( [2008, 1,31,  0,  0,  0], [2009, 2, 1,  0,  1,  0], [ 1, 0, 1,  0,  1,  0] ); # 20

sub try
{
    my($d1) = shift;
    my($d2) = shift;
    my($dd) = shift;
    my($tt,$cc);

    $d1 = Date::Calc->new(0,@{$d1});
    $d2 = Date::Calc->new(0,@{$d2});
    $dd = Date::Calc->new(1,@{$dd});
    $tt = $d2 - $d1;
    $cc = $d1 + $tt;
    if ($tt eq $dd)
    {print "ok $n\n";} else {print "not ok $n\n($tt) != ($dd)\n";} # 01
    $n++;
    if ($cc eq $d2)
    {print "ok $n\n";} else {print "not ok $n\n($cc) != ($d2)\n";} # 02
    $n++;
    if (@_ > 0) { $dd = shift; $dd = Date::Calc->new(1,@{$dd}); }
    else
    {
        $dd->[1] = -$dd->[1];
        $dd->[2] = -$dd->[2];
        $dd->[3] = -$dd->[3];
        if ($dd->is_long())
        {
            $dd->[4] = -$dd->[4];
            $dd->[5] = -$dd->[5];
            $dd->[6] = -$dd->[6];
        }
    }
    $tt = $d1 - $d2;
    $cc = $d2 + $tt;
    if ($tt eq $dd)
    {print "ok $n\n";} else {print "not ok $n\n($tt) != ($dd)\n";} # 03
    $n++;
    if ($cc eq $d1)
    {print "ok $n\n";} else {print "not ok $n\n($cc) != ($d1)\n";} # 04
    $n++;
}

__END__

