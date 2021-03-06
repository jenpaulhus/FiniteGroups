
samples := AssociativeArray();

function smalls(n, ids)
    return <SmallGroup(n, i) : i in ids>;
end function;

function trans(ids)
    return <TransitiveGroup(i[1], i[2]) : i in ids>;
end function;

function abels(ids)
    return <PCGroup(AbelianGroup(i)) : i in ids>;
end function;

function mat(n, p, gens)
    if p eq 0 then
        G := GL(n, IntegerRing());
    else
        G := GL(n, p);
    end if;
    return <sub<G | [G!gen : gen in gens]>>;
end function;

samples[120] := smalls(120, [4, 5, 15, 26, 28, 34]) cat
                trans([[5,5], [6, 14], [10, 11], [24, 201]]) cat
                abels([[120], [2, 60], [2, 2, 30]]) cat
                mat(3, 5, [[0, 1, 3, 2, 3, 0, 0, 1, 0], [0, 1, 4, 1, 0, 1, 0, 0, 1]]) cat
                mat(2, 5, [[4, 2, 4, 1], [3, 3, 4, 1]]) cat
                mat(2, 11, [[3, 0, 0, 3], [1, 4, 5, 10], [7, 10, 6, 4], [0, 6, 9, 10]]);
samples[128] := smalls(128, [1, 42, 160, 161, 162, 163, 937, 2024, 2209, 2326, 2327, 2328]) cat
                trans([[8, 35], [16, 215], [32, 436]]) cat
                abels([[128], [2, 2, 2, 2, 2, 2, 2], [4, 4, 8]]) cat
                mat(2, 193, [[45, 35, 79, 10], [1, 0, 192, 192]]) cat
                mat(2, 31, [[12, 30, 30, 0], [1, 12, 0, 30]]) cat
                mat(2, 17, [[15, 0, 0, 8], [0, 8, 15, 0], [13, 0, 0, 8]]) cat
                mat(4, 0, [[-1, 0, 0, 0,  0, 1, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [ 1, 0, 0, 0,  0,-1, 0, 0,  0, 0, 1, 0,  0, 0, 0,-1],
                           [ 1, 0, 0, 0,  0, 1, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [-1, 0, 0, 0,  0,-1, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [ 0, 0,-1, 0,  0, 0, 0,-1,  0,-1, 0, 0, -1, 0, 0, 0],
                           [ 0, 0, 1, 0,  0, 0, 0, 1,  1, 0, 0, 0,  0, 1, 0, 0]]);
samples[168] := smalls(168, [42, 43]) cat
                trans([[7, 5], [8, 36], [8, 37]]) cat
                mat(3, 2, [[0,1,0, 1,0,0, 1,1,1], [1,0,0, 0,0,1, 0,1,1]]);
samples[192] := smalls(192, [2, 7, 9, 963, 201, 1543]) cat
                trans([[12, 98], [12, 105], [24, 313]]) cat
                abels([[192], [2, 2, 2, 2, 2, 6], [2, 4, 24]]) cat
                mat(2, 97, [[14, 50, 47, 64], [0, 22, 22, 0]]) cat
                mat(2, 17, [[2, 0, 0, 2], [13, 0, 10, 4], [13, 7, 0, 4], [4, 2, 15, 12], [2, 4, 12, 15]]) cat
                mat(4, 0, [[ 1, 0, 0, 0,  0,-1, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [ 1, 0, 0, 0,  0,-1, 0, 0,  0, 0, 1, 0,  0, 0, 0,-1],
                           [-1, 0, 0, 0,  0,-1, 0, 0,  0, 0, 1, 0,  0, 0, 0, 1],
                           [-1, 0, 0, 0,  0,-1, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [ 0, 0, 1, 0,  0, 0, 0, 1,  1, 0, 0, 0,  0, 1, 0, 0],
                           [ 0, 1, 0, 0,  1, 0, 0, 0,  0, 0, 0, 1,  0, 0, 1, 0],
                           [ 1, 0, 0, 0,  0, 0, 0, 1,  0, 1, 0, 0,  0, 0, 1, 0]]);
samples[288] := smalls(288, [2, 6, 8, 851, 860, 889, 1025, 1026, 1045]) cat
                trans([[8, 42], [12, 125], [12, 127], [12, 128], [16, 709]]) cat
                abels([[288], [2, 2, 2, 2, 18], [2, 2, 2, 6, 6], [6, 6, 8]]) cat
                mat(2, 433, [[289, 236, 197, 53], [62, 388, 326, 371]]) cat
                mat(4, 0, [[1, 0, 0, 0,  0, 1, 0, 0,  0, 0, 1,-1,  0, 0, 1, 0],
                           [1,-1, 0, 0,  1, 0, 0, 0,  0, 0,-1, 0,  0, 0, 0,-1],
                           [0, 0, 1, 0,  0, 0, 0, 1,  1,-1, 0, 0,  0,-1, 0, 0],
                           [1, 0, 0, 0,  0, 1, 0, 0,  0, 0, 1,-1,  0, 0, 0,-1]]);
samples[320] := smalls(320, [2, 6, 8, 1635, 1582, 1640]) cat
                trans([[10, 23], [10, 24], [16, 711]]) cat
                abels([[320], [2, 4, 40], [2, 2, 2, 2, 2, 10]]) cat
                mat(5, 0, [[-1, 0, 0, 0, 0,  0,-1, 0, 0, 0,  0, 0, 1, 0, 0,  0, 0, 0,-1, 0,  0, 0, 0, 0,-1],
                           [ 1, 0, 0, 0, 0,  0, 1, 0, 0, 0,  0, 0,-1, 0, 0,  0, 0, 0,-1, 0,  0, 0, 0, 0, 1],
                           [ 1, 0, 0, 0, 0,  0, 1, 0, 0, 0,  0, 0,-1, 0, 0,  0, 0, 0, 1, 0,  0, 0, 0, 0,-1],
                           [-1, 0, 0, 0, 0,  0, 1, 0, 0, 0,  0, 0,-1, 0, 0,  0, 0, 0,-1, 0,  0, 0, 0, 0,-1],
                           [ 0, 1, 0, 0, 0,  0, 0, 1, 0, 0,  0, 0, 0, 1, 0,  0, 0, 0, 0, 1,  1, 0, 0, 0, 0],
                           [ 1, 0, 0, 0, 0,  0, 0, 1, 0, 0,  0, 0, 0, 0, 1,  0, 1, 0, 0, 0,  0, 0, 0, 1, 0]]);
samples[432] := smalls(432, [2, 4, 8, 228, 734]) cat
                trans([[9, 26], [12, 156], [18, 151]]);
samples[480] := smalls(480, [4, 159, 161, 218, 970, 1188, 1213]) cat
                trans([[16, 777], [20, 116], [20, 117], [24, 1353]]);
