/*
Test Package: Codegen
Author: Admin
Time: 2020-01-25
Input:
=== input ===
=== end ===
Output:
=== output ===
=== end ===
ExitCode: 16
InstLimit: -1
Origin Package: Codegen Pretest-528
*/

int main() {
    int [] a = new int[4];
    a[0] = 10;
    int c = a[0]++;
    return c;
}

