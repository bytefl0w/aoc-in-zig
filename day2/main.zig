const std = @import("std");
const print = std.debug.print;
const ArrayList = std.ArrayList;

pub fn main() !void {
    std.debug.print("AoC Day2, woohoo!", .{});

    const arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // A better way of reading in files in Zig I think
    // Read in file
    var args = std.process.args();

    // Skipping program name
    _ = args.next();

    var file_name: []const u8 = "";
    if (args.next()) |f| {
        file_name = f;
    }

    const file = try std.fs.cwd().openFile(file_name, .{});
    defer file.close();

    const fize_size = try file.getEndPos();
    var txt_file = try allocator.alloc(u8, fize_size);
    _ = try file.read(txt_file);
}
