//! account: alice, 10000000000000 0x1::STC::STC
//! account: joe
//! account: admin, 0x3db7a2da7444995338a2413b151ee437, 10000000000000 0x1::STC::STC
//! account: liquidier, 10000000000000 0x1::STC::STC
//! account: exchanger
//! account: tokenholder, 0x49156896A605F092ba1862C50a9036c9


//! new-transaction
//! sender: tokenholder

script {

    // use 0x1::Debug;
    use 0x1::Math;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;

    // SafeMath::compare_tokens test
    // token1 < token2 
    fun safe_mul_div_test() {
        let r1 = SafeMath::safe_mul_div(100, 100, 10);

        assert(r1 == 1000, 0);

        // x < u64 && y < u64
        let r1: u128 = 1 << 64 -1  ;

        let r2: u128 = 1 << 63 ;

        let r3: u128 = (1 << 64) -1 ;

        assert(r1 == r2 && r1 != r3, 1);

        let r5: u128 = (1 << 64) -1;
        let r6: u128 = (1 << 64) - 1;
        let r7: u128 = 1 << 64;
        let r4: u128 = SafeMath::safe_mul_div( r5 , r6, r7);
        let r8: u128 = r5 * r6 / r7;

        assert(r4 == r8, 3);

        // x > u64  && y > u64 && (x > z || y > z)
        let r10: u128 = 1 << 65;
        let r11: u128 = 1 << 67;
        let r12: u128 = 1 << 20;

        let r13: u128 = SafeMath::safe_mul_div( r10 , r11, r12);
        // let r14: u128 = r10 * r11 / r12;          //error
        let r14  = Math::mul_div(r10, r11, r12);

        assert(r13 == r14, 4);


        // x > u64 && y > u64 && x < z && y < z
        let r20: u128 = 1 << 66;
        let r21: u128 = 1 << 67;
        let r22: u128 = 1 << 68;
        let r32: u128 = 1 << 32;
        let r23: u128 = SafeMath::safe_mul_div(r20 , r21, r22);

        let r24: u128 = Math::mul_div(r20, r21 * r32 , r22)/ r32 ;

        assert(r24 == r23, 5);      
    }

   
  
}
// check: EXECUTED


//! new-transaction
//! sender: tokenholder

script {

    use 0x1::Debug;
    //use 0x1::Math;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;

    // SafeMath::compare_tokens test
    // token1 < token2 
    fun safe_mul_sqrt_test() {
        let r1 = SafeMath::safe_mul_sqrt(10000, 10000);

        assert(r1 == 10000, 0);

        let r10: u128 = 1 << 63;
        let r11: u128 = 1 << 62;

        let r12: u128 = SafeMath::safe_mul_sqrt(r10, r11);
        Debug::print(&r12);
        
        let r13: u128 = r12 * r12;
        Debug::print(&r13);
        let r14: u128 = r10 * r11;
        Debug::print(&r14);

    }

   
  
}
// check: EXECUTED




//! new-transaction
//! sender: tokenholder

script {

    use 0x1::Math;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;

    // SafeMath::sqrt test
    // token1 < token2 
    fun safe_sqrt_test() {
        let a = 2;

        let r1:u64 = Math::sqrt(copy a);
        let r2:u64 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = 7;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);


        a = 13;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = (1 << 7) + 3 ;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = (1 << 15) + 3 ;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = (1 << 31) + 3 ;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = (1 << 46) + 3 ;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);

        a = (1 << 46) + 3 ;

        r1 = Math::sqrt(copy a);
        r2 = SafeMath::sqrt(a);

        assert(r1 == r2, 0);
    }

   
  
}
// check: EXECUTED