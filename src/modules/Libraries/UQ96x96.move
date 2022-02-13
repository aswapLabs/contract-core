// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {
module UQ96x96 {

    // 32
    const Q96:u128 = 1u128 << 96;

    const E_NUMBER_OVERFLOW:u64 = 0;

    // a max is a96
    // timestamp max is u32
    public fun uqdiv(a: u128, b: u128): u128 {
        assert(a <= Q96 && b <= Q96, E_NUMBER_OVERFLOW);

        a/b 
    }

    public fun u96_max(): u128 {
        Q96
    }


    public fun encode(a: u128):u128 {
        assert(a <= Q96, E_NUMBER_OVERFLOW);
        a*1
    }



}
}