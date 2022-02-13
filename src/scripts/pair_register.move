script {

    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {

        Pair::register_pair<Token1, Token2>(&account);
         let is_exists = Pair::pair_exists<Token1, Token1>();
        assert(!is_exists, 1);
    }
}