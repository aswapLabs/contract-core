script {

    use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {
        
        let liquidity_bal = Account::balance<LiquidityToken<Token1, Token2>>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        return;
        let liquidity_token = Account::withdraw<LiquidityToken<Token1, Token2>>(&account, liquidity_bal);

        let (token1, token2) = Pair::burn_liquidity_token<Token1, Token2>(liquidity_token);


        let value1 = Token::value<Token1>(&token1);
        let value2 = Token::value<Token2>(&token2);
        Debug::print(&value1);
        Debug::print(&value2);

        Account::deposit_to_self<Token1>(&account, token1);
        Account::deposit_to_self<Token2>(&account, token2);
        
        let bal1 = Account::balance<Token1>(@0x0A7B8DAb322448AF454FccAfFBCbF247);
        let bal2 = Account::balance<Token2>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal1);
        Debug::print(&bal2);


    }
}