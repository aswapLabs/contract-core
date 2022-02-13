// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {
module SafeMath {
    use 0x1::Math;
    use 0x1::Errors;

    // assume token number max is u96;
    // !attention : 1 << 64 -1 == 1 << 63 != (1 << 64) -1
    // u64 max == (1 << 64) - 1
    const Q64: u128 = 1 << 64;        // u64
    const Q32: u128 = 1 << 32;        // u32
    const Q16: u128 = 1 << 16;        // u16

    const EQUAL: u8 = 0;
    const LESS_THAN: u8 = 1;
    const GREATER_THAN: u8 = 2;

    const OVER_FLOW: u64 = 1001;
    const DIVIDE_BY_ZERO: u64 = 1002;

    // avoid over-flow 
    // to avoid x * y over-flow, but x * y / z is valid
    public fun safe_mul_div(x: u128, y: u128, z: u128): u128 {
        if ( z == 0) {
            abort Errors::invalid_argument(DIVIDE_BY_ZERO)
        };
        if (x < Q64 && y < Q64) {
            return x * y / z
        };
        // can't be fixed-point
        if (x >= z || y >= z) {
            return Math::mul_div(x, y, z)
        };

        // x max is u96 x min is u64, so plus u32
        if (x >= y) {
            x = x * Q32;
        } else {
            y = y * Q32;
        };
        let r = Math::mul_div(x, y, z);
        r / Q32
    }

    // safe compare to avoid over-flow 
    public fun safe_compare(x1: u128, y1: u128, x2: u128, y2: u128): u8 {
        let (r1, r2);
        if (x1 < Q64 && y1 < Q64 && x2 < Q64 && y2 < Q64) {
            r1 = x1 * y1;
            r2 = x2 * y2;
        } else {
            r1 = safe_mul_div(x1, y1, Q64);
            r2 = safe_mul_div(x2, y2, Q64);
            if (r1 == 0 && r2 == 0 ){
                r1 = x1 * y1;
                r2 = x2 * y2;
            };
        };

        if (r1 == r2) EQUAL
        else if (r1 < r2) LESS_THAN
        else GREATER_THAN
    }

    // compare x * y and x2 * y2
    // to avoid voer-flow and increate precision
    public fun safe_more_than_or_equal(x1: u128, y1: u128, x2: u128, y2: u128): bool {
        let r_order = safe_compare(x1, y1, x2, y2);
        if(EQUAL == r_order || GREATER_THAN == r_order){
            true
        } else {
            false
        }
    }

    // to avoid voer-flow and increate precision
    public fun safe_mul_sqrt(x: u128, y: u128): u128 {
        if (x < Q64 && y < Q64) {
            (Math::sqrt(x * y) as u128)
        } else {
            // sqrt(x*y) == sqrt(x) * sqrt(y)
            let r = safe_mul_div(x, y , Q32);
            (Math::sqrt(r) as u128) * Q16
        }
    }

    
    // computes square roots using the babylonian method
    // https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Babylonian_method
    public fun sqrt(x: u128): u64 {
         if (x == 0) {
             return 0
         };
        // this block is equivalent to r = uint256(1) << (BitMath.mostSignificantBit(x) / 2);
        // however that code costs significantly more gas
        let xx:u128 = x;
        let r:u128 = 1;
        // if (xx >= 0x100000000000000000000000000000000) {
        //     xx = xx >> 128;
        //     r = r << 64;
        // }
        // 1 << 64
        if (xx >= 0x10000000000000000) {
            xx = xx >> 64;
            r = r << 32;
        };
        // 1 << 32
        if (xx >= 0x100000000) {
            xx = xx >> 32;
            r = r << 16;
        };
        // 1 << 16
        if (xx >= 0x10000) {
            xx = xx >> 16;
            r = r << 8;
        };
        // 1 << 8
        if (xx >= 0x100) {
            xx = xx >> 8;
            r = r << 4;
        };
        // 1 << 4
        if (xx >= 0x10) {
            xx = xx >> 4;
            r = r << 2;
        };

        // 1 << 3
        if (xx >= 0x8) {
            r = r << 1;
        };
        // r = (r + x/r)/2
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1;
        r = (r + x / r) >> 1; // Seven iterations should be enough
        let r1:u128 = x / r;

        let result = if(r < r1) {
            r
        } else {
            r1
        }; 

        (result as u64)
    }


}
}