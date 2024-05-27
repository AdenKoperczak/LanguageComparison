const std = @import("std");

pub fn main() !void {
    var args = std.process.args();
    _ = args.skip();

    var numberOfPrime: u64 = undefined;
    if (args.next()) |str| {
        numberOfPrime = try std.fmt.parseInt(u64, str, 10);
    } else {
        std.debug.print("Needs one argument: numberOfPrime.\n", .{});
        return;
    }

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const alloc = arena.allocator();

    var primes = std.ArrayList(u64).init(alloc);
    defer primes.deinit();

    try primes.append(2);
    try primes.append(3);

    var current: u64 = 4;

    while (primes.items.len < numberOfPrime) {
        var isPrime: bool = true;
        for (primes.items) |prime| {
            if (current % prime == 0) {
                isPrime = false;
                break;
            }
        }

        if (isPrime) {
            try primes.append(current);
        }

        current += 1;
    }

    std.debug.print("zig: {d}\n", .{primes.items[primes.items.len - 1]});
}
