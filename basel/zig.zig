const std = @import("std");

pub fn main() !void {
    var args = std.process.args();

    _ = args.skip();
    var countStr = args.next();
    var count: u64 = undefined;
    if (countStr) |str| {
        count = try std.fmt.parseInt(u64, str, 10);
    } else {
        std.debug.print("Needs one argument: iterations.\n", .{});
        return;
    }

    var pi: f64 = 0;

    for (1..count + 1) |i| {
        pi += 1 / @as(f64, @floatFromInt(i * i));
    }

    pi = std.math.sqrt(pi * 6);
    std.debug.print("zig: {}\n", .{pi});

    return;
}
