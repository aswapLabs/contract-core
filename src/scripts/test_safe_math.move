script {

    // use 0x1::Math;
    use 0x1::Debug;
    use 0x1::Math;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;

       
    fun main() {
        let a:u128 = (1 << 67) + 13;
        let b:u128 = (1 << 68) + 13;
        let c:u128 = 1 << 69 + 10;

        Debug::print(&r1);

        // x < u64 && y < u64


        let r3 = SafeMath::sqrt(a);
        let r4 = Math::sqrt(a);

        Debug::print(&r3);
        Debug::print(&r4);

    }


}