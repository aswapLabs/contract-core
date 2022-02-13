script {

    use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {
        let balance = Account::balance<LiquidityToken<Token1, Token2>>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&balance);

        let liquidity_token = Account::withdraw<LiquidityToken<Token1, Token2>>(&account, balance);
        let liquidity_value = Token::value<LiquidityToken<Token1, Token2>>(&liquidity_token);

        Debug::print(&liquidity_value);

        Account::deposit_to_self<LiquidityToken<Token1, Token2>>(&account, liquidity_token);

        let balance_end = Account::balance<LiquidityToken<Token1, Token2>>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&balance_end);

    }
}