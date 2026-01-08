# Hash Puzzle – Explanation and Collision

## Goal

Given the custom hash function:

```python
hv = 0
pos = 0
for let in txt:
    pos = (pos % 4) + 1
    hv = (hv + (pos * ord(let))) % 1000000
```

We want **two different strings** that produce the same hash value (a collision).

Key idea:

- `pos` cycles through 1, 2, 3, 4, 1, 2, ...
- Hash value is just the sum of `pos * ASCII(letter)` modulo 1,000,000.
- So we need two different strings where the sum of `pos * ASCII(letter)` is equal.

One simple collision (computed and verified) is:

- String 1: `AAC`
- String 2: `ADA`

Both produce the same hash value of `396` with the given algorithm.

This illustrates:

- How collisions are possible in simple hash functions
- Why real-world cryptographic hashes must be much more complex
