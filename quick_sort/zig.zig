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

fn quick_sort(A: []i32, lo: isize, hi: isize) void {
    if (lo >= hi or lo < 0) {
        return;
    }

    var p = partition(A, lo, hi);
    quick_sort(A, lo, p - 1);
    quick_sort(A, p + 1, hi);
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

    quick_sort(toSort, 0, @intCast(length - 1));
    std.debug.print("zig", .{});

    if (length < 11) {
        std.debug.print(":", .{});
        for (toSort) |item| {
            std.debug.print(" {d}", .{item});
        }
    }
    std.debug.print("\n", .{});
}
