const std = @import("std");

pub fn main() !void {
    var args = std.process.args();
    _ = args.skip();

    var count: u64 = undefined;
    if (args.next()) |str| {
        count = try std.fmt.parseInt(u64, str, 10);
    } else {
        std.debug.print("Needs one argument: iterations.\n", .{});
    }

    var file = try std.fs.cwd().createFile("test.txt", .{});
    defer file.close();
    var writer = file.writer();

    for (0..count) |i| {
        try writer.print("{d}\n", .{i});
    }

    std.debug.print("zig\n", .{});
}
