script {

    use 0x1::Token;
    use 0x1::Debug;
    use 0x1::Account;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;
    // use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::LiquidityToken;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token1::Token1;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Token2::Token2;

    fun main(account: signer) {
        let token1 = Account::withdraw<Token1>(&account, 100000000);

        let (reserve_1, reserve_2 , _) = Pair::get_reserves<Token1, Token2>();
        Debug::print(&reserve_1);

        let amount_in_with_fee = 100000000 * 997;
        let denominator = reserve_1 * 1000 + amount_in_with_fee;
        let r = SafeMath::safe_mul_div(amount_in_with_fee, reserve_2, denominator);
        

        let (token_out_1, token_out_2) = Pair::swap<Token1, Token2>(
            token1,
            0,
            Token::zero<Token2>(),
            r,
        );

        let token1_value = Token::value<Token1>(&token_out_1);
        let token2_value = Token::value<Token2>(&token_out_2);

        if (token1_value == 0) {
            Token::destroy_zero<Token1>(token_out_1);
        } else {
            Account::deposit_to_self<Token1>(&account, token_out_1);
        };

        if (token2_value == 0) {
            Token::destroy_zero<Token2>(token_out_2);
        } else {
            Account::deposit_to_self<Token2>(&account, token_out_2);
        };

        
        let bal1 = Account::balance<Token1>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal1);

        let bal2 = Account::balance<Token2>(@0x0A7B8DAb322448AF454FccAfFBCbF247);

        Debug::print(&bal2);


    }
}


    // public fun swap<TokenTypeX: store, TokenTypeY: store>(
    //     token_x_in: Token<TokenTypeX>,
    //     amount_x_out: u128,
    //     token_y_in: Token<TokenTypeY>,
    //     amount_y_out: u128
    // ): (Token<TokenTypeX>, Token<TokenTypeY>) acquires Pair {