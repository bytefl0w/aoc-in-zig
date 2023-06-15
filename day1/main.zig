// Need to keep an array of ints, each index is the elf

const std = @import("std");
const os = std.os;
const print = std.debug.print;
const data = @embedFile("data.txt");
const ArrayList = std.ArrayList;

pub fn main() !void {
    print("AoC Day1 Challenge - GO!\n\n", .{});
    //    const allocator = std.heap.page_allocator;

    // Read in the file and start parsing the file, adding the calories for each
    // index in the array
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    var elfs = ArrayList(u64).init(allocator);
    defer elfs.deinit();

    var lines = std.mem.split(u8, data, "\n");
    var sum: u64 = 0;

    while (lines.next()) |line| {
        if (std.fmt.parseInt(u64, line, 10)) |x| {
            sum = x + sum;
        } else |_| {
            try elfs.append(sum);
            print("Calories = {}\n+++++++++++\n", .{sum});
            sum = 0;
        }
    }
    var solution: u64 = 0;
    var largest_cal: u64 = 0;

    for (elfs.items, 0..) |number, index| {
        if (largest_cal < number) {
            largest_cal = number;
            solution = @as(u64, index);
        }
    }

    print("===\n{}\n{}\n===", .{ solution, largest_cal });
}
