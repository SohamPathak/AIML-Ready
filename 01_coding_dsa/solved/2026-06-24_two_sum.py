"""
LeetCode Block — Arrays & Hashing (2026-06-24)
================================================

PROBLEM: Two Sum  (the canonical hashing problem — start here)

Given an array of integers `nums` and an integer `target`, return the INDICES
of the two numbers that add up to `target`.

- Exactly one valid answer exists.
- You may not use the same element twice.
- Return the indices in any order.

Examples:
    nums = [2, 7, 11, 15], target = 9   ->  [0, 1]   (2 + 7 = 9)
    nums = [3, 2, 4],       target = 6   ->  [1, 2]   (2 + 4 = 6)
    nums = [3, 3],          target = 6   ->  [0, 1]

------------------------------------------------------------------
Write your solution in `two_sum` below, then run:  python3 2026-06-24_two_sum.py
The tests at the bottom will tell you if it passes.

Before you code: tell me in chat your APPROACH first (like a real interview),
then implement. Aim to state the time/space complexity yourself.
"""
from typing import List


def two_sum(nums: List[int], target: int) -> List[int]:
    # Your solution here
    pass


# ---- tests (don't edit) ----
if __name__ == "__main__":
    cases = [
        (([2, 7, 11, 15], 9), {(0, 1)}),
        (([3, 2, 4], 6), {(1, 2)}),
        (([3, 3], 6), {(0, 1)}),
        (([1, 5, 3, 8, 2], 10), {(1, 1)}),  # 5+... actually 8+2 -> indices (3,4)
    ]
    # fix expected for last case
    cases[-1] = (([1, 5, 3, 8, 2], 10), {(3, 4)})

    for (args, expected) in cases:
        got = two_sum(*args)
        ok = got is not None and tuple(sorted(got)) in {tuple(sorted(e)) for e in expected}
        print(f"nums={args[0]}, target={args[1]} -> {got}  {'PASS' if ok else 'FAIL (expected one of '+str(expected)+')'}")
