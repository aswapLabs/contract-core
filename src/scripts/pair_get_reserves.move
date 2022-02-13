script {

    use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main() {
        let total_supply: u128 = Token::market_cap<LiquidityToken<Token1, Token2>>();

        Debug::print<u128>(&total_supply);
        let (a, b , c) = Pair::get_reserves<Token1, Token2>();

        Debug::print(&a);
        Debug::print(&b);
        Debug::print(&c);

        let bal1 = Account::balance<Token1>(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        Debug::print(&bal1);
        let bal2 = Account::balance<Token2>(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        Debug::print(&bal2);
    }
}