// SPDX-License-Identifier: GPL-3.0

address 0x0A7B8DAb322448AF454FccAfFBCbF247 {
module Pair {
    use 0x1::Math;
    use 0x1::Event;
    use 0x1::Signer;
    use 0x1::Account;
    use 0x1::Timestamp;
    use 0x1::Token::{Self, Token};
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Fee;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::UQ96x96;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::SafeMath;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::Account as LibraryAccount;
    use 0x0A7B8DAb322448AF454FccAfFBCbF247::LiquidityToken::{Self, LiquidityToken};

    // friend 0x0A7B8DAb322448AF454FccAfFBCbF247::Factory;
    const MINIMUM_LIQUIDITY: u128 = 1000;

    const E_TOKEN_VALUE_CANT_BE_ZERO:u64 = 5;
    const E_SWAP_TOKEN_OUT_CANT_BE_ZERO:u64 = 6;
    const E_SWAP_TOKEN_OUT_CANT_LARGE_THAN_RESERVE:u64 = 6;
    const E_K_ERROR:u64 = 7;
    const E_PAIR_NOT_EXISTS:u64 = 9;

    // Event emitted when add token liquidity.
    struct AddLiquidityEvent has drop, store {
        /// liquidity value by user X and Y type
        liquidity: u128,
        /// token code of X type
        token_x_code: Token::TokenCode,
        /// token code of X type
        token_y_code: Token::TokenCode,
        /// signer of add liquidity
        addr: address,
        amount_x_desired: u128,
        amount_y_desired: u128,
        amount_x_min: u128,
        amount_y_min: u128,
    }

    /// Event emitted when remove token liquidity.
    struct RemoveLiquidityEvent has drop, store {
        /// liquidity value by user X and Y type
        liquidity: u128,
        /// token code of X type
        token_x_code: Token::TokenCode,
        /// token code of X type
        token_y_code: Token::TokenCode,
        /// signer of remove liquidity
        addr: address,
        amount_x_min: u128,
        amount_y_min: u128,
    }

    /// Event emitted when token swap.
    struct SwapEvent has drop, store {
        /// token code of X type
        token_x_code: Token::TokenCode,
        /// token code of X type
        token_y_code: Token::TokenCode,
        amount_x_in: u128,
        amount_y_out: u128,
        addr: address,
    }

    // store token x and token y 
    struct Pair<TokenTypeX: store, TokenTypeY: store> has key, store {
        token_x_pool: Token<TokenTypeX>,                      // token x reserve
        token_y_pool: Token<TokenTypeY>,                      // token y reserve
        token_x_reserve: u128,
        token_y_reserve: u128,
        last_block_timestamp: u64,                                      // last swap time
        last_price_x_cumulative: u128,                                  // 
        last_price_y_cumulative: u128,
        last_k: u128,                                                   // last k
        add_liquidity_event: Event::EventHandle<AddLiquidityEvent>,     // 
        remove_liquidity_event: Event::EventHandle<RemoveLiquidityEvent>,
        swap_event: Event::EventHandle<SwapEvent>,
    }


    // initial swap pair info
    fun make_pair<TokenTypeX: store, TokenTypeY: store>(account: &signer) : Pair<TokenTypeX, TokenTypeY> {
        Pair<TokenTypeX, TokenTypeY>{
            token_x_pool: Token::zero<TokenTypeX>(),
            token_y_pool: Token::zero<TokenTypeY>(),
            token_x_reserve: 0u128,
            token_y_reserve: 0u128,
            last_block_timestamp: 0u64,
            last_price_x_cumulative: 0u128,
            last_price_y_cumulative: 0u128,
            last_k: 0u128,
            add_liquidity_event: Event::new_event_handle<AddLiquidityEvent>(account),     // 
            remove_liquidity_event: Event::new_event_handle<RemoveLiquidityEvent>(account),
            swap_event: Event::new_event_handle<SwapEvent>(account),
        }
    }

    // need to move to admin
    // can be friend strict mode
    public fun register_pair<TokenTypeX: store, TokenTypeY: store>(account: &signer) {
        // register liquidity token
        LiquidityToken::register_liquidity_token<TokenTypeX, TokenTypeY>(account);

        // make pair
        let pair = make_pair<TokenTypeX, TokenTypeY>(account);
        move_to(account, pair);
    }

    /// Check if swap pair exists
    public fun pair_exists<TokenTypeX: store, TokenTypeY: store>(): bool {
        let admin_address = LibraryAccount::admin_address();
        exists<Pair<TokenTypeX, TokenTypeY>>(admin_address)
    }

    // swap token
    public fun mint_liquidity_token<TokenTypeX: store, TokenTypeY: store>(
        token_x: Token<TokenTypeX>,
        token_y: Token<TokenTypeY>
    ): Token<LiquidityToken<TokenTypeX, TokenTypeY>> 
     acquires Pair {
        let total_supply: u128 = Token::market_cap<LiquidityToken<TokenTypeX, TokenTypeY>>();
        let (token_x_reserve, token_y_reserve, _) = get_reserves<TokenTypeX, TokenTypeY>();

        let token_x_value = Token::value<TokenTypeX>(&token_x);
        let token_y_value = Token::value<TokenTypeY>(&token_y);
        assert(token_x_value > 0 &&  token_y_value > 0, E_TOKEN_VALUE_CANT_BE_ZERO);

        let fee_on = mint_fee<TokenTypeX, TokenTypeY>(token_x_reserve, token_y_reserve);


        let liquidity = if (total_supply == 0) {
            // 1000 is the MINIMUM_LIQUIDITY
            // sqrt(x*y) - 1000
            SafeMath::safe_mul_sqrt((token_x_value as u128), (token_y_value as u128)) - MINIMUM_LIQUIDITY
        } else {
            let total_x_liquidity = SafeMath::safe_mul_div(token_x_value, total_supply, token_x_reserve);
            let total_y_liquidity = SafeMath::safe_mul_div(token_y_value, total_supply, token_y_reserve);
            // use smaller one.
            if (total_x_liquidity < total_y_liquidity) {
                total_x_liquidity
            } else {
                total_y_liquidity
            }
        };

        let admin_address = LibraryAccount::admin_address();
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(admin_address);
        Token::deposit(&mut pair.token_x_pool, token_x);
        Token::deposit(&mut pair.token_y_pool, token_y);

        
        let liquidity_token = LiquidityToken::mint_with_capability<TokenTypeX, TokenTypeY>(admin_address, liquidity);
        update_pair<TokenTypeX, TokenTypeY>(token_x_reserve, token_y_reserve, fee_on);
        liquidity_token
    }

    public fun burn_liquidity_token<TokenTypeX: store, TokenTypeY: store>(
        token: Token<LiquidityToken<TokenTypeX, TokenTypeY>>,
    ): (Token<TokenTypeX>, Token<TokenTypeY>) acquires Pair {
        let admin_address = LibraryAccount::admin_address();
        let token_value = (Token::value(&token) as u128);
        assert(token_value > 0, E_TOKEN_VALUE_CANT_BE_ZERO);

        let (token_x_reserve, token_y_reserve, _) = get_reserves<TokenTypeX, TokenTypeY>();
        let fee_on = mint_fee<TokenTypeX, TokenTypeY>(token_x_reserve, token_y_reserve);
        
        let total_supply = Token::market_cap<LiquidityToken<TokenTypeX, TokenTypeY>>();
        let x =  SafeMath::safe_mul_div(token_value, token_x_reserve, total_supply);
        let y = SafeMath::safe_mul_div(token_value, token_y_reserve, total_supply);
        assert(x > 0 && y > 0, E_TOKEN_VALUE_CANT_BE_ZERO);

        // burn lp token
        LiquidityToken::burn_with_capability<TokenTypeX, TokenTypeY>(admin_address, token);

        let token_pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(admin_address);
        let token_x = Token::withdraw(&mut token_pair.token_x_pool, x);
        let token_y = Token::withdraw(&mut token_pair.token_y_pool, y);

        update_pair<TokenTypeX, TokenTypeY>(token_x_reserve, token_y_reserve, fee_on);
        (token_x, token_y)
    }

    /// Get reserves of a token pair.
    /// The order of type args should be sorted.
    public fun get_reserves<TokenTypeX: store, TokenTypeY: store>(): (u128, u128, u64) acquires Pair {
        let admin_addr = LibraryAccount::admin_address();
        assert(exists<Pair<TokenTypeX, TokenTypeY>>(admin_addr), E_PAIR_NOT_EXISTS);
        let pair = borrow_global<Pair<TokenTypeX, TokenTypeY>>(admin_addr);
        (pair.token_x_reserve, pair.token_y_reserve, pair.last_block_timestamp)
    }

    /// Get valus of a token pair.
    /// The order of type args should be sorted.
    public fun get_balances<TokenTypeX: store, TokenTypeY: store>(addr: address): (u128, u128) acquires Pair {
        let pair = borrow_global<Pair<TokenTypeX, TokenTypeY>>(addr);
        let token_x_balance = (Token::value(&pair.token_x_pool) as u128);
        let token_y_balance = (Token::value(&pair.token_y_pool) as u128);
        (token_x_balance, token_y_balance)
    }

    public fun swap<TokenTypeX: store, TokenTypeY: store>(
        token_x_in: Token<TokenTypeX>,
        amount_x_out: u128,
        token_y_in: Token<TokenTypeY>,
        amount_y_out: u128
    ): (Token<TokenTypeX>, Token<TokenTypeY>) acquires Pair {
        make_swap<TokenTypeX, TokenTypeY>(token_x_in, amount_x_out, token_y_in, amount_y_out, true)
    }

    // make swap action 
    fun make_swap<TokenTypeX: store, TokenTypeY: store>(
        token_x_in: Token<TokenTypeX>,
        amount_x_out: u128,
        token_y_in: Token<TokenTypeY>,
        amount_y_out: u128,
        swap_fee: bool,
    ): (Token<TokenTypeX>, Token<TokenTypeY>) acquires Pair {
        // 
        let token_x_value = Token::value(&token_x_in);
        let token_y_value = Token::value(&token_y_in);

        assert(token_x_value > 0 || token_y_value > 0, E_TOKEN_VALUE_CANT_BE_ZERO);
        assert(amount_x_out > 0 || amount_y_out > 0, E_SWAP_TOKEN_OUT_CANT_BE_ZERO);

        let (token_x_reserve, token_y_reserve, _) = get_reserves<TokenTypeX, TokenTypeY>();
        assert(amount_x_out < token_x_reserve && amount_y_out < token_y_reserve, E_SWAP_TOKEN_OUT_CANT_LARGE_THAN_RESERVE);

        let admin_address = LibraryAccount::admin_address();
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(admin_address);
        Token::deposit<TokenTypeX>(&mut pair.token_x_pool, token_x_in);
        Token::deposit<TokenTypeY>(&mut pair.token_y_pool, token_y_in);

        let token_x_out = Token::withdraw<TokenTypeX>(&mut pair.token_x_pool, amount_x_out);
        let token_y_out = Token::withdraw<TokenTypeY>(&mut pair.token_y_pool, amount_y_out);

        let (token_x_balance, token_y_balance) = get_balances<TokenTypeX, TokenTypeY>(admin_address);
            {
                let (token_x_adjusted, token_y_adjusted);
                if (swap_fee) {
                    token_x_adjusted = token_x_balance * 1000 - token_x_value * 3;
                    token_y_adjusted = token_y_balance * 1000 - token_y_value * 3;
                } else {
                    token_x_adjusted = token_x_balance * 1000;
                    token_y_adjusted = token_y_balance * 1000;
                };
                // 18-bit precesion token to avoid overflow
                // x_adjusted, y_adjusted >= x_reserve, y_reserve * 1000000
                assert(SafeMath::safe_more_than_or_equal(token_x_adjusted, token_y_adjusted, token_x_reserve, token_y_reserve * 1000000), E_K_ERROR);
            };

        update_pair<TokenTypeX, TokenTypeY>(token_x_reserve, token_y_reserve, false);
        (token_x_out, token_y_out)
    }

     // update reserves and, on the first call per block, price accumulators
    fun update_pair<TokenTypeX: store, TokenTypeY: store>(
        token_x_reserve: u128,
        token_y_reserve: u128,
        fee_on: bool,
    ) acquires Pair {
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(LibraryAccount::admin_address());
        let last_block_timestamp = pair.last_block_timestamp;
        // timestamp less than U32
        let block_timestamp = (Timestamp::now_seconds() % 1<<32);

        // little endian
        // safe to thansfer u128
        let time_elapsed = (block_timestamp - last_block_timestamp as u128);
        if (time_elapsed > 0 && token_x_reserve !=0 && token_y_reserve != 0){
            // u32 max is 4294967296
            // time_elapsed default less than u32
            // max(u96) * max(u32) = u128
            pair.last_price_x_cumulative = pair.last_price_x_cumulative + (UQ96x96::uqdiv(token_y_reserve, token_x_reserve) * time_elapsed);
            pair.last_price_y_cumulative = pair.last_price_y_cumulative + (UQ96x96::uqdiv(token_x_reserve, token_y_reserve) * time_elapsed);
        };
        
        pair.token_x_reserve = Token::value(&pair.token_x_pool);
        pair.token_y_reserve = Token::value(&pair.token_y_pool);

        // value must less than u96
        assert(pair.token_x_reserve <= UQ96x96::u96_max(), 0);
        assert(pair.token_y_reserve <= UQ96x96::u96_max(), 0);

        pair.last_block_timestamp = block_timestamp;
        
        if (fee_on) {
            pair.last_k = pair.token_x_reserve *  pair.token_y_reserve;
        } 
    }

    /// Emit add liquidity event
    public fun emit_add_liquidity_event<TokenTypeX: store, TokenTypeY:store>(
        account: &signer,
        liquidity: u128,
        amount_x_desired: u128,
        amount_y_desired: u128,
        amount_x_min: u128,
        amount_y_min: u128,
    ) acquires Pair {
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(LibraryAccount::admin_address());
        Event::emit_event(&mut pair.add_liquidity_event, AddLiquidityEvent {
            token_x_code: Token::token_code<TokenTypeX>(),
            token_y_code: Token::token_code<TokenTypeY>(),
            addr: Signer::address_of(account),
            liquidity,
            amount_x_desired,
            amount_y_desired,
            amount_x_min,
            amount_y_min,
        });
    }

    /// Emit remove liquidity event
    public fun emit_remove_liquidity_event<TokenTypeX: store, TokenTypeY:store>(
        account: &signer,
        liquidity: u128,
        amount_x_min: u128,
        amount_y_min: u128,
    ) acquires Pair {
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(LibraryAccount::admin_address());
        Event::emit_event(&mut pair.remove_liquidity_event, RemoveLiquidityEvent {
            token_x_code: Token::token_code<TokenTypeX>(),
            token_y_code: Token::token_code<TokenTypeY>(),
            addr: Signer::address_of(account),
            liquidity,
            amount_x_min,
            amount_y_min,
        });
    }

    /// Emit swap event
    public fun emit_swap_event<TokenTypeX: store, TokenTypeY:store>(
        account: &signer,
        amount_x_in: u128,
        amount_y_out: u128,
    ) acquires Pair {
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(LibraryAccount::admin_address());
        Event::emit_event(&mut pair.swap_event, SwapEvent {
            token_x_code: Token::token_code<TokenTypeX>(),
            token_y_code: Token::token_code<TokenTypeY>(),
            addr: Signer::address_of(account),
            amount_x_in,
            amount_y_out,
        });
    }

    // mint fee to fee address
    // if fee_on is on
    fun mint_fee<TokenTypeX: store, TokenTypeY: store> (reserve_x: u128, reserve_y: u128): bool 
    acquires Pair {
        let (fee_on, fee_to) = Fee::get_fee();
        let pair = borrow_global_mut<Pair<TokenTypeX, TokenTypeY>>(LibraryAccount::admin_address());
        let k = *&pair.last_k;
        if (fee_on) {
            if(k != 0) {
                let rootK = SafeMath::safe_mul_sqrt(reserve_x, reserve_y);
                let rootKLast = (Math::sqrt(k) as u128);
                
                if (rootK > rootKLast) {
                    let total_supply: u128 = Token::market_cap<LiquidityToken<TokenTypeX, TokenTypeY>>();
                    let numerator = total_supply * (rootK - rootKLast);
                    let denominator = (rootK * 5) + rootKLast;
                    let liquidity = numerator / denominator;
                    if (liquidity > 0) {
                        let liquidity_token = LiquidityToken::mint_with_capability<TokenTypeX, TokenTypeY>(LibraryAccount::admin_address(), liquidity);
                        Account::deposit<LiquidityToken<TokenTypeX, TokenTypeY>>(fee_to, liquidity_token);
                    }
                }

            }
        } else if (k != 0) {
            pair.last_k = 0;
        };
        fee_on
    }

}

}