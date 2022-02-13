// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {
module Common {

    use 0x1::BCS;
    use 0x1::Token;
    use 0x1::Compare;

    const E_TOKEN_CAN_NOT_EQUAL:u64 = 2; 

    // Caller should call this function to determine the order of A, B
    const EQUAL: u8 = 0;
    const LESS_THAN: u8 = 1;
    const GREATER_THAN: u8 = 2;

    /**
     * @dev compare to tokens 
     *
     * @argsTypes TokenX 
     * @argsTypes TokenY 
     *
     * @returns bool
     */
    public fun compare_tokens<TokenTypeX: store, TokenTypeY: store>(): bool {
        let token_x_bytes = BCS::to_bytes<Token::TokenCode>(&Token::token_code<TokenTypeX>());
        let token_y_bytes = BCS::to_bytes<Token::TokenCode>(&Token::token_code<TokenTypeY>());
        let compare_result : u8 = Compare::cmp_bcs_bytes(&token_x_bytes, &token_y_bytes);

        // can be equal
        assert(compare_result > EQUAL, E_TOKEN_CAN_NOT_EQUAL);
        let b = if(compare_result == LESS_THAN) { true } else { false };
        b
    }
   
}
}

