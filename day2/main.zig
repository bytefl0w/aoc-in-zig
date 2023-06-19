const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

const data = @embedFile("data.txtstd");

pub fn main() !void {
    std.debug.print("AoC Day2, woohoo!", .{});
    
    const arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();
}

