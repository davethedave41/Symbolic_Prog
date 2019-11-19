%% count starts at 0

s --> u(0). 
u(C) --> [2], {HCount is C/2}, v(HCount).  
u(C) --> [0], {C1 is C+1}, u(C1).
u(C) --> [1], u(C).
v(0) --> [].
v(C) --> [1], {CM1 is C-1}, v(CM1).
v(C) --> [0], v(C).

s2 --> h1(0), h2(3), h3(6).
h1(ID1) --> col(ID1), {ID1_2 = 1}, nat(ID1_2), {ID1_3 = 2}, pet(ID1_3).
h2(ID2) --> col(ID2), {ID2_2 = 4}, nat(ID2_2), {ID2_3 = 5}, pet(ID2_3).
h3(ID3) --> col(ID3), {ID3_2 = 7}, nat(ID3_2), {ID3_3 = 8}, pet(ID3_3).
col(ID) --> {ID = 0};
            {ID = 3};
            {ID = 6}, [red].
col(ID) --> {ID = 0};
            {ID = 3};
            {ID = 6}, [blue].
col(ID) --> {ID = 0};
            {ID = 3};
            {ID = 6}, [green].
nat(ID) --> {ID = 1};
            {ID = 4};
            {ID = 7}, [english].
nat(ID) --> {ID = 1};
            {ID = 4};
            {ID = 7}, [spanish].
nat(ID) --> {ID = 1};
            {ID = 4};
            {ID = 7}, [japanese].
pet(ID) --> {ID = 2};
            {ID = 5};
            {ID = 8}, [zebra].
pet(ID) --> {ID = 2};
            {ID = 5};
            {ID = 8}, [jaguar].
pet(ID) --> {ID = 2};
            {ID = 5};
            {ID = 8}, [snail].            