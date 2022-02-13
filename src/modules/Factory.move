// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {

module Factory {

    use 0x1::Signer;
    use 0x1::Token;
    use 0x1::Vector;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee::init_fee;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Pair;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Account as LibraryAccount;

    const E_SYSTEM_ERROR:u64 =  1;
    const E_PIAR_ALREADY_EXISTS:u64 = 4;
    const E_TOKEN_CANT_SAME:u64 = 2;

    /** 
     * @dev save Pair token
     * pair(token_x, token_y) and (token_y, token_x)
     * for retrieve pairs exists, when add liquidity
     * if pair not exist, aswap will register when add liqudity
     */ 
    struct PairsTokenCode has store, drop, copy {
        tokencode_x: Token::TokenCode,
        token_x_precision: u128,
        tokencode_y: Token::TokenCode,
        token_y_precision: u128,
    }

    // all pairs 
    struct Pairs has key, store {
        pair: vector<PairsTokenCode>
    }

    // initial swap fee and fee recipient
    // only execute once when launched
    public(script) fun init(account: signer) {

        let admin_address = LibraryAccount::admin_address();
        assert(Signer::address_of(&account) == admin_address, E_SYSTEM_ERROR);

        init_fee(&account);

        let pairs = Pairs{ pair: Vector::empty<PairsTokenCode>() }; 

        move_to<Pairs>(&account, pairs);
    }

    /**
     * get all pairs length
     * one pairs has 2 type,(x, y) and (y, x)
     * we use aswap pair = (x < y) ? (x, y) : (y, x)  
     *
     * it's always an even number
     */
    public fun all_pairs_length(): u64 acquires Pairs {
        let pairs = borrow_global<Pairs>(LibraryAccount::admin_address());

        Vector::length<PairsTokenCode>(&pairs.pair)
    }

    // get all pairs
    public fun all_pairs(): vector<PairsTokenCode> acquires Pairs {
        let pairs = borrow_global<Pairs>(LibraryAccount::admin_address());
        *&pairs.pair
    }

    /** 
     * @dev collect pairs registered;
     * type <x y> and <y x> pairs 
     *
     */  
    fun add_pairs<TokenTypeX: store, TokenTypeY: store>(account: &signer) acquires Pairs {

        let addr = Signer::address_of(account);

        let tokencode_x = Token::token_code<TokenTypeX>();
        let token_x_precision = Token::scaling_factor<TokenTypeX>();

        let tokencode_y = Token::token_code<TokenTypeY>(); 
        let token_y_precision = Token::scaling_factor<TokenTypeY>();

        let token_x_copy = copy tokencode_x;
        let token_x_precision_copy = copy token_x_precision;

        let tokencode_y_copy = copy tokencode_y;
        let token_y_precision_copy = copy token_y_precision;

        let pairs_tokencode = PairsTokenCode {
            tokencode_x: tokencode_x,
            tokencode_y: tokencode_y,
            token_x_precision: token_x_precision,
            token_y_precision: token_y_precision,
        };

        let pairs_tokencode_reverse = PairsTokenCode {
            tokencode_x: tokencode_y_copy,
            tokencode_y: token_x_copy,
            token_x_precision: token_y_precision_copy,
            token_y_precision: token_x_precision_copy,
        };

        let pairs = borrow_global_mut<Pairs>(addr);
        Vector::push_back<PairsTokenCode>(&mut pairs.pair, pairs_tokencode);
        Vector::push_back<PairsTokenCode>(&mut pairs.pair, pairs_tokencode_reverse);
    }

    /**
     * create pair via factory
     * normally, pair itself and reverse will be created ,
     * 
     * it must be registerred by admin, 
     * so aswap have to request a centriallzed interface to do it
     * it's not good, we will solved it
     */
    public fun create_pair<TokenTypeX: store, TokenTypeY: store>(account: &signer) acquires Pairs {
        assert(!Token::is_same_token<TokenTypeX, TokenTypeY>(), E_TOKEN_CANT_SAME);

        assert(Signer::address_of(account) == LibraryAccount::admin_address(), E_SYSTEM_ERROR);

        
        let is_exists = Pair::pair_exists<TokenTypeX, TokenTypeY>();
        assert(!is_exists, E_PIAR_ALREADY_EXISTS);

        Pair::register_pair<TokenTypeX, TokenTypeY>(account);
        Pair::register_pair<TokenTypeY, TokenTypeX>(account);

        add_pairs<TokenTypeX, TokenTypeY>(account);
    }

}

}