script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::AS;
    use 0x1::Debug;

    fun main(account: signer) {
        AS::init(account);

        let total_supply = AS::total_supply();
        let balance = AS::balance_of(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        let decimals = AS::decimals();

        Debug::print(&total_supply);
        Debug::print(&balance);
        Debug::print(&decimals);
    }

}