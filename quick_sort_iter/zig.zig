const std = @import("std");

const MOD_VALUE: f64 = 2147483647;

fn swap(A: []i32, i: isize, j: isize) void {
    var temp = A[@intCast(i)];
    A[@intCast(i)] = A[@intCast(j)];
    A[@intCast(j)] = temp;
}

fn partition(A: []i32, lo: isize, hi: isize) isize {
    var pivot = A[@intCast(hi)];
    var i: isize = lo - 1;

    for (@intCast(lo)..@intCast(hi)) |j| {
        if (A[j] <= pivot) {
            i += 1;
            swap(A, i, @intCast(j));
        }
    }

    i += 1;
    swap(A, i, hi);

    return i;
}

const StackItem = struct {
    lo: isize,
    hi: isize,
};

fn quick_sort(A: []i32, _lo: isize, _hi: isize, alloc: anytype) !void {
    var p: isize = undefined;
    var lo = _lo;
    var hi = _hi;

    var stack = std.ArrayList(StackItem).init(alloc);
    try stack.append(.{ .lo = lo, .hi = hi });

    while (stack.items.len > 0) {
        var tmp = stack.pop();
        lo = tmp.lo;
        hi = tmp.hi;

        if (lo >= hi or lo < 0) {
            continue;
        }

        p = partition(A, lo, hi);

        try stack.append(.{ .lo = lo, .hi = p - 1 });
        try stack.append(.{ .lo = p + 1, .hi = hi });
    }
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();

    var args = try std.process.argsAlloc(alloc);
    if (args.len != 5) {
        std.debug.print("Needs 4 arguments: length, mult, add, init.\n", .{});
    }

    var length = try std.fmt.parseInt(usize, args[1], 10);
    var mult = try std.fmt.parseFloat(f64, args[2]);
    var add = try std.fmt.parseFloat(f64, args[3]);
    var current = try std.fmt.parseFloat(f64, args[4]);

    var toSort = try alloc.alloc(i32, length);

    for (0..length) |i| {
        current = current * mult + add;
        while (current > MOD_VALUE) {
            current -= MOD_VALUE;
        }
        toSort[i] = @intFromFloat((current - std.math.floor(current)) * 256);
    }

    try quick_sort(toSort, 0, @intCast(length - 1), alloc);
    std.debug.print("zig", .{});

    if (length < 11) {
        std.debug.print(":", .{});
        for (toSort) |item| {
            std.debug.print(" {d}", .{item});
        }
    }
    std.debug.print("\n", .{});
}
