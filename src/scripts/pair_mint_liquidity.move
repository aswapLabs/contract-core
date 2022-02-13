script {

    // use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {
        let token1 = Account::withdraw<Token1>(&account, 1000000000);
        let token2 = Account::withdraw<Token2>(&account, 2000000000);

        let liquidity_token = Pair::mint_liquidity_token<Token1, Token2>(
            token1,
            token2
        );

        Account::deposit_to_self<LiquidityToken<Token1, Token2>>(&account, liquidity_token);
        
        let bal = Account::balance<LiquidityToken<Token1, Token2>>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal);


    }
}