const std = @import("std");

pub fn deriv(x: f64, y: f64) f64 {
    // using pow is slow AF
    //return std.math.pow(f64, x, 2) + 3 * std.math.pow(f64, y, 2) - 5;
    return x * x + 3 * y * y - 5;
}

pub fn improved_eulers_method(d: *const fn (x: f64, y: f64) f64, delta_x: f64, x_start: f64, x_end: f64, y_start: f64) f64 {
    var y = y_start;
    var x = x_start;

    while (x < x_end) {
        var k1 = d(x, y);
        var u = y + delta_x * k1;
        var k2 = d(x + delta_x, u);
        y = y + delta_x * (k1 + k2) / 2;
        x += delta_x;
    }

    return y;
}

pub fn main() !void {
    var x_start: f64 = 0;
    var x_end: f64 = 2;
    var y_start: f64 = 0;

    var delta_x: f64 = undefined;

    var args = std.process.args();
    _ = args.skip();
    if (args.next()) |arg| {
        delta_x = try std.fmt.parseFloat(f64, arg);
    } else {
        std.debug.print("Needs one argument: delta_x.\n", .{});
        return;
    }

    if (delta_x <= 0) {
        std.debug.print("Argument delta_x should be greater than 0.\n", .{});
        return;
    }

    var approx = improved_eulers_method(deriv, delta_x, x_start, x_end, y_start);

    std.debug.print("zig: {}\n", .{approx});
}
