const std = @import("std");
const expect = @import("std").testing.expect;

pub fn main() void {
    std.debug.print("Hi {s}\n", .{"mom!"});

    // Making variables
    const num : i32 = 4568; // to assign a variable
    _ = num;
    const num2 = @as(u32, 4568);// alternaive of that
    _ = num2;
    // also there is `i` and `u` which stand i=Z and u=+N
    //There is also `var` That can be used in place of const

    //arrays
    const arr1 = [5]u8{0, 1, 2, 3, 4};
    _ = arr1;
    const arr2 = [_]u8{0,1,2,3,4,5,6,7,8,9};
    const len_of_arr = arr2.len;
    _ = len_of_arr;

    // if else 

}